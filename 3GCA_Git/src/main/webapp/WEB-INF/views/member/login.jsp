<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/memberForm.js"></script>
<div class="container">
	<div class="row d-flex justify-content-center">
		<div class="card col-md-6">
			<article class="card-body">
				<h4 class="card-title text-center mb-4 mt-1">로그인</h4>
				<hr>
				<p class="text-success text-center">로그인 페이지</p>

				<form role="form" action="<%=request.getContextPath()%>/member/login" method="post" onsubmit="return validate_login()">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-user"></i>
								</span>
							</div>
							<input id="id" name="id" class="form-control" placeholder="아이디"
								type="text">
						</div>
						<!-- input-group.// -->
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-lock"></i>
								</span>
							</div>
							<input id="pw" name="pw" class="form-control" placeholder="비밀번호"
								type="password">
						</div>
						<!-- input-group.// -->
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							로그인</button>
					</div>
					<!-- form-group// -->
					<p class="text-center">
						<a href="<%=request.getContextPath()%>/member/register" class="btn">회원가입</a>
					</p>
				</form>
			</article>
		</div>
		<!-- card.// -->
	</div>
	<!-- row -->

</div>

<%@include file="../includes/footer.jsp"%>
