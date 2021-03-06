<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

	<!-- META -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>

	<!-- FAVICON -->		
		<link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>" />

	<!-- CSS -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css"  href="<c:url value='/css/style.css'/>" />
		<link rel="stylesheet" type="text/css"  href="<c:url value='/css/board/board.css'/>" />
		<link rel="stylesheet" type="text/css"  href="<c:url value='/css/chat/chat.css'/>" />
		<link rel="stylesheet" type="text/css"  href="<c:url value='/css/debate/debate.css'/>" />
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" />
		
	<!-- SCRIPT -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> <!-- 부트스트랩 -->
		<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
		<script src='http://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js'></script> <!-- mindmap -->
		<script src='https://www.google.com/recaptcha/api.js'></script>
		
	<!-- jQuery -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.15/jquery-ui.min.js"></script>

	<!-- Word Cloud -->
		<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
		<script src="<c:url value='/js/d3.layout.cloud.js'/>" charset="utf-8"></script>
		
	<!-- Angular js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"></script>  
	
	<!-- Geo Location -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	
	<!-- Fancy Box (must be in here) -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js"></script>
		
		