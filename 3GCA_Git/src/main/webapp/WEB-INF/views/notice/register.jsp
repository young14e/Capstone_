<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="container">
	<div>
		<h1>글작성</h1>
	</div>
	<div>

		<form role="form" action="/notice/register" method="post">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name='title' type="text" placeholder="제목">
			</div>

			<div class="form-group">
				<label>내용</label> <br>
				<textarea class="form-control" rows="3" name='content' placeholder="글 내용"></textarea>
			</div>

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
					type="text" value='<c:out value="${sessionScope.userId}"/>' readonly="readonly">
			</div>

			<button class="btn btn-primary" type="submit">글작성</button>
			<button class="btn btn-danger" type="reset">취소</button>
		</form>

	</div>
</div>
<%@include file="../includes/footer.jsp"%>
