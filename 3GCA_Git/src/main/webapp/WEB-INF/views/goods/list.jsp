<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>
<div class="container">
	<div>
		<h1>굿즈나눔</h1>
		<div style="float: right; margin-bottom: 5px;">
			<c:choose>
				<c:when test="${sessionScope.userId != null}">
					<button class="btn btn-primary" id='regBtn' type="button">글쓰기</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>나눔굿즈</th>
					<th>나눔위치</th>
					<th>작성자</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="goods">
				<tr>
					<td><c:out value="${goods.bno}" /></td>
					<td>
						<a class='move' href='<c:out value="${goods.bno}"/>'>
							<c:out value="${goods.title}" />
						</a>
					</td>
					<td><c:out value="${goods.goods}" /></td>
					<td><c:out value="${goods.sharelocation}" /></td>
					<td><c:out value="${goods.writer}" /></td>
				</tr>
			</c:forEach>
		</table>



		<div>
			<div style="float: right;">
				<form class="form-inline" id='searchForm' action="/goods/list"
					method='get'>
					<div class="form-group" >
						<div class="input-group" style="margin-right:50px;">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> 
							<input class="form-control col-xs-2" type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='page' value='<c:out value="${pageMaker.cri.page}"/>' /> 
							<input type='hidden' name='perPageNum' value='<c:out value="${pageMaker.cri.perPageNum}"/>' />
						</div>
					</div>
					<button class="btn btn-primary" style="float:right;margin-top:10px; margin-left:5px;">검색</button>
				</form>
			</div>
		</div>

		<div>
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage -1}"> ＜ </a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item  ${pageMaker.cri.page == num ? "active":""} ">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage +1 }"> ＞ </a></li>
				</c:if>


			</ul>
		</div>
	</div>

	<form id='actionForm' action="/goods/list" method='get'>
		<input type='hidden' name='page' value='${pageMaker.cri.page}'>
		<input type='hidden' name='perPageNum' value='${pageMaker.cri.perPageNum}'>

		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	</form>

</div>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/goods/register";

						});

						var actionForm = $("#actionForm");

						$(".page-item a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='page']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/goods/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='page']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>

<%@include file="../includes/footer.jsp"%>
