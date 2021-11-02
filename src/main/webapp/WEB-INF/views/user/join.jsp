<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mvRegisterBtn").click(function () {
                register();
            });
        });
        
        function register() {
        	if (!$("#id").val()) {
                alert("아이디 입력!!!");
                return;
            } else if (!$("#password").val()) {
                alert("비밀번호 입력!!!");
                return;
            }else if (!$("#name").val()) {
                alert("이름 입력!!!");
                return;
            }else if (!$("#address").val()) {
                alert("주소 입력!!!");
                return;
            } else {
            	console.log($("#id").val)
            	console.log($("#password").val)
            	console.log($("#name").val)
            	console.log($("#address").val)
                $("#joinform").attr("action", "${root}/user/register").submit();
            }
        }
    </script>
	</head>
	<body>
    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 >로그인</h2>
            <form id="joinform" class="text-left mb-3" method="post" action="">
                <div class="form-group">
                    <label for="userid">아이디</label>
                    <input type="text" class="form-control" id="id" name="id">
                </div>
                <div class="form-group">
                    <label for="userpwd">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="username">이름</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="useraddress">주소</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>
                <div class="text-danger mb-2">${msg}</div>
                <div class="form-group text-center">
                    <button type="button" id="mvRegisterBtn" class="btn btn-outline-primary">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>