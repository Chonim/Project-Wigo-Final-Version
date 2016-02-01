<%@page import="project.common.twitter.Tweets"%>
<%@page import="project.common.common.RelativeKeyword"%>
<%@page import="project.common.common.NaverNewsRealTime"%>
<%@include file="/WEB-INF/include/include-top.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<%NaverNewsRealTime naverNewsRealTime = new NaverNewsRealTime();String jsonNaverNews = naverNewsRealTime.naverNews();request.setAttribute("jsonNaverNews", jsonNaverNews);// out.write(jsonNaverNews);%>
</head>

<body onload="index_onload();">
	 <!-- word cloud area -->
		<div id="wordCloud" style="background: url('<c:url value='/images/board2.png'/>') no-repeat;">
		<span><ul id="naverNews"></ul></span>
		<span id="wordCloudSpan">
			<a target="_blank" href="javascript:newWindowWeather()"><i class="fa fa-asterisk"></i></a>
			<span id="wcDate"></span>일 <span id="wcHr"></span>시 <span id="wcMn"></span>분 실시간 핫토픽 &nbsp;&nbsp;&nbsp; </span>
			<%@ include file="/WEB-INF/jsp/wordCloud.jsp"%>
			<div style="float: right; margin-right: 7px;">
				<input id="direct_search_keyword" onkeydown="if (event.keyCode == 13) document.getElementById('direct_search_btn').click()">
				<button id="direct_search_btn" onclick="direct_search()">검색</button>
			</div>
	 	</div>
	 	
	 <div class="body60" style="margin-top: 20px;">
	 <!-- <LEFT> daum photo area -->
	 	<div class="index-left">
	 		<h2 class="index-title"><i class="fa fa-search"></i> <span class="keyword"></span></h2>
	 		<div id="results" class="results-area1"> </div>
	 	</div>
	 	
	 <!-- <RIGHT> mind map area -->
	 	<div class="index-right">
	 		<h2 class="index-title"><i class="fa fa-usb"></i> 연관검색어 </h2>
	 		<div id="mindMap" class="results-area2"></div>
	 	</div>
	 </div>
	 
	 <!-- twitter -->
	 <div class="body60">
	 	<div class="social-left">
			<h2 class="index-title"><i class="fa fa-twitter"></i> Twitter </h2>
			<div id="twitter"></div>
		</div>
		
		<!-- Instagram -->
		<div class="social-right">
			<h2 class="index-title"><i class="fa fa-instagram"></i> Instagram <a href="javascript:openInstaNewWindow()">인기사진 보기</a></h2>
			<div id="instagram"></div>
		</div>
	 </div>
	 
	 <script type="text/java script">
 		var $= jquery.noConflict();
	 </script>
	 <div class="body60 youtube-container">
	 	<h2 class="index-title"><i class="fa fa-youtube"></i> YouTube </h2>
	 	
	 	<div id = "youtube">
	 		<ul id="youtubeResults" class="list-inline"></ul>
	 	</div> 
	 	
	 	<div id="buttons"></div>
	 </div>
	 
	 <footer class="container-fluid text-center">
	  <a href="#" title="To Top" onclick="javascript:toTop">
	  <span class="toPageTop"> <i class="fa fa-chevron-up"></i> 맨 위로 돌아가기 </span>
	  </a>
	</footer>
</body>


  <script>
  $('.fancybox').fancybox();
  
  today = new Date();
  	var date = today.getDate();
  	var hour = today.getHours();
  	var minute = today.getMinutes();
  	document.getElementById('wcDate').innerHTML = date;
  	document.getElementById('wcHr').innerHTML = hour;
  	document.getElementById('wcMn').innerHTML = minute;
  	
  	var jsonNaverNews = JSON.parse('${jsonNaverNews}');
  	
  	var titles = new Array();
  	var urls = new Array();
  	
  // 기사 링크 부분
  	for (var i = 0; i < jsonNaverNews.length; i++) {
  	   var counter = jsonNaverNews[i];
  	   titles.push(counter.title);
  	   urls.push(counter.url);
  	}
  
  	for (var i = 0; i < titles.length; i++) {
  		$('#naverNews').append('<a target="_blank" href="<c:url value="'+urls[i]+'" /> "><li class="article">'+titles[i]+'</li></a>');
  	}
  	
    var firstSlides = $("#naverNews a li"),
        nbSlides = firstSlides.length,
        slideTime = 3000,
        nextSlide = 0;
    
    firstSlides.hide();

    function slideshow() {
        firstSlides.eq(nextSlide).fadeIn(500).delay(2000).fadeOut(500);
        nextSlide = (nextSlide+1) % nbSlides;
        setTimeout(slideshow, slideTime);
    }
    
    slideshow();
  </script>
</html>
