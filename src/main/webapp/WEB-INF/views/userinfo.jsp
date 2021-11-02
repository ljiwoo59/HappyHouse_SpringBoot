<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>User Info</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				alert("삭제 성공");
				$("#mypageform").attr("action", "${root}/user/delete").submit();
			});
			$("#btnUpdate").click(function() {
				alert("수정 성공");
				update();
			});
		});
	
		function update() {
			if (!$("#name").val()) {
				alert("이름 입력!!!");
				return;
			} else if (!$("#address").val()) {
				alert("주소 입력!!!");
				return;
			} else {
				$("#mypageform").attr("action", "${root}/user/update").submit();
			}
		}
	</script>

	</head>
	<body>
		<div class="container">
			<form id="mypageform" class="form-horizontal" method="post">
				<h2>My Page</h2>
				<div class="form-group">
					<label>아이디:</label> <input type="text" class="form-control" id="id" name = "id" value="${userinfo.id}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>비밀번호:</label> <input type="text" class="form-control" id="password" name = "password" value="${userinfo.password}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>이름:</label> <input type="text" class="form-control" id="name" name = "name" value="${userinfo.name}">
				</div>
	
				<div class="form-group">
					<label>주소:</label> <input type="text" class="form-control" 	id="address" name = "address" value="${userinfo.address}">
				</div>
	
				<div class="btn-group">
					<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" />
					 <input type="button" class="btn btn-primary" value="삭제" id="btnDelete" />
				</div>
			</form>
		</div>
		<hr />
	</body>
</html>