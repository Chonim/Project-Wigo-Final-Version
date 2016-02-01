<%@page import="org.jsoup.Jsoup"%>
<%@ include file="/WEB-INF/include/include-top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
</head>
<body onload="map(d3)">

<!-- 검색창 -->
      <br/>
      <div style="margin-left: 20%; margin-right: 20%;">
         <input type="text" value="" name="keyword" id="keyword" placeholder="'영화'를 검색해 보세요!" />
         <input type="button" onclick="searchValidate()" value="검색"/>
       
<!-- 검색어 공백이 아닐때만 마인드맵 로딩 -->
<script>
   function searchValidate(){
      if(document.getElementById('keyword').value == "") {
         alert("검색어를 입력하세요!");
         document.getElementById('keyword').focus();
         return false;
      } else {
           var keyword = $('#keyword').val();
            $.ajax ({
               type: "POST",
               url: "<c:url value='/common/search.do' />", // 데이터를 받을 페이지
               data: "keyword="+ keyword, // 보내고싶은 데이터
               cache: false,
               success: function(searchrs) {
                  map(d3, keyword, searchrs);
                  }
               });
         };
      }
</script>
       
<!-- 태그 추가 -->
         <input type="text" value="" name="addTag" id="addTag"/>
         <input type="button" onclick="addTagValidate()" value="태그추가" />
      </div>

<!-- 공백이 아닐때만 태그 추가가능함 -->
<script>
   function addTagValidate(){
      if(document.getElementById('addTag').value == "") {
         alert("추가할 태그를 입력하세요!");
         document.getElementById('addTag').focus();
         return false;
      } else {
           var keyword = $('#keyword').val();
           var addTag = $('#addTag').val();
            $.ajax ({
               type: "POST",
               url: "<c:url value='/common/addTag.do' />", // 데이터를 받을 페이지
               // 키워드랑 addtag 둘다 날려야 함
               data: "keyword="+ keyword +"&addTag=" + addTag,
               cache: false,
               success: function(searchrs) {
                  map(d3, keyword, searchrs);
                  alert("[" +keyword+ "] 키워드에 [" +addTag+ "] 태그가 추가되었습니다.");
                  document.getElementById('addTag').value = "";
                  }
               });
         };
      }
</script>
      
<!-- mindMap 영역 -->
<div style="width: 80%; margin-right: 20%;">
<div id="mindMap" style="float: left;"></div>

<!-- 게시판 영역 -->
<div class="container" id="container" style="width: 40%; float: right; padding-right: 0;">
    <h3>게시판 목록</h3>
        <a href="#this" id="write" >글쓰기</a>
    <table class="table table-hover">
        <colgroup>
            <col width="10%"/>
            <col width="*"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="25%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">조회수</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach var="row" items="${list}" varStatus="status">
                        <tr>
                            <td>${row.IDX }</td>
                            <td class="title">
                                <a href="#this" name="title">${row.TITLE }</a>
                                <input type="hidden" id="IDX" value="${row.IDX }">
                            </td>
                            <td>${row.HIT_CNT}</td>
                            <td>${row.CREA_ID}</td>   
                            <td>${fn:substring(row.CREA_DTM, 0, 10)}</td>
                        </tr>
                    </c:forEach>  
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>   
        </tbody>
    </table>
    
   <div class="pagination">
       <c:if test="${not empty paginationInfo}">
           <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
       </c:if>
    <input type="hidden" id="currentPageNo" name="currentPageNo"/>
    </div>
    
    </div>
     </div>

     
    <%@ include file="/WEB-INF/include/include-body.jsp" %>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#write").on("click", function(e){ //글쓰기 버튼
                e.preventDefault();
                fn_openBoardWrite();
            }); 
             
            $("a[name='title']").on("click", function(e){ //제목 
                e.preventDefault();
                fn_openBoardDetail($(this));
            });
        });
        
        function categorySearch(c) {
            $.ajax ({
       		type: "POST",
        	url: "<c:url value='/board/categorySearch.do' />", // 데이터를 받을 페이지
        	data: "c="+ c, // 보내고싶은 데이터
        	cache: false,
        	success: function(data) {
				$(".container").load("<c:url value='/WEB-INF/jsp/board/board.jsp'/>");
        	}
        	});
        };
        
        function fn_openBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardWrite.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardDetail.do' />");
            comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
            comSubmit.submit();
        }
         
        function fn_search(pageNo){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
            comSubmit.addParam("currentPageNo", pageNo);
            comSubmit.submit();
        }
        
      function map(d3, keyword, searchrs) {
    	 
    	 $("#mindMap").html("");
         var swatches = function(el) {
            var w = $(Window).width()*0.45;
            var h = $(Window).height()*0.55;
            
            // 화면에 출력되는 마인드맵 배열
            var nodes = [{ name : keyword }];

            // keyword 변수에 담긴     가/나/다/라 를   / 를 기준으로 쪼개서 배열 값 추가해주면 됨
            var searchrsSplit = searchrs.split("/");
               for(var i=0; i<searchrsSplit.length; i++) {
               nodes.push( {name : searchrsSplit[i] , target : [0] } );
              }
                        
            var circleWidth = 10;

            var palette = {
               "lightgray" : "#819090",
               "gray" : "#708284",
               "mediumgray" : "#536870",
               "darkgray" : "#475B62",
               "darkblue" : "#0A2933",
               "darkerblue" : "#042029",
               "paleryellow" : "#FCF4DC",
               "paleyellow" : "#EAE3CB",
               "yellow" : "#A57706",
               "orange" : "#BD3613",
               "red" : "#D11C24",
               "pink" : "#C61C6F",
               "purple" : "#595AB7",
               "blue" : "#2176C7",
               "green" : "#259286",
               "white" : "#fefefe",
               "yellowgreen" : "#738A05"
            }

            var links = [];

            for (var i = 0; i < nodes.length; i++) {
               if (nodes[i].target !== undefined) {
                  for (var x = 0; x < nodes[i].target.length; x++) {
                     links.push({
                        source : nodes[i],
                        target : nodes[nodes[i].target[x]]
                     })
                  }
               }
            }

            var myChart = d3.select(el).append('svg').attr('width', w)
                  .attr('height', h)

            var force = d3.layout.force().nodes(nodes).links([]).gravity(
                  0.1).charge(-1000).size([ w*1.3, h/1.5 ])

            var link = myChart.selectAll('line').data(links).enter()
                  .append('line').attr('stroke', palette.white)

            var node = myChart.selectAll('circle').data(nodes).enter()
                  .append('g').call(force.drag);

            node.append('circle').attr('cx', function(d) {
               return d.x;
            }).attr('cy', function(d) {
               return d.y;
            }).attr('r', circleWidth).attr('stroke', function(d, i) {
               if (i > 0) {
                  return palette.pink
               } else {
                  return "transparent"
               }
            }).attr('stroke-width', 2).attr('fill', function(d, i) {
               if (i > 0) {
                  return palette.pink
               } else {
                  return "transparent"
               }
            })
            
            node.append('text').text(function(d) {
               return d.name
            }).attr('font-family', 'LotteMartHappy').attr('fill',
                  function(d, i) {
                     if (i > 0) {
                        return palette.mediumgray
                     } else {
                        return palette.darkgray
                     }
                  })
                  .on("click", function(d,i) {categorySearch(d.name);})
                  .on("mouseover", function(d) {
                	d3.select(this).style({opacity:'0.5'});
                  })
                  .on("mouseout", function(d) {
                	d3.select(this).style({opacity:'1'});
                  })
                  .attr('x', function(d, i) {
               if (i > 0) {
                  return circleWidth + 20
               } else {
                  return circleWidth - 15
               }
            }).attr('y', function(d, i) {
               if (i > 0) {
                  return circleWidth
               } else {
                  return 8
               }
            }).attr('text-anchor', function(d, i) {
               if (i > 0) {
                  return 'beginning'
               } else {
                  return 'end'
               }
            }).attr('font-size', function(d, i) {
               if (i > 0) {
                  return '1.5em'
               } else {
                  return '3em'
               }
            })
            
            force.on('tick', function(e) {
               node.attr('transform', function(d, i) {
                  return 'translate(' + d.x + ', ' + d.y + ')';
               })

               link.attr('x1', function(d) {
                  return d.source.x
               }).attr('y1', function(d) {
                  return d.source.y
               }).attr('x2', function(d) {
                  return d.target.x
               }).attr('y2', function(d) {
                  return d.target.y
               })
            })

            force.start();
         }('#mindMap');
      }(window.d3);
    </script> 
</body>
</html>
