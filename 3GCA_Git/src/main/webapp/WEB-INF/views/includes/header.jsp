<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" ,nitial-scale="1">
<title>3GCA</title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/custom.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="http://kkkzzk.cafe24.com/">빠순뻐쓰</a>

			<div class="sss" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="http://kkkzzk.cafe24.com/">메 인</a></li>
					<li><a href="../notice/list">공 지 사 항</a></li>
					<li><a href="../bus/list">차대절</a></li>
					<li><a href="../goods/list">굿즈나눔</a></li>
					<li><a href="#">질 문</a></li>
					<li class="pull-right"><c:choose>
							<c:when test="${sessionScope.userId == null}">
							</c:when>
							<c:otherwise>
								<a href="../member/mypage">마이페이지(${sessionScope.userId})</a>
							</c:otherwise>
						</c:choose></li>
					<li class="pull-right"><c:choose>
							<c:when test="${sessionScope.userId == null}">
								<a href="../member/login">로그인</a>
							</c:when>
							<c:otherwise>
								<a href="<%=request.getContextPath()%>/member/logout">로그아웃</a>
							</c:otherwise>
						</c:choose></li>
					<li class="pull-right"><c:choose>
							<c:when test="${sessionScope.userId == null}">
								<a href="../member/register">회원가입</a>
							</c:when>
						</c:choose></li>
					<li>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</li>

				</ul>
			</div>
		</div>
	</nav>
	<hr>
	<div style="min-height: 100%;">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="../resources/bootstrap/js/bootstrap.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>