<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html>
  <head>
      <meta charset='utf-8' />
      <title>HTML 5 complete</title>
      
      <style type="text/css">
      :focus {
     outline:0;
	 }
	 .add-sticky {
	     cursor: default;
	     position:absolute;
	     top:1px;
	     left:1px;
	     font-size:200%;
	     background:#000;
	     color:#fff;
	     border:2px solid #fff;
	     border-radius:40px;
	     -webkit-border-radius:40px;
	     -moz-border-radius:40px;
	     text-align:center;
	     line-height:25px;
	     width:30px;
	     height:30px;
	 }
	 .add-sticky:hover {
	     background: #474747;
	 }
	 .sticky {
	     width:300px;
	     background:#fdfdbe;
	     box-shadow:3px 3px 10px rgba(0,0,0,0.45);
	     -webkit-box-shadow:3px 3px 10px rgba(0,0,0,0.45);
	     -moz-box-shadow:3px 3px 10px rgba(0,0,0,0.45);
	 }
	 .sticky-content {
	     min-height:150px;
	     border-left:3px double rgba(238, 150, 122, .75);
	     margin-left:30px;
	     padding:5px;
	 }
	 .sticky-header {
	     padding:5px;
	     background:#f3f3f3;
	     border-bottom:2px solid #fefefe;
	     box-shadow:0 3px 5px rgba(0,0,0,0.25);
	     -webkit-box-shadow:0 3px 5px rgba(0,0,0,0.25);
	     -moz-box-shadow:0 3px 5px rgba(0,0,0,0.25);
	 }
	 .sticky-status {
	     color:#ccc;
	     padding:5px;
	 }
	 .close-sticky {
	     background:#474747;
	     float:right;
	     cursor:default;
	     color:#ececec;
	     padding:1px 5px;
	     border-radius:20px;
	     -webkit-border-radius:20px;
	     -moz-border-radius:20px;
	 }
      </style>
      
      <!--[if IE]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
  </head>
  <body>
      
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>
      <script src="<c:url value='/js/json2.js'/>"></script>
      <script type="text/javascript">
      
      var STICKIES = (function () {
    	  var initStickies = function initStickies() {
      	    $("<div />", { 
      	        text : "+", 
      	        "class" : "add-sticky",
      	        click : function () { createSticky(); }
      	    }).prependTo(document.body);
      	    initStickies = null;
      	},
      	
      	openStickies = function openStickies() {
    	    initStickies && initStickies();
    	    for (var i = 0; i < localStorage.length; i++) {
    	        createSticky(JSON.parse(localStorage.getItem(localStorage.key(i))));
    	    }
    	},
    	
    	createSticky = function createSticky(data) {
    	    data = data || { id : +new Date(), top : "40px", left : "40px", text : "" }
    	     
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
    	                click : function () { deleteSticky($(this).parents(".sticky").attr("id")); }
    	            }))
    	        )
    	        .append($("<div />", { 
    	            html : data.text, 
    	            contentEditable : true, 
    	            "class" : "sticky-content",
    	            "id" : "c"+data.id,
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
    		
    		var innerContents = document.getElementById('c'+id).innerHTML;
    		if (innerContents == "") {
    			
    			close_note(id);
    			
    		} else {
	    		var saveOrNot = confirm("저장 하시겠습니까?");
	    		
	    		if (saveOrNot == true) {
	    			alert("저장 되었습니다.");
	    			close_note(id);
	    		} else {
	    			alert("그냥 종료합니다.");
	    			close_note(id);
	    		}
    		}
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
   	        init   : initStickies
   	    };
   	}());
      
      </script>
      <script>
      STICKIES.open();
      </script>
  </body>
  </html> --%>