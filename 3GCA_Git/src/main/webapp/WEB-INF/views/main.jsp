<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="includes/header.jsp"%>
<div class="container">
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹 사이트 소개</h1>
				<p>
					콘서트를 좀 더 편리하게 가기위한 차 대절 사이트. <a class="btn btn-primary btn-pull"
						href="#" role="button">자세히 알아보기</a>
			</div>
		</div>
	</div>
	<!-- 홈페이지 메인 이미지 들어가는 위치 -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="../resources/images/11.jpg" alt="..."
					style="width: 100%; height: 80%">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="../resources/images/22.jpg" alt="..."
					style="width: 100%; height: 80%">
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<img src="../resources/images/33.jpg" alt="..."
					style="width: 100%; height: 80%">
				<div class="carousel-caption"></div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
	</div>
	<!-- 홈페이지 메인 이미지 들어가는 위치 끝 -->

	<!-- 짧은 글 들어가는 위치 -->

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h3>이 웹사이트는 현재 이용되지 않고 있습니다....</h3>
			</div>
		</div>
	</div>
	<!-- 짧은 글 들어가는 위치 -->
	<!-- 게시판 들어가는 위치 -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<div class="gesi">
					<div class="gongzi">
						<h3>공지사항 게시판 1</h3>
					</div>
					<div class="qagesi">
						<h3>질문 게시판 1</h3>
					</div>
					<div class="cargesi">
						<h3>차대절 게시판 1</h3>
					</div>
					<div class="goodgesi">
						<h3>굿즈 게시판 1</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시판 들어가는 위치 끝 -->
	<!-- 이미지 & 소개 간단한 글 들어가는 위치 -->
	<section id="services">
		<div class="container" style="background: #1f80aa;">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Services</h2>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
				</div>
				<br> <br>

			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
					</span> <img src="../resources/images/idea.png" style="height: 50px">
					<h4 class="service-heading">E-Commerce</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Minima maxime quam architecto quo inventore
						harum ex magni, dicta impedit.</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span> <img src="../resources/images/phone.png" style="height: 50px">
					<h4 class="service-heading">Responsive Design</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Minima maxime quam architecto quo inventore
						harum ex magni, dicta impedit.</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-lock fa-stack-1x fa-inverse"></i>
					</span> <img src="../resources/images/idea.png" style="height: 50px">
					<h4 class="service-heading">Web Security</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Minima maxime quam architecto quo inventore
						harum ex magni, dicta impedit.</p>
				</div>
			</div>
		</div>

	</section>
	<!-- 이미지 & 소개 간단한 글 들어가는 위치 끝-->

</div>
<%@include file="includes/footer.jsp"%>