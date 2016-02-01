<%@ include file="/WEB-INF/include/include-top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<body>
<div class="boardList-wrapper">
		<div class="boardList-btns">
			<h3 class="boardList-h3">자유 게시판</h3>
        	<button class="btn btn-default" id="write"><i class="fa fa-pencil-square-o"></i> 글쓰기 </button>
        </div>
    <table class="boardList-table">
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
                            <td class="boardList-title">
                                <a href="#this" name="title">${row.TITLE }</a>
								<%-- <img src="<c:url value='/images/new.png'/>" width="25px;"> --%>
                                <input type="hidden" id="IDX" value="${row.IDX }">
                                <input type="hidden" id="title" value="${row.TITLE }">
                            </td>
                            <td>${row.HIT_CNT }</td>
                            <td>${row.CREA_ID }</td>                            
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
    <div class="boardList-pagination">
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
         
         
        function fn_openBoardWrite(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardWrite.do' />");
            comSubmit.submit();
        }
         
        function fn_openBoardDetail(obj){
            var comSubmit = new ComSubmit();
            
            var title = obj.parent().find("#title").val();
            var idx = obj.parent().find("#IDX").val();
            
            comSubmit.setUrl("<c:url value='/board/openBoardDetail.do?title="+title+"&idx="+idx+"' />");
            comSubmit.addParam("title", title);
            comSubmit.addParam("IDX", idx);
            comSubmit.submit();
        }
         
        function fn_search(pageNo){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
            comSubmit.addParam("currentPageNo", pageNo);
            comSubmit.submit();
        }
    </script> 
</body>
</html>