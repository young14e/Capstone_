<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<div>
		<h1>차대절 모집게시글 작성 페이지 - 총대만 가능하게</h1>
	</div>
	<div>
		<!-- 제목 내용 출발지역 모집인원 출발날짜 모집시작날짜 모집마감날짜 출발위치,위도,경도 도착위치,위도,경도 -->
		<form role="form" action="/bus/register" method="post">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name='title'
					type="text" placeholder="제목">
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name='content'
					placeholder="내용"></textarea>
			</div>

			<div class="form-group">
				<label>출발 지역</label> 
				<select class="form-control" name="departarea">
						<option selected>지역을 선택하세요</option>
						<option value="서울특별시">서울특별시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청남도">충청남도</option>
						<option value="충청북도">충청북도</option>
						<option value="대전광역시">대전광역시</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="대구광역시">대구광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
				</select>
			</div>
			<div class="form-group">
				<label>모집인원</label> 
				<input class="form-control" name='maxrecruitnum'
					type="number" placeholder="모집인원">
			</div>
			
			<div class="form-group">
				<label>출발 날짜</label> <input class="form-control" name='departdate'
					type="date" placeholder="출발 날짜">
			</div>
			
			<div class="form-group">
				<label>모집시작 날짜</label> 
				<input class="form-control" name='startrecruit' type="date" placeholder="모집시작 날짜"> 
				<br>
				<label>모집마감 날짜</label> 
				<input class="form-control" name='deadline' type="date" placeholder="모집마감 날짜">
			</div>

			<div class="form-group">
				<label>버스 출발 위치</label> <br> <input class="form-control "
					name='departlocation' type="text" id="depart_placeKeyword"
					placeholder="버스 출발 위치">
				<div id="depart_searchPlace" style="width: 50px; height: 50px;">
					<a href='javascript:void(0);'
						onclick="javascript:depart_searchPlaces(); return false;">검색하기</a>
				</div>

				<div id="depart_map" style="width: 500px; height: 350px;"></div>
				<div id="depart_clickLatlng"></div>
				<input type="hidden" name="depart_lat" id="depart_lat" value="" />
				<input type="hidden" name="depart_lng" id="depart_lng" value="" />
			</div>
			
			<div class="form-group">
				<label>버스 도착 위치</label> <br> <input class="form-control "
					name='arrivelocation' type="text" id="arrive_placeKeyword"
					placeholder="버스 도착 위치">
				<div id="arrive_searchPlace" style="width: 50px; height: 50px;">
					<a href='javascript:void(0);'
						onclick="javascript:arrive_searchPlaces(); return false;">검색하기</a>
				</div>

				<div id="arrive_map" style="width: 500px; height: 350px;"></div>
				<div id="arrive_clickLatlng"></div>
				<input type="hidden" name="arrive_lat" id="arrive_lat" value="" />
				<input type="hidden" name="arrive_lng" id="arrive_lng" value="" />
			</div>

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='writer'
					type="text" value='<c:out value="${sessionScope.userId}"/>' readonly="readonly">
			</div>

			<div class="pull-right" style="margin-top: 10px;">
				<button class="btn btn-primary" type="submit">글작성</button>
				<button class="btn btn-danger" type="reset">취소</button>
			</div>
		</form>

	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=989ccda0ef6287f9a0f42311a3ec99cf&libraries=services"></script>
<script>
	var depart_marker = new daum.maps.Marker();
	var arrive_marker = new daum.maps.Marker();

	var depart_mapContainer = document.getElementById('depart_map'), // 지도를 표시할 div 
	depart_mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};
	
	var arrive_mapContainer = document.getElementById('arrive_map'), // 지도를 표시할 div 
	arrive_mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var depart_map = new daum.maps.Map(depart_mapContainer, depart_mapOption);
	
	// 지도를 생성합니다    
	var arrive_map = new daum.maps.Map(arrive_mapContainer, arrive_mapOption);

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

<%@include file="../includes/footer.jsp"%>
