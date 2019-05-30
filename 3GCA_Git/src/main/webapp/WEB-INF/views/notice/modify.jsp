<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="container">
	<div><h1>글 수정</h1></div>
	<div>

		<form role="form" action="/notice/modify" method="post">

			<input type='hidden' name='page'
				value='<c:out value="${cri.page }"/>'> <input
				type='hidden' name='perPageNum' value='<c:out value="${cri.perPageNum }"/>'>
			<input type='hidden' name='type'
				value='<c:out value="${cri.type }"/>'> <input type='hidden'
				name='keyword' value='<c:out value="${cri.keyword }"/>'>


			<div class="form-group">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${notice.bno }"/>' readonly="readonly">
			</div>

			<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
					value='<c:out value="${notice.title }"/>'>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'><c:out
						value="${notice.content}" /></textarea>
			</div>

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
					value='<c:out value="${notice.writer}"/>' readonly="readonly">
			</div>

			<div class="form-group">
				<label>작성날짜</label> <input class="form-control" name='regDate'
					value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.regdate}" />'
					readonly="readonly">
			</div>

			<div class="form-group">
				<label>수정날짜</label> <input class="form-control" name='updateDate'
					value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.updateDate}" />'
					readonly="readonly">
			</div>



			<button class="btn btn-primary" type="submit" data-oper='modify'>수정</button>
			<button class="btn btn-danger" type="submit" data-oper='remove'>삭제</button>
			<button class="btn btn-info" type="submit" data-oper='list'>목록</button>
		</form>


	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/notice/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/notice/list").attr("method", "get");

				var pageTag = $("input[name='page']").clone();
				var perPageNumTag = $("input[name='perPageNum']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageTag);
				formObj.append(perPageNumTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			formObj.submit();
		});

	});
</script>

<%@include file="../includes/footer.jsp"%>
