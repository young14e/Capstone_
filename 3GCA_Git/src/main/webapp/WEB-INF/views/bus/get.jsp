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
				value='<c:out value="${bus.bno }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>제목</label> <input class="form-control" name='title'
				value='<c:out value="${bus.title }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="3" name='content'
				readonly="readonly"><c:out value="${bus.content}" /></textarea>
		</div>

		<div class="form-group">
			<label>출발지역</label> <input class="form-control" name='departarea'
				value='<c:out value="${bus.departarea }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>모집된인원 [모집인원 : <c:out value="${bus.maxrecruitnum }" />
				]
			</label> <input class="form-control" name='recruitnum'
				value='<c:out value="${bus.recruitnum }"/>' readonly="readonly">
			<input type="hidden" class="form-control" name='maxrecruitnum'
				value='<c:out value="${bus.maxrecruitnum }"/>' readonly="readonly">
		</div>

		<div class="form-group">
			<label>출발날짜</label> <input class="form-control" name='departdate'
				value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.departdate}" />'
				readonly="readonly">
		</div>

		<div class="form-group">
			<label>모집 시작 날짜</label> <input class="form-control"
				name='startrecruit'
				value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.startrecruit}" />'
				readonly="readonly">
		</div>

		<div class="form-group">
			<label>모집 마감 날짜</label> <input class="form-control" name='deadline'
				value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.deadline}" />'
				readonly="readonly">
		</div>

		<div class="form-group">
			<label>버스 출발 위치</label> <input class="form-control"
				name='departlocation'
				value='<c:out value="${bus.departlocation }"/>' readonly="readonly">
			<div id="depart_map" style="width: 500px; height: 350px;"></div>
		</div>

		<input type="hidden" name="depart_lat" id="depart_lat"
			value='<c:out value="${bus.depart_lat}"/>' /> <input type="hidden"
			name="depart_lng" id="depart_lng"
			value='<c:out value="${bus.depart_lng}"/>' />

		<div class="form-group">
			<label>버스 도착 위치</label> <input class="form-control"
				name='arrivelocation'
				value='<c:out value="${bus.arrivelocation }"/>' readonly="readonly">
			<div id="arrive_map" style="width: 500px; height: 350px;"></div>
		</div>

		<input type="hidden" name="arrive_lat" id="arrive_lat"
			value='<c:out value="${bus.arrive_lat}"/>' /> <input type="hidden"
			name="arrive_lng" id="arrive_lng"
			value='<c:out value="${bus.arrive_lng}"/>' />

		<div class="form-group">
			<label>작성자</label> <input class="form-control" name='writer'
				value='<c:out value="${bus.writer}"/>' readonly="readonly">
		</div>

		<form id='operForm' action="/bus/modify" method="get">
			<input type='hidden' id='bno' name='bno'
				value='<c:out value="${bus.bno}"/>'> <input type='hidden'
				name='page' value='<c:out value="${cri.page}"/>'> <input
				type='hidden' name='perPageNum'
				value='<c:out value="${cri.perPageNum}"/>'> <input
				type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>

		</form>

		<form id='operForm_apply' action="/bus/apply" method="get">
			<input type='hidden' id='bno' name='bno'
				value='<c:out value="${bus.bno}"/>'> <input type='hidden'
				id='recruitnum' name='recruitnum'
				value='<c:out value="${bus.recruitnum}"/>'> <input
				type='hidden' name='page' value='<c:out value="${cri.page}"/>'>
			<input type='hidden' name='perPageNum'
				value='<c:out value="${cri.perPageNum}"/>'> <input
				type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			<input type="hidden" name='id' value='${sessionScope.userId}'>
		</form>
		<div style="float: right;">
			<c:choose>
				<c:when test="${bus.recruitnum == bus.maxrecruitnum}">
					<button class="btn btn-danger" data-oper='apply_done'>신청</button>
				</c:when>
				<c:when test="${sessionScope.userGrade == 3}">
					<button class="btn btn-danger" data-oper='apply'>신청</button>
				</c:when>
				<c:when test="${sessionScope.userGrade == null}">
					<button class="btn btn-danger" data-oper='apply_null'>신청</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.userGrade == 2 && sessionScope.userId == bus.writer}">
					<button class="btn btn-primary" data-oper='modify'>수정</button>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.userGrade == 2 && sessionScope.userId == bus.writer && bus.recruitnum == bus.maxrecruitnum}">
					<button class="btn btn-danger" data-oper='estimate'>견적신청</button>
				</c:when>
				<c:when test="${sessionScope.userGrade == 2 && sessionScope.userId == bus.writer}">
					<button class="btn btn-danger" data-oper='estimate_yet'>견적신청</button>
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
	var depart_lat = document.getElementById('depart_lat').value;
	var depart_lng = document.getElementById('depart_lng').value;

	var arrive_lat = document.getElementById('arrive_lat').value;
	var arrive_lng = document.getElementById('arrive_lng').value;

	var depart_container = document.getElementById('depart_map');
	var depart_options = {
		center : new daum.maps.LatLng(depart_lat, depart_lng),
		level : 3
	};

	var arrive_container = document.getElementById('arrive_map');
	var arrive_options = {
		center : new daum.maps.LatLng(arrive_lat, arrive_lng),
		level : 3
	};

	var depart_map = new daum.maps.Map(depart_container, depart_options);

	var arrive_map = new daum.maps.Map(arrive_container, arrive_options);

	// 마커가 표시될 위치입니다 
	var depart_markerPosition = new daum.maps.LatLng(depart_lat, depart_lng);

	// 마커가 표시될 위치입니다 
	var arrive_markerPosition = new daum.maps.LatLng(arrive_lat, arrive_lng);

	// 마커를 생성합니다
	var depart_marker = new daum.maps.Marker({
		position : depart_markerPosition
	});

	// 마커를 생성합니다
	var arrive_marker = new daum.maps.Marker({
		position : arrive_markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	depart_marker.setMap(depart_map);

	// 마커가 지도 위에 표시되도록 설정합니다
	arrive_marker.setMap(arrive_map);
</script>
<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/bus/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/bus/list")
			operForm.submit();

		});

		var operForm_apply = $("#operForm_apply");

		$("button[data-oper='apply']").on("click", function(e) {

			if (confirm("신청 하시겠습니까?")) {
				operForm_apply.attr("action", "/bus/apply").submit();
				// 확인 버튼 클릭 시 동작
				alert("신청 하였습니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				alert("취소했습니다.");
			}

		});

		$("button[data-oper='apply_null']").on("click", function(e) {

			alert("로그인 후 이용바랍니다.");

		});
		
		$("button[data-oper='apply_done']").on("click", function(e) {

			alert("모집이 완료된 게시글입니다.");

		});
		
		$("button[data-oper='estimate']").on("click", function(e) {

			if (confirm("견적신청 하시겠습니까?")) {
				alert("신청 하였습니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				alert("취소했습니다.");
			}

		});
		
		$("button[data-oper='estimate_yet']").on("click", function(e) {
				alert("인원이 부족하여 견적신청이 불가능합니다.");
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>