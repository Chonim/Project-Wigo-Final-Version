<%@page import="java.util.Map"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel" style = "height:400px"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<a href="#" onclick="detailView(2)"><img src="<c:url value='/images/debate/2.jpg'/>" style="width:100%" alt="First slide">
			<div class="container">
				<div class="carousel-caption" >
					<p>오늘의 주제</p>
					<h1 class="carousel-h1">형사 미성년자 연령, 낮추어야 하는가</h1>
				</div>
			</div></a>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<a href="#" onclick="detailView(3)"><img src="<c:url value='/images/debate/3.jpg'/>" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<p>오늘의 주제</p>
					<h1 class="carousel-h1">백신거부는 정당한 권리인가</h1>
				</div>
			</div></a>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<a href="#" onclick="detailView(5)"><img src="<c:url value='/images/debate/5.jpg'/>" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<p>오늘의 주제</p>
					<h1 class="carousel-h1">사법 시험, 존치해야 하나</h1>
				</div>
			</div></a>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
  
</body>
</html>
