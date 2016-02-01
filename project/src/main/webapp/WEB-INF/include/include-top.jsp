<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jsp"%>
<%-- <%@ include file="/WEB-INF/include/include-stickynote.jsp"%> --%>

</head>

<body>
	
	<!-- Facebook App -->
	<script>
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '1530813903885662',
	      xfbml      : true,
	      version    : 'v2.5'
	    });
	  };
	
	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "//connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));
	</script>

	<!-- top -->
	<div class="nav-wrapper">
	<nav class="navbar navbar-default navbar-inverse affix-top" data-spy="affix" data-offset-top="100">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<c:url value='/' />"> 
					<i class="fa fa-fire"></i> WiGo
				</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="<c:url value='/intro/introduce.do' />"> 프로젝트소개 </a></li>
						<li><a href="<c:url value='/debate/openDebateList.do' />"> 토론게시판 </a></li>
						<li><a href="<c:url value='/R/openR.do' />"> 토론 분석 </a></li>
						<li><a href="<c:url value='/chat/openChat.do' />"> 실시간토론 </a></li>
						<%-- <li><a href="<c:url value='/debate/openMyDebate.do' />"> 내 토론현황 </a></li> --%>
						<li><a href="<c:url value='/board/openBoardList.do' />"> 자유게시판 </a></li>
					</ul>
			
					<!-- <div class="top-favorite">
						<a href="#" class="top-favorite-inner" style="background: #ffcc33;"><i class="fa fa-star square-2 rounded-1"></i></a>
						<a href="#" class="top-favorite-inner" style="background: #337ab7;"><i class="fa fa-facebook square-2 rounded-1"></i></a>
						<a href="#" class="top-favorite-inner" style="background: #1faabe;"><i class="fa fa-twitter square-2 rounded-1"></i></a>
						<a href="#" class="top-favorite-inner" style="background: #f96f4a;"><i class="fa fa-google-plus square-2 rounded-1"></i></a>
					</div> -->
			
					<!-- if not login state -->
					<c:if test="${null == sName}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" class="navbar-right-btn" data-toggle="modal"
								data-target="#joinModal"><span class="glyphicon glyphicon-user"></span> &nbsp;회원가입 </a></li>
							<li><a href="#" data-toggle="modal"	data-target="#loginModal"><span	class="glyphicon glyphicon-log-in"></span> &nbsp;로그인 </a></li>
						</ul>
					</c:if>
					<!-- if login state -->
					<c:if test="${null != sName}">
						<ul class="nav navbar-nav navbar-right">
							<li class="openNote"><a href="javascript:STICKIES.create();"> <i class="fa fa-pencil-square-o" style="font-size: 20px;"></i> </a>
							<li>
								<a href="<c:url value='/members/memberProfile.do' />" id="memberInfo">
									<img src="<c:url value='/images/members/${sId}.jpg'/>"width="35px;" height="35px;" style="border-radius: 50%;">
									<strong>&nbsp;${sName}</strong>님
								</a>
							</li>
							<li><a href="#this" id="logout" onclick="logoutBtn()">로그아웃</a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</nav>
	</div>

	<!-- Login modal -->
	<div class="modal-buttons">
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">로그인</h4>
					</div>
			
					<!-- 부엉이 -->
						<div class="owl" style="margin-top:20px;">
  							<div class="hand"></div>
  							<div class="hand hand-r"></div>
  							<div class="arms">
    						<div class="arm"></div>
    						<div class="arm arm-r"></div></div>
						</div>
						
					<!-- Login form -->
					<div class="modal-body">
						<form role="form" id="loginForm" autocomplete="off">
							<div class="form-group">
								<span><strong>아이디</strong> <input type="text" class="form-control joinInput" name="id"></span>
							</div>
							<div class="form-group">
								<span><strong>비밀번호</strong> <input type="password" class="form-control joinInput"
									name="password" onkeydown="if (event.keyCode == 13) loginBtn().click()"></span>
							</div>
							<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
							<button type="button" class="btn btn-default" id="loginSubmit" onclick="loginBtn()">로그인</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Join modal -->
		<div class="modal fade" id="joinModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원가입</h4>
					</div>

					<!-- 부엉이 -->
						<div class="owl" style="margin-top:20px;">
  							<div class="hand"></div>
  							<div class="hand hand-r"></div>
  							<div class="arms">
    						<div class="arm"></div>
    						<div class="arm arm-r"></div></div>
						</div>

					<!-- Join form -->
					<div class="modal-body">
						<form role="form" id="joinForm" autocomplete="off" enctype="multipart/form-data">
							<div class="joinForm-div">
								<span> <label for="name">아이디 &nbsp;</label> <input type="text" class="form-control joinInput"
									name="id" id="id-area" onkeyup="joinIdCheck(this.value)" onblur="joinIdCheck(this.value)"></span> <br/> <span
									id="joinIdCheck"></span>
							</div>
							<div class="joinForm-div">
								<span> <label for="name">비밀번호 &nbsp;</label> <input type="password" class="form-control joinInput"
									name="password1" id="password1"></span> <br />
							</div>
							<div class="joinForm-div">
								<span> <label for="name">재확인 &nbsp;</label> <input type="password" class="form-control joinInput"
									name="password2" id="pass-area" onkeyup="joinPasswordCheck(this.value)" onblur="joinPasswordCheck(this.value)"></span>
								<br /> <span id="passwordCheck"></span>
							</div>
							<div class="joinForm-div">
								<span> <label for="name">닉네임 &nbsp;</label> <input type="text" class="form-control joinInput" name="name">
								</span> <br />
							</div>
							<div class="joinForm-div">
							    <span>
							    <label for="name">생년월일 &nbsp;</label>
							        <select id="birthYear" name="birthYear" onChange="javascript:selectEventObj(this)" class="form-control joinSelect">
							            <option value="1970">1970</option>
							            <option value="1971">1971</option>
							            <option value="1972">1972</option>
							            <option value="1973">1973</option>
							            <option value="1974">1974</option>
							            <option value="1975">1975</option>
							            <option value="1976">1976</option>
							            <option value="1977">1977</option>
							            <option value="1978">1978</option>
							            <option value="1979">1979</option>
							            <option value="1980" selected="selected">1980</option>
							            <option value="1981">1981</option>
							            <option value="1982">1982</option>
							            <option value="1983">1983</option>
							            <option value="1984">1984</option>
							            <option value="1985">1985</option>
							            <option value="1986">1986</option>
							            <option value="1987">1987</option>
							            <option value="1988">1988</option>
							            <option value="1989">1989</option>
							            <option value="1990">1990</option>
							            <option value="1991">1991</option>
							            <option value="1992">1992</option>
							            <option value="1993">1993</option>
							            <option value="1994">1994</option>
							            <option value="1995">1995</option>
							            <option value="1996">1996</option>
							            <option value="1997">1997</option>
							            <option value="1998">1998</option>
							            <option value="1999">1999</option>
							            <option value="2000">2000</option>
							            <option value="2001">2001</option>
							            <option value="2002">2002</option>
							            <option value="2003">2003</option>
							            <option value="2004">2004</option>
							            <option value="2005">2005</option>
							            <option value="2006">2006</option>
							            <option value="2007">2007</option>
							            <option value="2008">2008</option>
							            <option value="2009">2009</option>
							        </select>&nbsp;년&nbsp;&nbsp; 
							        
							        <select id="birthMonth"  name="birthMonth" onChange="javascript:selectEventObj(this)" class="form-control joinSelect">
							            <option value="01" selected="selected">01</option>
							            <option value="02">02</option>
							            <option value="03">03</option>
							            <option value="04">04</option>
							            <option value="05">05</option>
							            <option value="06">06</option>
							            <option value="07">07</option>
							            <option value="08">08</option>
							            <option value="09">09</option>
							            <option value="10">10</option>
							            <option value="11">11</option>
							            <option value="12">12</option>
							        </select>&nbsp;월							        
							        
							        <select id="birthDay"  name="birthDay" onChange="javascript:selectEventObj(this)" class="form-control joinSelect">
							            <option value="01" selected="selected">01</option>
							            <option value="02">02</option>
							            <option value="03">03</option>
							            <option value="04">04</option>
							            <option value="05">05</option>
							            <option value="06">06</option>
							            <option value="07">07</option>
							            <option value="08">08</option>
							            <option value="09">09</option>
							            <option value="10">10</option>
							            <option value="11">11</option>
							            <option value="12">12</option>
							            <option value="13">13</option>
							            <option value="14">14</option>
							            <option value="15">15</option>
							            <option value="16">16</option>
							            <option value="17">17</option>
							            <option value="18">18</option>
							            <option value="19">19</option>
							            <option value="20">20</option>
							            <option value="21">21</option>
							            <option value="22">22</option>
							            <option value="23">23</option>
							            <option value="24">24</option>
							            <option value="25">25</option>
							            <option value="26">26</option>
							            <option value="27">27</option>
							            <option value="28">28</option>
							            <option value="29">29</option>
							            <option value="30">30</option>
							            <option value="31">31</option>
							        </select>&nbsp;일
							    </span>							   
							</div>
							<div hidden>
							  <p >출생 :<input type="text" id="birthdayText" name="birthdayText" value="" ></p>							  
						      <p >나이 : <input id="ageSelect" name="ageSelect" value="0"> </p>
							</div>
							<div class="joinForm-div">
								<span><label for="name">성별 &nbsp;</label>
								<input type="radio" class="form-control joinRadio" name="sexRadios" id="optionsRadios1" value="남" checked>	남
								<input type="radio" class="form-control joinRadio" name="sexRadios" id="optionsRadios2" value="여"> 여
								</span><br/>
							</div>
							<div class="joinForm-div">
								<span><label for="name">사진 &nbsp;</label>
								<input class="form-control joinInput" type="file" name="photo"> </span><br/>
							</div>
							
							<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
							<div class="g-recaptcha" data-sitekey="6Ldn9BMTAAAAAEL5Pgl_X3PBHVDz7eI5dt9t1hnT"></div>
							<button type="button" class="btn btn-default" id="joinSubmit" onclick="joinBtn()"> 회원가입</button>
							<br />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<%@ include file="/WEB-INF/include/include-body.jsp"%>
</body>

 <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
<script src="<c:url value='/js/json2.js'/>" charset="utf-8"></script>

<script>


    // 생년 년-월-일 선택 시 나이 계산 됨.
    function selectEventObj(selectObj) {	
	    var birthYear=document.getElementById("birthYear").value;	
	    var birthMonth=document.getElementById("birthMonth").value;	
	    var birthDay=document.getElementById("birthDay").value;
	
	    document.getElementById("birthdayText").value=birthYear+"-"+birthMonth+"-"+birthDay;	
	
	     // 입력값 얻어오기
        var birthday = document.getElementById('birthdayText').value.split("-");   
        // 날짜 오브젝트 작성
        var d1 = new Date(birthday[0],birthday[1]-1,birthday[2]);
        //월은 0부터 시작하므로
        // 1970년 1월 1일부터 birthday로 지정한 시간까지의 경과 시간을 ms단위로 계산
        var d2 = new Date();
        // 1970년 1월 1일부터 지금까지의 시간을 ms 단위로 계산   
        // 일수, 연령 계산
        var diff = d2.getTime() - d1.getTime();
        var daysPast = Math.floor(diff / (1000 * 60 * 60 * 24)); 
        var age = Math.floor(daysPast / 365.25);   
        //결과 표시
         document.getElementById("ageSelect").value = age;
}

	// 로그인 버튼 클릭시
	function loginBtn() {
/* 		for (var i = 0; i < 2; i++) {
			if (loginForm[i].value == null || loginForm[i].value == "") {
				alert("빈칸이 있습니다!");
				loginForm[i].focus();
				return false;
			}
		} */
		var comSubmit = new ComSubmit("loginForm");
		comSubmit.setUrl("<c:url value='/common/login.do' />");
		comSubmit.submit();
	};

	// 회원가입 버튼 클릭시
	function joinBtn() {
/* 		for (var i = 0; i < 3; i++) {
			if (joinForm[i].value == null || joinForm[i].value == "") {
				alert("빈칸이 있습니다!");
				joinForm[i].focus();
				return false;
			}
		} */
		
		var idLength = document.getElementById('id-area').value.length;
		var pass = document.getElementById('password1').value;
		var passConfirm = document.getElementById('pass-area').value;
		
		if ((idLength < 6) || (idLength > 12)) {
			alert("아이디를 6~12자 사이로 입력해 주세요.");
		} else if (pass != passConfirm){
			alert("비밀번호가 다릅니다.");
		} else {
			var comSubmit = new ComSubmit("joinForm");
			comSubmit.setUrl("<c:url value='/common/join.do' />");
			comSubmit.submit();
		}
		
	};

	// 로그아웃 버튼 클릭시
	function logoutBtn() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/common/logout.do' />");
		comSubmit.submit();
	};

	
	// 부엉이
	$('input[type="password"]').on('focus', function () {
	    $('*').addClass('password');
	}).on('focusout', function () {
	    $('*').removeClass('password');
	});	
	
	
	// 메뉴바 스크롤시 넓이고정
	$(window).scroll(function () {
   		 $('.navbar').width($(Window).width());
	});
	
	$(window).resize(function () {
  		 $('.navbar').width($(Window).width());
	});
	
	/*메모 시작*/
	var STICKIES = (function () {
			
		  $('.openNote').click(function() {
			  $(this).hide(500);
		  });
		
		  var initStickies = function initStickies() {
		    $("<div />", { 
		        text : "+", 
		        "class" : "add-sticky",
		        click : function () { createSticky(); }}).prependTo(document.body);
		    initStickies = null;
		},
		
		openStickies = function openStickies() {
		    initStickies && initStickies();
		    for (var i = 0; i < localStorage.length; i++) {
		        createSticky(JSON.parse(localStorage.getItem(localStorage.key(i))));
		    }
		},
		
		createSticky = function createSticky() {
		    data = { id : 'memo', top : "40px", left : "40px", text : "" }
		    
		    $.ajax ({
				type: "POST",
				url: "/project/note/openNote.do",
				data: null,
				cache: false,
				success: function(datum) {
					// data.text = datum;
					$('#memoContent').html(datum);					
				}
			})
		     
		    return $("<div />", { 
		        "class" : "sticky",
		        'id' : data.id
		         })
		        .prepend($("<div />", { "class" : "sticky-header"} )
		            .append($("<span />", { 
		                "class" : "status-sticky", 
		                click : saveSticky 
		            }))
		            .append($("<span />", { 
		                "class" : "close-sticky", 
		                text : "닫기", 
		                click : function () { 
		                	deleteSticky($(this).parents(".sticky").attr("id"));
		                	$('.openNote').show(500);	
		                }
		            }))
		            .append($("<span />", { 
		                "class" : "close-sticky", 
		                text : "저장", 
		                click : function () { saveNote(document.getElementById("memoContent").innerHTML); }
		            }))
		            .append($("<span />", { 
		                "class" : "close-sticky", 
		                text : "초기화", 
		                click : function () { $('#memoContent').html(""); }
		            }))
		            .append($("<span />", { 
		                "class" : "close-sticky", 
		                text : "불러오기", 
		                click : function () {
		                	$.ajax ({
		        				type: "POST",
		        				url: "/project/note/openNote.do",
		        				data: null,
		        				cache: false,
		        				success: function(datum) {
		        					// data.text = datum;
		        					$('#memoContent').html(datum);					
		        				}
		        			})
						 }
		            }))
		        )
		        .append($("<div />", { 
		            html : data.text, 
		            contentEditable : true, 
		            "class" : "sticky-content",
		            "id" : "memoContent",
		            keypress : markUnsaved
		        }))
		    .draggable({ 
		        handle : "div.sticky-header", 
		        stack : ".sticky",
		        start : markUnsaved,
		        stop  : saveSticky  
		     })
		    .css({
		        position: "absolute",
		        "top" : data.top,
		        "left": data.left
		    })
		    .focusout(saveSticky)
		    .appendTo(document.body);
		},
		
		deleteSticky = function deleteSticky(id) {
			
			function close_note(id) {
				localStorage.removeItem("sticky-" + id);
	  	    $("#" + id).fadeOut(200, function () { $(this).remove(); });
			};
			
			var innerContents = document.getElementById(id).innerHTML;
				close_note(id);
				
		},
		
		saveSticky = function saveSticky() {
		    var that = $(this),  sticky = (that.hasClass("sticky-status") || that.hasClass("sticky-content")) ? that.parents('div.sticky'): that,
		    obj = {
		        id  : sticky.attr("id"),
		        top : sticky.css("top"),
		        left: sticky.css("left"),
		        text: sticky.children(".sticky-content").html()               
		    }
		    localStorage.setItem("sticky-" + obj.id, JSON.stringify(obj));    
		    sticky.find(".sticky-status").text("saved");
		},
		
		markUnsaved = function markUnsaved() {
		    var that = $(this), sticky = that.hasClass("sticky-content") ? that.parents("div.sticky") : that;
		    sticky.find(".sticky-status").text("unsaved");
		}
		         
		    return {
		        open   : openStickies,
		        init   : initStickies,
		        create : createSticky
		    };
		}());

	jQuery.browser = {};
	(function () {
	    jQuery.browser.msie = false;
	    jQuery.browser.version = 0;
	    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        jQuery.browser.msie = true;
	        jQuery.browser.version = RegExp.$1;
	    }
	})();
	/*메모 끝*/
	
</script>
<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-72115224-1', 'auto');
  ga('send', 'pageview');

</script>
</html>