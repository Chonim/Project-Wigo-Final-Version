<%@page import="project.common.common.WordCloud"%>
<%@page import="project.common.common.RelativeKeyword"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<% WordCloud wordCloud = new WordCloud();
String json = wordCloud.wordList();
request.setAttribute("json", json);
%>
<script>    
// setting wordcloud size
var width=$(Window).width()*0.6, height=220;
var jasonParse = JSON.parse('${json}');  // array object
var words = new Array(); // keywords Array
var url = new Array();

for (var i = 0; i < jasonParse.length; i++) {
   words.push(jasonParse[i][0]);
}

var fill = d3.scale.category20();

d3.layout.cloud()
    .size([width, height])
    .words(words.map(function(d) {
      return {text: d, size: 20 + Math.random() * 30};
    }))
    .padding(5)
    .rotate(function() { return 0; })
    .font("LotteMartHappy")
    .fontSize(function(d) { return d.size; })
    .on("end", draw)
    .start();
    
var oldKeyword = "";
function draw(words) {
  d3.select("#wordCloud")
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
    .selectAll("text")
    .data(words)
    .enter()
    .append("text")
    .style("font-size", function(d) { return d.size + "px"; })
    .style("font-family", "LotteMartHappy")
    .style("text-shadow", "0 2px 0 rgba(black, 0.4)")
    .style("fill", function(d, i) { return fill(i); })
    .attr("text-anchor", "middle")
    .attr("transform", function(d) {
      return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
    })
    .text(function(d) { return d.text; })
    .on("click", function(d, i) {
    	var keyword = d.text;
    	
    	var keywordShow = "\'" + keyword + "\'에 대한 검색 결과";
    	
    	// document.getElementById('keyword').value = keyword;
    	$('.keyword').html(keywordShow, function() {
    		$('.keyword').fadeIn('slow');
    	});
    	
    	if (keyword == oldKeyword) {
    		/* $('#results').slideToggle();
    		$('.keyword').slideToggle(); */
    	} else {
    		
    		mainOnEvent(keyword)
	    	$('.keyword').fadeIn('slow');
    	}
    	oldKeyword = keyword;
    	
    	
    	// keywordForm.submit();
  });
}

</script>
</head>
<body>
<form name="keywordForm" id="keywordForm" action="<c:url value='/chat/openChat.do' />" method="POST">
	<input type="hidden" id="keyword" name="keyword" value="" />
</form>
</body>
</html>