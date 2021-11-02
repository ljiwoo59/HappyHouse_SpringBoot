<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>User Info</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		customerSelect(); // 한사람 선택시 정보 받아올 이벤트 등록
		customerDelete(); // 삭제버튼 클릭시 이벤트 등록
		customerUpdate(); // 수정버튼 클릭시 이벤트 등록
		init(); // 입력칸 지우는 이벤트 등록
	});
	
	function customerSelect(){
		// tr 클릭시 선택정보가 위쪽의 text칸에 들어가도록 처리
		$('body').on('click', 'tr', function(){
			var id = $(this).find('#hidden_id').val();
			$.ajax({
				url: 'user/' + id,
				type: 'get',
				dataType: 'json',
				success: customerSelectResult
			})
		})
	}
	function customerDelete(){
		$('#btnDelete').on('click', function(){
			var id = $('#id').val();
			if (id != "") {
				$.ajax({
					url: 'user/' + id,
					type: 'delete',
					dataType: 'json',
					success: function() {
						clear();
						customerList(); // 화면 리프레쉬
					}
				})
			} else {
				alert("삭제할 정보를 입력해 주세요!");
			}
		})
	}
	
	function customerUpdate(){
		$('#btnUpdate').on('click', function() {
			var id = $('#id').val();
			var address = $('#address').val();
	
			if (id != "" && address != "") {
				$.ajax({
					url: 'user',
					type: 'put',
					data: JSON.stringify({ // json 객체를 문자열 형식으로
						id: id,
						address: address
					}),
					contentType: 'application/json', // 서버로 보내는 데이터 형식
					success: function() {
						clear();
						customerList();
					}
				})
			} else {
				alert("수정할 정보를 입력해 주세요!");
			}
		})
	}
</script>

</head>
<body>
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>My Page</h2>
			<div class="form-group">
				<label>아이디:</label> <input type="text" class="form-control" id="id" value = "${userinfo.id}">
			</div>
			<div class="form-group">
				<label>비밀번호:</label> <input type="text" class="form-control" id="password" value = "${userinfo.password}">
			</div>
			<div class="form-group">
				<label>이름:</label> <input type="text" class="form-control" id="name" value = "${userinfo.name}">
			</div>

			<div class="form-group">
				<label>주소:</label> <input type="text" class="form-control"
					id="address" value = "${userinfo.address}">
			</div>

			<div class="btn-group">
					<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
					<input type="button" class="btn btn-primary" value="삭제" id="btnDelete" /> 
			</div>
		</form>
	</div>
	<hr/>
</body>
</html>