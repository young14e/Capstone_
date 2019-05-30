<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<div>
		<h1>글 수정</h1>
	</div>
	<div>
		<!-- 제목 내용 출발지역 모집인원 출발날짜 모집시작날짜 모집마감날짜 출발위치,위도,경도 도착위치,위도,경도 -->
		<form role="form" action="/bus/modify" method="post">

			<input type='hidden' name='page'
				value='<c:out value="${cri.page }"/>'> <input type='hidden'
				name='perPageNum' value='<c:out value="${cri.perPageNum }"/>'>
			<input type='hidden' name='type'
				value='<c:out value="${cri.type }"/>'> <input type='hidden'
				name='keyword' value='<c:out value="${cri.keyword }"/>'>


			<div class="form-group">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${bus.bno }"/>' readonly="readonly">
			</div>

			<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
					value='<c:out value="${bus.title }"/>'>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'><c:out
						value="${bus.content}" /></textarea>
			</div>

			<div class="form-group">
				<label>출발지역</label> <input class="form-control" name='departarea'
					value='<c:out value="${bus.departarea }"/>' readonly="readonly">
				
			</div>

			<div class="form-group">
				<label>모집인원 [모집된 인원 : <c:out value="${bus.recruitnum }" />]
				</label> <input class="form-control" name='maxrecruitnum' type="number"
					value='<c:out value="${bus.maxrecruitnum }"/>'>
			</div>

			<div class="form-group">
				<label>출발날짜</label> <input class="form-control" name='departdate' type="date"
					value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.departdate}" />'>
			</div>

			<div class="form-group">
				<label>모집 시작 날짜</label> <input class="form-control"
					name='startrecruit' 
					value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.startrecruit}" />'
					readonly="readonly">
			</div>

			<div class="form-group">
				<label>모집 마감 날짜</label> <input class="form-control" name='deadline' type="date"
					value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${bus.deadline}" />'>
			</div>

			<div class="form-group">
				<label>버스 출발 위치</label> <br> <input class="form-control "
					name='departlocation' type="text" id="depart_placeKeyword"
					value='<c:out value="${bus.departlocation}"/>'>
				<div id="depart_searchPlace" style="width: 50px; height: 50px;">
					<a href='javascript:void(0);'
						onclick="javascript:depart_searchPlaces(); return false;">검색하기</a>
				</div>
				<div id="depart_map" style="width: 500px; height: 350px;"></div>
				<div id="depart_clickLatlng"></div>
			</div>

			<input type="hidden" name="depart_lat" id="depart_lat"
				value='<c:out value="${bus.depart_lat}"/>' /> <input type="hidden"
				name="depart_lng" id="depart_lng"
				value='<c:out value="${bus.depart_lng}"/>' />

			<div class="form-group">
				<label>버스 도착 위치</label> <br> <input class="form-control "
					name='arrivelocation' type="text" id="arrive_placeKeyword"
					value='<c:out value="${bus.arrivelocation}"/>'>
				<div id="arrive_searchPlace" style="width: 50px; height: 50px;">
					<a href='javascript:void(0);'
						onclick="javascript:arrive_searchPlaces(); return false;">검색하기</a>
				</div>
				<div id="arrive_map" style="width: 500px; height: 350px;"></div>
				<div id="arrive_clickLatlng"></div>
			</div>

			<input type="hidden" name="arrive_lat" id="arrive_lat"
				value='<c:out value="${bus.arrive_lat}"/>' /> <input type="hidden"
				name="arrive_lng" id="arrive_lng"
				value='<c:out value="${bus.arrive_lng}"/>' />

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
					value='<c:out value="${bus.writer}"/>' readonly="readonly">
			</div>

			<button class="btn btn-primary" type="submit" data-oper='modify'>수정</button>
			<button class="btn btn-danger" type="submit" data-oper='remove'>삭제</button>
			<button class="btn btn-info" type="submit" data-oper='list'>목록</button>
		</form>


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

	// 주소-좌표 변환 객체를 생성합니다
	var depart_geocoder = new daum.maps.services.Geocoder();
	
	// 주소-좌표 변환 객체를 생성합니다
	var arrive_geocoder = new daum.maps.services.Geocoder();

	// 장소 검색 객체를 생성합니다
	var depart_ps = new daum.maps.services.Places();
	
	// 장소 검색 객체를 생성합니다
	var arrive_ps = new daum.maps.services.Places();

	// 키워드 검색을 요청하는 함수입니다
	function depart_searchPlaces() {
		var depart_keyword = document.getElementById('depart_placeKeyword').value;

		if (!depart_keyword.replace(/^\s+|\s+$/g, '')) {
			alert('위치를 입력해주세요.');
			return false;
		}

		depart_ps.keywordSearch(depart_keyword, depart_placesSearchCB);
	}
	
	// 키워드 검색을 요청하는 함수입니다
	function arrive_searchPlaces() {
		var arrive_keyword = document.getElementById('arrive_placeKeyword').value;

		if (!arrive_keyword.replace(/^\s+|\s+$/g, '')) {
			alert('위치를 입력해주세요.');
			return false;
		}

		arrive_ps.keywordSearch(arrive_keyword, arrive_placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function depart_placesSearchCB(data, status) {
		if (status === daum.maps.services.Status.OK) {
			var depart_bounds = new daum.maps.LatLngBounds();
			for (var i = 0; i < data.length; i++) {
				depart_bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			}
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			depart_map.setBounds(depart_bounds);
		} else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		} else if (status === daum.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function arrive_placesSearchCB(data, status) {
		if (status === daum.maps.services.Status.OK) {
			var arrive_bounds = new daum.maps.LatLngBounds();
			for (var i = 0; i < data.length; i++) {
				arrive_bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			}
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			arrive_map.setBounds(arrive_bounds);
		} else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		} else if (status === daum.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}
	
	//클릭했을때 위도와 경도, 상세주소를 보여주는 함수
	daum.maps.event.addListener(depart_map, 'click', function(mouseEvent) {
		depart_searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				
				//상세주소 출력할 변수
				var detailAddr = !!!!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;

				depart_marker.setPosition(latlng);
				depart_marker.setMap(depart_map);

				var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
				message += '경도는 ' + latlng.getLng() + ' 입니다' + detailAddr;

				var resultDiv = document.getElementById('depart_clickLatlng');
				resultDiv.innerHTML = message;
				
				document.getElementById('depart_lat').value = latlng.getLat();
				document.getElementById('depart_lng').value = latlng.getLng();
			}
		});
	});
	
	//클릭했을때 위도와 경도, 상세주소를 보여주는 함수
	daum.maps.event.addListener(arrive_map, 'click', function(mouseEvent) {
		arrive_searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === daum.maps.services.Status.OK) {
				
				//상세주소 출력할 변수
				var detailAddr = !!!!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;

				arrive_marker.setPosition(latlng);
				arrive_marker.setMap(arrive_map);

				var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
				message += '경도는 ' + latlng.getLng() + ' 입니다' + detailAddr;

				var resultDiv = document.getElementById('arrive_clickLatlng');
				resultDiv.innerHTML = message;
				
				document.getElementById('arrive_lat').value = latlng.getLat();
				document.getElementById('arrive_lng').value = latlng.getLng();
			}
		});
	});
	
	//상세주소를 요청하는 함수
	function depart_searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    depart_geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	//상세주소를 요청하는 함수
	function arrive_searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    arrive_geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/bus/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/bus/list").attr("method", "get");

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
