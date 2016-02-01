<%@ include file="/WEB-INF/include/include-top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
	<!-- 히든폼(세부내용보기) -->
	<form action="<c:url value='/debate/openDebateDetail.do' />"
		name="detailFrom" id="detailForm" method="post">
		<input type="hidden" name="idx" id="idx" value="">
	</form>

	<div class="memberWrapper">

		<div class="btn-group"
			style="width: 30%; margin-left: 35%; margin-right: 35%;">
			<button type="button" class="btn btn-default"
				onclick="location.href='<c:url value='/members/memberProfile.do' />'">내
				정보</button>
			<button type="button" class="btn btn-default"
				onclick="location.href='<c:url value='/debate/openMyDebate.do' />'">내
				토론현황</button>
		</div>
		<br /> <br />

		<div class="member-title-wrapper">
			<h3>회원 상세정보</h3>
			<a href="#this" class="btn" id="memberProfileUpdate"
				data-toggle="modal" data-target="#updateModal">수정하기</a> <a
				href="#this" class="btn" id="memberProfileDelete">회원탈퇴</a>
		</div>
		<table class="memberTable">
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
							<tr>
								<td rowspan="5" width="115px;"><img
									src="<c:url value='/images/members/${sId}.jpg'/>"
									height="150px;"></td>
								<td class="member-head">ID</td>
								<td>${row.ID }</td>
							</tr>
							<tr>
								<td class="member-head">비밀번호</td>
								<td>${row.PASSWORD }</td>
							</tr>
							<tr>
								<td class="member-head">이름</td>
								<td>${row.NAME }</td>
							</tr>
							<tr>
								<td class="member-head">나이</td>
								<td>${row.AGE }</td>
							</tr>
							<tr>
								<td class="member-head">성별</td>
								<td>${row.SEX }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th rowspan="4">조회된 결과가 없습니다.</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<br /> <br /> <br />

		<div class="member-favorite">
			<h3>즐겨찾기한 목록</h3>
			<table class="favorite-table">
				<c:choose>
					<c:when test="${fn:length(resultList) > 0}">
						<c:forEach items="${resultList}" var="row">
							<tr class="favorite-table-tr">
								<td class="favorite-table-td-0"><img
									src="<c:url value='/images/debate/${row.F_INDEX}.jpg'/>"
									width="30px" height="30px" style="border-radius: 50%;" /></td>
								<td class="favorite-table-td-1">${row.F_TITLE}</td>
								<td class="favorite-table-td-2"><a href="#"
									onclick="detailView(${row.F_INDEX})">바로가기</a></td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td>즐겨찾기한 주제가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>

		<div class="member-memo">
			<h3>내 메모</h3>
			<div class="member-memo-contents">${memo}</div>
		</div>
	</div>
	<div class="memberWrapper">
		<div class="member-reply">
			<h3>나의 댓글</h3>
			<table class="favorite-table">
				<c:choose>

					<c:when test="${fn:length(reply) > 0}">
						<tr class="favorite-table-tr">
							<th width="30%">제목</th>
							<th>참여 댓글</th>
						</tr>
						<c:forEach items="${reply}" var="row">
							<tr class="favorite-table-tr">
								<td><a href="#" name="titles" onclick="detailView(${row.IDX})"> ${row.TITLE} </a></td>
								<td class="favorite-table-td-1">${row.REPLY_CONTENTS}</td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td>나의 작성 댓글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>

	</div>


	<!-- 회원정보 수정 항목 -->
	<div class="modal-buttons">
		<!-- Join modal -->
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="row">
					<div class="modal fade" id="updateModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">정보수정</h4>
								</div>

								<!-- 부엉이 -->
								<div class="owl" style="margin-top: 20px;">
									<div class="hand"></div>
									<div class="hand hand-r"></div>
									<div class="arms">
										<div class="arm"></div>
										<div class="arm arm-r"></div>
									</div>
								</div>

								<!-- Join form -->
								<div class="modal-body">
									<form role="form" id="memberProfilfrm" autocomplete="off"
										enctype="multipart/form-data">
										<div class="joinForm-div">
											<span> <label for="name">아이디 &nbsp;</label> <input
												type="text" class="form-control joinInput"
												onkeyup="joinIdCheck(this.value)" value="${row.ID }"
												disabled="disabled"></span> <br /> <span id="joinIdCheck"></span>
											<span><input type="text" name="id" value="${row.ID }"
												style="display: none;"> </span>
										</div>
										<div class="joinForm-div">
											<span> <label for="name">현재비밀번호 &nbsp;</label> <input
												type="password" class="form-control joinInput"
												name="password1" id="password1" value="${row.PASSWORD }"></span>
											<br />
										</div>
										<div class="joinForm-div">
											<span> <label for="name">신규비밀번호 &nbsp;</label> <input
												type="password" class="form-control joinInput"
												name="password2" onkeyup="joinPasswordCheck(this.value)"></span>
											<br /> <span id="passwordCheck"></span>
										</div>
										<div class="joinForm-div">
											<span> <label for="name">닉네임 &nbsp;</label> <input
												type="text" class="form-control joinInput" name="name"
												value="${row.NAME }">
											</span> <br />
										</div>
										<div class="joinForm-div">
											<span><label for="name">사진 &nbsp;</label> <input
												class="form-control joinInput" type="file" name="photo">
											</span><br />
										</div>

										<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
										<button type="button" class="btn btn-default" id="joinSubmit"
											onclick="fn_updateMemberProfile()">수정하기</button>
										<br />
									</form>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#memberProfileDelete").on("click", function(e) { //회원탈퇴 버튼
				e.preventDefault();
				fn_deleteMemberProfile();
			});
		});

		
        function fn_updateMemberProfile(){  //정보 수정하기버튼 클릭 시
            var comSubmit = new ComSubmit("memberProfilfrm");
            comSubmit.setUrl("<c:url value='/members/updateMemberProfile.do' />");
            comSubmit.submit();
        }

		function fn_deleteMemberProfile() { //회원탈퇴 버튼

			var result = confirm("회원탈퇴 하시겠습니까?");

			if (result == true) {

				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/members/deleteMemberProfil.do' />");
				comSubmit.submit();

			}

		}
	</script>

</body>
</html>