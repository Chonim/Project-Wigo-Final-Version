<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.quilljs.com/0.20.1/quill.snow.css" />
<style type="text/css">
.quill-wrapper {
	background-color: #fff;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	box-shadow: 0px 0px 10px #ccc;
	margin-left: auto;
	margin-right: auto;
	max-width: 600px;
	min-width: 320px;
	min-height:200px;
	width: 100%;
}

.toolbar {
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #ccc;
	overflow:visible;
}

.editor, .toolbar {
	visibility: hidden;
	 line-height: 180%;
}

.editor.ql-container, .toolbar.ql-toolbar {
	visibility: visible;
}
</style>
</head>
<body>
<div class="quill-wrapper">
	<!-- Create the toolbar container -->
	<div id="toolbar" class="toolbar ql-toolbar ql-snow">
		<span class="ql-format-group">
			<select title = "Size" class="ql-size">
				<option value="10px">Small</option>
				<option value="13px" selected>Normal</option>
				<option value="18px">Large</option>
				<option value="32px">Huge</option>
			</select>
			<select title="Font" class="ql-font">
				<option value="sans-serif" selected="">Sans Serif</option>
				<option value="serif">Serif</option>
				<option value="monospace">Monospace</option>
			</select>
		</span>
		<span class="ql-format-group">
			<span title = "bold" class="ql-format-button ql-bold"></span>
			<span class="ql-format-separator"></span> 
			<span title = "italic"class="ql-italic ql-format-button"></span>
			<span class="ql-format-separator"></span>
			<span title = "strike"class="ql-strike ql-format-button"></span>
			<span class="ql-format-separator"></span>
			<span title = "underline"class="ql-underline ql-format-button"></span>
		</span>
		<span class = "ql-format-group">
		<span title="List" class="ql-format-button ql-list"></span>
		<span class="ql-format-separator"></span>
		<span title="Bullet" class="ql-format-button ql-bullet"></span>
		<span class="ql-format-separator"></span>
		<select title = "Align" class = "ql-align">
	        	<option value="left" selected></option>
	          	<option value="center"></option>
	          	<option value="right"></option>
	          	<option value="justify"></option>
	    </select>
        </span>
        
	</div>
	<!-- Create the editor container -->
	<div id = "editor" class = "editor ql-container ql-snow"  >
	
	</div>
</div>
<!-- Include the Quill library -->
<script src="//cdn.quilljs.com/0.20.1/quill.js"></script>

<!-- Initialize Quill editor -->
<script>
var quill = new Quill('#editor', {
	theme : 'snow',
	
});


quill.addModule('toolbar', {
	container : '#toolbar',
	'link-tooltip': true
});

quill.on('text-change', function(delta, source) {
	console.log('Editor contents have changed', delta);
});

var start = '내용을 입력하세요';

quill.insertText(0, start, {
  'italic': true,
  'color': '#999999'
});

quill.on('selection-change', function(range) {
	  if (range) {
	    if (range.start == range.end) {
	      console.log('User cursor is on', range.start);
	      if (start.length>0){
	    	  start='';
	    	  quill.deleteText(0,9);
	      }
	    } else {
	      var text = quill.getText(range.start, range.end);
	      console.log('User has highlighted', text);
	    }
	  } else {
	    console.log('Cursor not in the editor');
	  }
});
	

//quill.insertEmbed(10, 'image', 'http://quilljs.com/images/cloud.png');
</script>
</body>
</html>