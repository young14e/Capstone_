<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<div>
		<h1>글보기</h1>
	</div>
	<div>
		<div class="form-group">
			<label>글번호</label> <input class="form-control" name='bno'
				value='<c:out value="${notice.bno }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${notice.title }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="3" name='content'
				readonly="readonly"><c:out value="${notice.content}" /></textarea>
		</div>

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='writer'
				value='<c:out value="${notice.writer }"/>' readonly="readonly">
		</div>

		<form id='operForm' action="/notice/modify" method="get">
			<input type='hidden' id='bno' name='bno'
				value='<c:out value="${notice.bno}"/>'> <input type='hidden'
				name='page' value='<c:out value="${cri.page}"/>'> <input
				type='hidden' name='perPageNum'
				value='<c:out value="${cri.perPageNum}"/>'> <input
				type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

		</form>
		<div style="float: right;">
			<c:choose>
				<c:when test="${sessionScope.userGrade == 1 && sessionScope.userId == notice.writer}">
					<button class="btn btn-primary" data-oper='modify'>수정</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<button class="btn btn-info" data-oper='list'>목록</button>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/notice/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/notice/list")
			operForm.submit();

		});
	});
</script>

<%@include file="../includes/footer.jsp"%>