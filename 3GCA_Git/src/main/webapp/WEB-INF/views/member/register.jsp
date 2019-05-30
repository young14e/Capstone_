<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/memberForm.js"></script>
<div class="container">
	<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">회원 가입</h4>
			<p class="text-center">새 계정을 만드세요</p>

			<p class="divider-text">
				<span class="bg-light">계정 생성</span>
			</p>
			<form role="form" action="register" method="post" onsubmit="return validate()">
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input id="id" name="id" class="form-control" placeholder="아이디 "
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="pw" name="pw" class="form-control" placeholder="비밀번호"
						type="password">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="pw2" class="form-control" placeholder="비밀번호 확인" type="password">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input id="name" name="name" class="form-control" placeholder="이름 "
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fas fa-portrait"></i>
						</span>
					</div>
					<input id="nick" name="nick" class="form-control" placeholder="닉네임 "
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i
							class="fas fa-birthday-cake"></i>
						</span>
					</div>
					<input id="birthDate" name="birthDate" class="form-control" placeholder="생년월일"
						type="date">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-phone"></i>
						</span>
					</div>
					<input id="phone" name="phone" class="form-control" placeholder="전화 번호"
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-building"></i>
						</span>
					</div>
					<select id="classType" class="form-control" name="classType">
						<option value="none" selected>계정 종류를 입력하세요</option>
						<option value="1">관리자</option>
						<option value="2">총대</option>
						<option value="3">회원</option>
						<option value="4">버스기사</option>
					</select>
				</div>
				<!-- form-group end.// -->

				
				<button type="submit" class="btn btn-primary btn-block">회원 가입</button>
				
			
				<p class="text-center">
					계정이 이미 있나요 ? <a
						href="<%=request.getContextPath()%>/member/login">로그인</a>
				</p>
			</form>
		</article>
	</div>
	<!-- card.// -->


</div>

<%@include file="../includes/footer.jsp"%>
