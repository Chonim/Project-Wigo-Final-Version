<%@ include file="/WEB-INF/include/include-top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
</head>
<body>
<div class="boardWrite-wrapper">

	<h3> 게시글 작성</h3>
    <div class="boardWrite-btns">
    	<button class="btn btn-default" id="list"><i class="fa fa-list"></i> 목록으로</button>
		<button class="btn btn-default" id="addFile"><i class="fa fa-file"></i> 파일 추가</button>
    	<button class="btn btn-default" id="write"><i class="fa fa-pencil-square-o"></i> 작성하기</button>
	</div>
    <form id="frm" name="frm" enctype="multipart/form-data">
        <table class="boardWrite-table">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="TITLE" name="TITLE"></input></td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <textarea rows="20" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div id="fileDiv">
            <span>첨부파일</span><br/><br/>
            <p>
                <input type="file" id="file" name="file_0">
                <a href="#this" class="btn" id="delete" name="delete">삭제</a>
            </p>
        </div>
         
        <br/><br/>
    </form>
    </div>
    <%@ include file="/WEB-INF/include/include-body.jsp" %>
    <script type="text/javascript">
        var gfv_count = 1;
     
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openBoardList();
            });
             
            $("#write").on("click", function(e){ //작성하기 버튼
                e.preventDefault();
                fn_insertBoard();
            });
             
            $("#addFile").on("click", function(e){ //파일 추가 버튼
                e.preventDefault();
                fn_addFile();
            });
             
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        });
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
            comSubmit.submit();
        }
         
        function fn_insertBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
            comSubmit.submit();
        }
         
        function fn_addFile(){
            var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
            $("#fileDiv").append(str);
            $("a[name='delete']").on("click", function(e){ //삭제 버튼
                e.preventDefault();
                fn_deleteFile($(this));
            });
        }
         
        function fn_deleteFile(obj){
            obj.parent().remove();
        }
    </script>
</body>
</html>