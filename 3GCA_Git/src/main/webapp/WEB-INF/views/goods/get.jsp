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
				value='<c:out value="${goods.bno }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${goods.title }"/>' readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>나눔날짜</label> <input class="form-control" name='sharedate'
				value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${goods.sharedate}" />' readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>나눔굿즈</label> <input class="form-control" name='goods'
				value='<c:out value="${goods.goods }"/>' readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>나눔위치</label> <input class="form-control" name='sharelocation'
				value='<c:out value="${goods.sharelocation }"/>' readonly="readonly">
			<div id="map" style="width: 500px; height: 350px;"></div>
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="3" name='content'
				readonly="readonly"><c:out value="${goods.content}" /></textarea>
		</div>
		
		<input type="hidden" name="lat" id="lat" value='<c:out value="${goods.lat}"/>' />
		<input type="hidden" name="lng" id="lng" value='<c:out value="${goods.lng}"/>' />

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='writer'
				value='<c:out value="${goods.writer}"/>' readonly="readonly">
		</div>

		<form id='operForm' action="/goods/modify" method="get">
			<input type='hidden' id='bno' name='bno'
				value='<c:out value="${goods.bno}"/>'> <input type='hidden'
				name='page' value='<c:out value="${cri.page}"/>'> <input
				type='hidden' name='perPageNum'
				value='<c:out value="${cri.perPageNum}"/>'> <input
				type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

		</form>
		<div style="float: right;">
			<c:choose>
				<c:when test="${sessionScope.userId != null && sessionScope.userId == goods.writer}">
					<button class="btn btn-primary" data-oper='modify'>수정</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<button class="btn btn-info" data-oper='list'>목록</button>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=989ccda0ef6287f9a0f42311a3ec99cf&libraries=services"></script>
<script>
		var lat = document.getElementById('lat').value;
		var lng = document.getElementById('lng').value;
		
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(lat, lng),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(lat, lng); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/goods/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/goods/list")
			operForm.submit();

		});
	});
</script>

<%@include file="../includes/footer.jsp"%>