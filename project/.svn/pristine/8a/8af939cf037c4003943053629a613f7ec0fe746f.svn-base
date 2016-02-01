<%@ include file="/WEB-INF/include/include-top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/include/include-fulleditor.jsp"%>
	<script type="text/javascript">
        var gfv_count = 1;
     
        $(document).ready(function(){
            $("#btn-list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openDebateList();
            });
             
            $("#btn-write").on("click", function(e){ //작성하기 버튼
            	e.preventDefault();
                fn_insertDebate();
            });
             
        });
         
        function fn_openDebateList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/debate/openDebateList.do' />");
            comSubmit.submit();
        }
         
        function fn_insertDebate(){
        	
        	var hiddenField2 = document.createElement("input");
            hiddenField2.setAttribute("type", "hidden");
            hiddenField2.setAttribute("name", "TITLE");
            hiddenField2.setAttribute("value", title.getText());
        	
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", "CONTENTS");
            hiddenField.setAttribute("value", editor.getHTML());
        	
            frm.appendChild(hiddenField);
            frm.appendChild(hiddenField2);
  
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/debate/insertDebate.do' />");
            comSubmit.submit();
        }
         
      </script>
</body>
</html>