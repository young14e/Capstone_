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

		<form role="form" action="/goods/modify" method="post">

			<input type='hidden' name='page'
				value='<c:out value="${cri.page }"/>'> <input type='hidden'
				name='perPageNum' value='<c:out value="${cri.perPageNum }"/>'>
			<input type='hidden' name='type'
				value='<c:out value="${cri.type }"/>'> <input type='hidden'
				name='keyword' value='<c:out value="${cri.keyword }"/>'>


			<div class="form-group">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${goods.bno }"/>' readonly="readonly">
			</div>

			<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
					value='<c:out value="${goods.title }"/>'>
			</div>

			<div class="form-group">
				<label>나눔날짜</label> <input class="form-control" name='sharedate'
					type="date"
					value='<fmt:formatDate pattern="yyyy-MM-dd"
							value="${goods.sharedate}" />'>
			</div>

			<div class="form-group">
				<label>나눔굿즈</label> <input class="form-control" name='goods'
					value='<c:out value="${goods.goods }"/>'>
			</div>

			<div class="form-group">
				<label>나눔위치</label> <input class="form-control" id="placeKeyword"
					name='sharelocation'
					value='<c:out value="${goods.sharelocation }"/>'>
				<div id="searchPlace" style="width: 50px; height: 50px;">
					<a href='javascript:void(0);'
						onclick="javascript:searchPlaces(); return false;">검색하기</a>
				</div>
				<div id="map" style="width: 500px; height: 350px;"></div>
				<div id="clickLatlng"></div>
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'><c:out
						value="${goods.content}" /></textarea>
			</div>

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
					value='<c:out value="${goods.writer}"/>' readonly="readonly">
			</div>

			<input type="hidden" name="lat" id="lat"
				value='<c:out value="${goods.lat}"/>' /> <input type="hidden"
				name="lng" id="lng" value='<c:out value="${goods.lng}"/>' />

			<button class="btn btn-primary" type="submit" data-oper='modify'>수정</button>
			<button class="btn btn-danger" type="submit" data-oper='remove'>삭제</button>
			<button class="btn btn-info" type="submit" data-oper='list'>목록</button>
		</form>


	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=989ccda0ef6287f9a0f42311a3ec99cf&libraries=services"></script>
<script>
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value;
	var marker = new daum.maps.Marker();

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		level : 2
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(lat, lng); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
		var keyword = document.getElementById('placeKeyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('위치를 입력해주세요.');
			return false;
		}

		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status) {
		if (status === daum.maps.services.Status.OK) {
			var bounds = new daum.maps.LatLngBounds();
			for (var i = 0; i < data.length; i++) {
				bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			}
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		} else if (status === daum.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		} else if (status === daum.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}

	//클릭했을때 위도와 경도, 상세주소를 보여주는 함수
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === daum.maps.services.Status.OK) {

				//상세주소 출력할 변수
				var detailAddr = !!!!result[0].road_address ? '<div>도로명주소 : '
						+ result[0].road_address.address_name + '</div>' : '';
				detailAddr += '<div>지번 주소 : ' + result[0].address.address_name
						+ '</div>';

				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;

				marker.setPosition(latlng);
				marker.setMap(map);

				var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
				message += '경도는 ' + latlng.getLng() + ' 입니다' + detailAddr;

				var resultDiv = document.getElementById('clickLatlng');
				resultDiv.innerHTML = message;

				document.getElementById('lat').value = latlng.getLat();
				document.getElementById('lng').value = latlng.getLng();
			}
		});
	});

	//상세주소를 요청하는 함수
	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
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
				formObj.attr("action", "/goods/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/goods/list").attr("method", "get");

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
