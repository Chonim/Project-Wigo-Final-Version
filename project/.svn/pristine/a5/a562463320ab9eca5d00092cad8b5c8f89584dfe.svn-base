<%@ include file="/WEB-INF/include/include-top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
$(document).ready(function() {
	var param = "${keyword}";
	var input = param;
	if (input != '' && input != null) {
		console.log(input);
		var roomName = '<a href="<c:url value="/chat/openChatRoom.do" />" class="list-group-item">' + input + '</a>';
		$(roomName).appendTo('.list-group');
	} else {
	}
});
</script>
<body>
	<div class="chatList-wrapper">
		<h3 class="chatList-title">채팅방 리스트</h3>
		<table class="chatList-table">
		<c:choose>
			<c:when test="${fn:length(chatList) > 0}">
				<c:forEach var="row" items="${chatList}" varStatus="status">
					<tr class="chatList-tr">
						<td class="chatList-td"><img src="<c:url value='/images/debate/${row.IDX}.jpg'/>"width="50px" height="50px" style="border-radius:15px;"/></td>
						<td class="chatList-td"><a href="#" onclick="location.href='<c:url value='/chat/openChatRoom.do?title=${row.TITLE}&idx=${row.IDX}'/>';">${row.TITLE}</a></td>
						<td class="chatList-td"><span class="label label-success" style="border-radius: 15px;"> 토론중 0/4 </span></td>
					</tr>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<tr><td><a class="list-group-item">조회된 결과가 없습니다.</a></td></tr>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
</body>
</html>