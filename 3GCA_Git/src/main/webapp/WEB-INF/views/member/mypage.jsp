<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container">
	<div>
		<h1 style="text-align: center;">마이페이지</h1>
	</div>
	<hr>
	<div style="float: right; margin-bottom: 5px;">
		<button class="btn btn-primary btn-block" id='updateBtn' type="button">정보수정</button>
		<button class="btn btn-danger btn-block" id='deleteBtn' type="button">회원탈퇴</button>
	</div>
	<div>
		<table class="table table-bordered table-hover"
			style="text-align: center;">
			<thead>
				<tr>
					<th>내가 쓴 글</th>
				</tr>
			</thead>
			<tr>
				<td>내가쓴글 보이게해야함</td>
			</tr>
		</table>
	</div>
	
	<div>
		<table class="table table-bordered table-hover"
			style="text-align: center;">
			<thead>
				<tr>
					<th>차대절 신청 목록</th>
				</tr>
			</thead>
			<tr>
				<td>신청목록보이게해야함</td>
			</tr>
		</table>
	</div>
</div>
<form id='deleteForm' action="/member/deleteMember" method="post">
	<input type='hidden' id='id' name='id'
		value='<c:out value="${userInfo.id}"/>'>

</form>
<script type="text/javascript">
	$(document).ready(function() {

		$("#updateBtn").on("click", function(e) {

			self.location = "/member/update";

		});

		var deleteForm = $("#deleteForm");

		$("#deleteBtn").on("click", function(e) {

			if (confirm("계정이 삭제됩니다. 정말로  탈퇴하시겠습니까?")) {
				deleteForm.attr("action", "/member/deleteMember").submit();
				alert("탈퇴되었습니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				alert("취소했습니다.");
			}

		});

	});
</script>
<%@include file="../includes/footer.jsp"%>
