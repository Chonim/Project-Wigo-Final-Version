<%@ include file="/WEB-INF/include/include-top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<body>

<!-- Facebook -->
<div id="fb-root"></div>

	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1530813903885662";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<div class="boardDetail-wrapper">
	<h3> 게시글 상세보기 </h3>
	<div class="boardDetail-btns">
		<button class="btn btn-default" id="list"><i class="fa fa-list"></i> 목록으로</button>
    	<button class="btn btn-default" id="update"><i class="fa fa-pencil-square-o"></i> 수정하기</button>
	</div>
    <table class= "boardDetail-table">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.IDX }</td>
                <th scope="row">조회수</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.CREA_ID }</td>
                <th scope="row">작성시간</th>
                <td>${map.CREA_DTM }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.TITLE }</td>
            </tr>
            <tr>
                <td colspan="4">${map.CONTENTS }</td>
            </tr>
            <tr>
                <th scope="row">첨부파일</th>
                <td colspan="3">
                    <c:forEach var="row" items="${list }">
                        <input type="hidden" id="IDX" value="${row.IDX }">
                        <a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a> 
                        (${row.FILE_SIZE }kb)
                    </c:forEach>
                </td>
            </tr>
        </tbody>
    </table>
    <br/><br/>
    
    <h3> 댓글 </h3>
    <form id="frm" name="frm" enctype="multipart/form-data">
        <table class="boardWrite-table">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr id="reply_tr">
                    <td colspan="2" >
                        <textarea rows="1" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="boardWrite-btns">
    	<button class="btn btn-default" id="write"><i class="fa fa-pencil-square-o"></i> 작성하기</button>
	</div>
	</form>
	<br/><br/><br/><br/>
    
    <div class="common-reply">
           <c:choose>
                <c:when test="${fn:length(replyList) > 0}">
                    <c:forEach var="row" items="${replyList}" varStatus="status">
                    	<div class="common-reply-div">
                    		<div class="common-reply-imgdiv">
                    			<img src ="<c:url value='/images/members/${row.CREA_NAME}.jpg'/>" class="common_reply_img" width="35px;" height="35px;">
                    				${row.CREA_ID}
                    			<div class="common-reply-date">${fn:substring(row.CREA_DTM, 0, 10)}</div>
                    		</div>
		                	<div class="common-reply-cont">${row.CONTENTS }</div>
		            	</div>
                    </c:forEach>
                </c:when>
	            <c:otherwise>
					<!-- 댓글이 없습니다. -->
           		</c:otherwise>
           </c:choose>
       <br/><br/>
   </div>
   
   <!-- Facebook -->
   <div class="fb-comments" data-href="http://192.168.1.25:8081/project/board/openBoardDetail.do/${map.IDX }" data-numposts="10" data-width="100%" data-colorscheme="light"></div>
   
   <div id="disqus_thread" class="social_reply"></div>
	<script>
	/**
	* RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
	* LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
	*/
	
	var disqus_config = function () {
	this.page.url = "http://192.168.1.25:8081/project/board/openBoardDetail.do/${map.TITLE }"; // Replace PAGE_URL with your page's canonical URL variable
	this.page.identifier = "${map.TITLE }"; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
	};
	
	(function() { // DON'T EDIT BELOW THIS LINE
	var d = document, s = d.createElement('script');
	
	s.src = '//projectwigo.disqus.com/embed.js';
	
	s.setAttribute('data-timestamp', +new Date());
	(d.head || d.body).appendChild(s);
	})();
	</script>
	<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
	
	<!-- <script id="dsq-count-scr" src="//projectwigo.disqus.com/count.js" async></script> -->
	<!-- <a href="http://192.168.1.25:8081/project#disqus_thread">Link</a>. -->
    
</div>
<br/><br/>
   <script type="text/javascript">
    $(document).ready(function(){
    	
    	document.title = '${map.TITLE}';
    	
        $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
        });
         
        $("#update").on("click", function(e){ //수정하기 버튼
            e.preventDefault();
            fn_openBoardUpdate();
        });
        
        $("a[name='file']").on("click", function(e){ //파일 이름
            e.preventDefault();
            fn_downloadFile($(this));
        });
        
        $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertBoardReply();
        });
    });
     
    function fn_openBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
        comSubmit.submit();
    }
     
    function fn_openBoardUpdate(){
        var idx = "${map.IDX}";
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/board/openBoardUpdate.do' />");
        comSubmit.addParam("IDX", idx);
        comSubmit.submit();
    }
     
    function fn_downloadFile(obj){
        var idx = obj.parent().find("#IDX").val();
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
        comSubmit.submit();
    }
    
    function fn_insertBoardReply(){
    	var idx = "${map.IDX}";
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/board/insertBoardReply.do' />");
        comSubmit.addParam("PARENT_IDX", idx);
        comSubmit.submit();
    }
</script>
</body>
</html>