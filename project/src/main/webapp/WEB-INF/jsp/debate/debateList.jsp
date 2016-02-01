<%@ include file="/WEB-INF/include/include-top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
function filterSearch(f) {
	document.getElementById('hFilter').value = f;
	hFrom.submit();
}

function pageSearch(pageNo) {
	document.getElementById('currentPageNo').value = pageNo;
	hFrom.submit();
}
</script>
</head>
<body>
	<!-- 히든폼(세부내용보기) -->
	<form action="<c:url value='/debate/openDebateDetail.do' />" name="detailFrom" id="detailForm" method="post">
		<input type="hidden" name="idx" id="idx" value="">
	</form>

	<!-- 히든폼(카테고리) -->
	<form name="hFrom" id="hForm" method="post">
		<input type="hidden" name="hFilter" id="hFilter" value="${hFilter}">
		<input type="hidden" name="currentPageNo" id="currentPageNo">
	</form>
	
	<div id="indexDebateList">
 		<%@ include file="/WEB-INF/include/include-index-debateList.jsp"%>
	</div>
	
	<!-- 카테고리 -->
	<div class="top-ctg">
		<div class="btn-group btn-group-justified">
			<a class="btn btn-default" onclick="filterSearch(1)">전체 <span class="badge">${count[0]}</span></a>
			<a class="btn btn-default" onclick="filterSearch(2)">교육 <span class="badge">${count[1]}</span></a>
			<a class="btn btn-default" onclick="filterSearch(3)">사회 <span class="badge">${count[2]}</span></a>
			<a class="btn btn-default" onclick="filterSearch(4)">문화 <span class="badge">${count[3]}</span></a>
			<a class="btn btn-default" onclick="filterSearch(5)">정책 <span class="badge">${count[4]}</span></a>
			<a class="btn btn-primary" onclick="location.href='<c:url value='/debate/openDebateWrite.do' />'"> 토론주제등록 </a>
			<a class="btn btn-primary" onclick="location.href='<c:url value='/debate/openRandomDebateDetail.do' />'"> 랜덤토론주제</a>
		</div>
	</div>
	
	<!-- 아이템들.. -->
	<div class="itemContainer">
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="row" items="${list}" varStatus="status">
					<div class="items">
						<div class="image">
							<img src="<c:url value='/images/debate/${row.IDX}.jpg'/>" class="imgthumb" onclick="changeImg('/project/images/debate/${row.IDX}.jpg', '${row.TITLE}')" />
						</div>

						<div class="contents">
							<h5>
								<c:if test="${row.RECOMMEND > 300}">
									<%-- <img src="<c:url value='/images/hot.png'/>"height="16px;"> --%>
								</c:if>
								<span class="ctg"> ${row.CTG} </span>
								<a href="#"	id="counterspan" data-toggle="modal"data-target="#analysisModal${row.IDX}"
									onclick="analysis(${row.IDX})"><i class="fa fa-pie-chart"></i> ${row.AGREE + row.DISAGREE}명 참여 </a>
							</h5>
							<div class="title">
								<a href="#" name="titles" onclick="detailView(${row.IDX})"> ${row.TITLE} </a>
							</div>
						</div>
						<div class="visualize">
							<progress class="progress" id="progress1" value="${row.AGREE}" max="${row.AGREE+row.DISAGREE}"></progress><br/>
							<progress class="progress" id="progress2" value="${row.DISAGREE}" max="${row.AGREE+row.DISAGREE}"></progress>
						</div>
						
						<div class="progress-foot">
							<i id="recicon" class="fa fa-thumbs-o-up"> ${row.RECOMMEND} </i> 
						<div class="foot-right">
						 	<c:if test="${row.AGREE > row.DISAGREE}">
						 		<span class="progress-foot-a">찬성</span>우세
						 	</c:if>
						 	<c:if test="${row.AGREE < row.DISAGREE}">
						 		<span class="progress-foot-d">반대</span>우세
						 	</c:if>
						</div>
						</div>
					</div>

					<div class="modal fade" id="analysisModal${row.IDX}" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">참여자 분석결과</h4>
								</div>

								<div class="pieID pie" id="pie${row.IDX}"></div>

								<ul class="pieID legend" id="legend${row.IDX}">
									<li><em>20~30세</em><span><fmt:parseNumber value="${row.TWENTY}" integerOnly="true"></fmt:parseNumber></span></li>
									<li><em>30~40세</em><span><fmt:parseNumber value="${row.THIRTY}" integerOnly="true"></fmt:parseNumber></span></li>
									<li><em>40~50세</em><span><fmt:parseNumber value="${row.FORTY}" integerOnly="true"></fmt:parseNumber></span></li>
									<li><em>50~60세</em><span><fmt:parseNumber value="${row.FIFTY}" integerOnly="true"></fmt:parseNumber></span></li>
									<li><em>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타</em><span><fmt:parseNumber value="${row.ETC}" integerOnly="true"></fmt:parseNumber></span></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
		조회된 결과가 없습니다.
	</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 페이징 처리 -->
	<div class="debateDetail-pagination-wrapper">
	<div class="pagination">
       <c:if test="${not empty paginationInfo}">
           <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="pageSearch"/>
       </c:if>
    </div></div>
    
<script>
//원형차트분석
function analysis(IDX) {
		
function sliceSize(dataNum, dataTotal) {
  return (dataNum / dataTotal) * 360;
}
function addSlice(sliceSize, pieElement, offset, sliceID, color) {
  $(pieElement).append("<div class='slice "+sliceID+"'><span></span></div>");
  var offset = offset - 1;
  var sizeRotation = -179 + sliceSize;
  $("."+sliceID).css({
    "transform": "rotate("+offset+"deg) translate3d(0,0,0)"
  });
  $("."+sliceID+" span").css({
    "transform"       : "rotate("+sizeRotation+"deg) translate3d(0,0,0)",
    "background-color": color
  });
}
function iterateSlices(sliceSize, pieElement, offset, dataCount, sliceCount, color) {
  var sliceID = "s"+dataCount+"-"+sliceCount;
  var maxSize = 179;
  if(sliceSize<=maxSize) {
    addSlice(sliceSize, pieElement, offset, sliceID, color);
  } else {
    addSlice(maxSize, pieElement, offset, sliceID, color);
    iterateSlices(sliceSize-maxSize, pieElement, offset+maxSize, dataCount, sliceCount+1, color);
  }
}
function createPie(dataElement, pieElement) {
  var listData = [];
  $(dataElement+" span").each(function() {
    listData.push(Number($(this).html()));
  });
  var listTotal = 0;
  for(var i=0; i<listData.length; i++) {
    listTotal += listData[i];
  }
  var offset = 0;
  var color = [
    "cornflowerblue", 
    "olivedrab", 
    "orange", 
    "tomato", 
    "crimson", 
    "purple", 
    "turquoise", 
    "forestgreen", 
    "navy", 
    "gray"
  ];
  for(var i=0; i<listData.length; i++) {
    var size = sliceSize(listData[i], listTotal);
    iterateSlices(size, pieElement, offset, i, 0, color[i]);
    $(dataElement+" li:nth-child("+(i+1)+")").css("border-color", color[i]);
    offset += size;
  }
}createPie("#legend"+IDX, "#pie"+IDX);}
</script>
</body>
</html>