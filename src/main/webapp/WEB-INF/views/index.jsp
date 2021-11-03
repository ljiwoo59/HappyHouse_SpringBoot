<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Framework Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/apt.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<header id="index_header" class="jumbotron text-center mb-1">
			<h4>행복한 우리 집</h4>
			<div id="latlng" name="latlng" style="display: none"></div>
		</header>
		<!-- nav start -->
		<c:if test="${empty userinfo}">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded" id="NoneLoginPage">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="/">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="user/login">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="user/register">회원 가입</a>
				</li>
			</ul>
		</nav>
		</c:if>

		<c:if test="${!empty userinfo}">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded" id="LoginPage">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="user/mypage">회원정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="user/logout">로그아웃</a>
				</li>
			</ul>
		</nav>
		</c:if>

		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
					시도 : 
					<select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : 
					<select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : 
					<select id="dong">
						<option value="0">선택</option>
					</select>
					<button type="button" id="aptSearchBtn">검색</button>
					<input type="text" id="aptSearchTextBox">
					<button type="button" id="aptNameSearchBtn">아파트로 검색</button>
					
					
					<table class="table mt-2">
						<colgroup>
							<col width="100">
							<col width="150">
							<col width="*">
							<col width="120">
							<col width="120">
						</colgroup>	
						<thead>
							<tr id="apt">
								<th>번호</th>
								<th>아파트이름</th>
								<th class="text-center">주소</th>
								<th>건축연도</th>
								<th>최근거래금액</th>
							</tr>
						</thead>
						<tbody id="searchResult"></tbody>
					</table>
				<div id="map" style="width:100%;height:500px;"></div>
					<table class="table mt-2" style="text-align:center;width:60%;margin:auto">
						<colgroup>
							<col width="100">
						</colgroup>	
						<thead>
							<tr>
								<th>인기 검색어</th>
							</tr>
						</thead>
						<tbody id="wordcount"></tbody>
					</table>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12ba6e50ade3f00c98658f5fb8dd567&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				
				
				if(null != "${userinfo.id}"){
					var geocoder = new kakao.maps.services.Geocoder();
					geocoder.addressSearch("${userinfo.address}", function(result, status){
						if (status == kakao.maps.services.Status.OK) {
							$("#latlng").append("<input type='text' id='lat' name='lat' value = " + result[0].y +">")
									.append("<input type='text' id='lng' name='lng' value = " + result[0].x +">");
						}else{
							$("#latlng").append("<input type='text' id='lat' name='lat' value = 'lat'>")
							.append("<input type='text' id='lng' name='lng' value = 'lng'>");
						}
					});
				}				
				$(document).ready(function(){	
					$.get(root + "/map/sido"
							,function(data, status){
								$.each(data, function(index, vo) {
									$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
								});
							}
							, "json"
						);
					wordlist();
				});
				
				function wordlist() {
					$.ajax({
						url: 'http://localhost/word',
						type: 'get',
						dataType: 'json', // 서버가 보내주는 데이터 타입
						success: function(result){
							$('#wordcount').empty();
							$.each(result, function(index, item){
								$('<tr>')
								.append($('<td>').text(item.word))
								.appendTo('#wordcount');
							})
						},
						error: function(xhr, status, msg){
							alert("상태값: " + status + " 에러메시지: " + msg);
						}
					});
				}
				
				
				$(document).on("change", "#sido", function() {
					$.get(root + "/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get(root + "/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$('#searchResult').empty();
								$.each(data, function(index, vo) {
                                    $('<tr>').append($('<td>').text(vo.aptCode))
                                        .append($('<td>').text(vo.aptName))
                                        .append($('<td>').text(vo.sidoName + vo.gugunName + vo.dongName + vo.jibun))
                                        .append($('<td>').text(vo.buildYear))
                                        .append($('<td>').text(vo.recentPrice))
                                        .appendTo('#searchResult');
                                });
								displayMarkers(data);
							},
							wordlist()
							, "json"
					);
				});
				
				$(document).on("click", "#aptNameSearchBtn", function(){
					$.get(root + "/map/searchaptName"
							,{aptName: $("#aptSearchTextBox").val(), lat : $("#lat").val(), lng : $("#lng").val()}
							,function(data, status){
								$("#searchResult").empty();
								$.each(data, function(index, vo) {
                                    $('<tr>').append($('<td>').text(vo.aptCode))
                                        .append($('<td>').text(vo.aptName))
                                        .append($('<td>').text(vo.sidoName + vo.gugunName + vo.dongName + vo.jibun))
                                        .append($('<td>').text(vo.buildYear))
                                        .append($('<td>').text(vo.recentPrice))
                                        .appendTo('#searchResult');
                                });
								displayMarkers(data);
							},
							wordlist()
							, "json"
					);
				});
				
				
				$(document).on("click", "#aptSearchBtn", function() {
					var param = {
							serviceKey:'nDNSD+IxQe5pGmgfgUdjmsnXlrL8ehNMWk6iM5hr49aF7RS7sY0CiZ0rxqC+uA3b8qCehUTNtH1LC0RWSmi0rQ==',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('10'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
								var items = $(data).find('item');
								var jsonArray = new Array();
								items.each(function() {
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.dongName = $(this).find('').text();
									//jsonObj.sidoName = $(this).find('').text();
									//jsonObj.gugunName = $(this).find('').text();
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj));
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
					/* var xhr = new XMLHttpRequest();
					var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent(' API KEY ');
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
					queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
					queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
					    	console.log(this.responseXML);
					        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					    }
					};

					xhr.send(''); */
				});
				$(document).on("click", "#aptNameSearchBtn", function() {
					var param = {
							serviceKey:'nDNSD+IxQe5pGmgfgUdjmsnXlrL8ehNMWk6iM5hr49aF7RS7sY0CiZ0rxqC+uA3b8qCehUTNtH1LC0RWSmi0rQ==',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('10'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
								var items = $(data).find('item');
								var jsonArray = new Array();
								items.each(function() {
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.dongName = $(this).find('').text();
									//jsonObj.sidoName = $(this).find('').text();
									//jsonObj.gugunName = $(this).find('').text();
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj));
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
				});
				</script>
				
				</div>
			</div>
		</section>
	</div>
</body>
</html>