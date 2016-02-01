<%@ include file="/WEB-INF/include/include-top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
</head>
<body id="myPage">

<div class="body60_myDebate">
	<div class="body60_myDebate_innerDiv" id="myDebate_innerDiv1">
		<i class="fa fa-bullhorn underInnerDiv"></i>
		<span class="count count_1">${fn:length(list)}</span>
		<span class="undercount"></span>
		<p class="under-undercount"><span class="count_1">총</span> 토론개수</p>
	</div>
	<div class="body60_myDebate_innerDiv" id="myDebate_innerDiv2">
		<i class="fa fa-smile-o underInnerDiv"></i>
		<span class="count count_2">${count_agree}</span>
		<span class="undercount"></span>
		<p class="under-undercount"><span class="count_2">찬성</span>한 토론</p>
	</div>
	<div class="body60_myDebate_innerDiv" id="myDebate_innerDiv3">
		<i class="fa fa-frown-o underInnerDiv"></i>
		<span class="count count_3">${count_disagree}</span>
		<span class="undercount"></span>
		<p class="under-undercount"><span class="count_3">반대</span>한 토론</p>
	</div>
</div>

<div class="myDebate-tableWrapper">
    <table class="myDebate-table">
        <colgroup>
            <col width="10%"/>
            <col width="10%"/>
            <col width="*"/>
            <col width="20%"/>
        </colgroup>
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">분류</th>
                <th scope="col">제  목</th>
                <th scope="col">상태</th>
            </tr>
        </thead>
        <tbody>
			<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="row" items="${list}" varStatus="status">
				<tr>
					<td>${row.ROWNUM}</td>
					<td>${row.CTG}</td>
					<td> <a href="#" onclick="detailView(${row.IDX})">${row.TITLE}</a> </td>
					<td>
						<c:if test="${row.OP == 'A'}"><span class="label label-primary"> 찬성 </span></c:if>
						<c:if test="${row.OP == 'D'}"><span class="label label-danger"> 반대 </span></c:if>
						<c:if test="${row.OP == 'N'}"><span class="label label-default"> 참여안함 </span></c:if>
					</td>
				</tr>
			</c:forEach>
			</c:when>
			</c:choose>
        </tbody>
    </table>
    </div>
    
   <form action="<c:url value='/debate/openDebateDetail.do' />" name="detailFrom" id="detailForm" method="post">
		<input type="hidden" name="idx" id="idx" value="">
	</form>
	
	<footer class="container-fluid text-center">
	  <a href="#myPage" title="To Top">
	  <span class="toPageTop"> <i class="fa fa-chevron-up"></i> 맨 위로 돌아가기 </span>
	  </a>
	</footer>
	
	<script>
	$(document).ready(function(){
	  // Add smooth scrolling to all links in navbar + footer link
	  $("footer a[href='#myPage']").on('click', function(event) {
	
	    // Prevent default anchor click behavior
	    event.preventDefault();
	
	    // Store hash
	    var hash = this.hash;
	
	    // Using jQuery's animate() method to add smooth page scroll
	    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
	    $('html, body').animate({
	      scrollTop: $(hash).offset().top
	    }, 500, function(){
	   
	      // Add hash (#) to URL when done scrolling (default click behavior)
	      window.location.hash = hash;
	    });
	  });
	  
	  // Slide in elements on scroll
	  $(window).scroll(function() {
	    $(".slideanim").each(function(){
	      var pos = $(this).offset().top;
	
	      var winTop = $(window).scrollTop();
	        if (pos < winTop + 600) {
	          $(this).addClass("slide");
	        }
	    });
	  });
	})
	
	// 넘버 카운트
	$('.count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 2500,
        easing: 'linear',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    });
	});
	</script>
</body>
</html>