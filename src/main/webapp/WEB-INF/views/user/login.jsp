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
            $("#loginBtn").click(function () {
                login();
            });
            $("#mvRegisterBtn").click(function () {
                location.href = "${root}/user/register";
            });
        });
        
        function login() {
        	if (!$("#userid").val()) {
                alert("아이디 입력!!!");
                return;
            } else if (!$("#userpwd").val()) {
                alert("비밀번호 입력!!!");
                return;
            } else {
                $("#loginform").attr("action", "${root}/user/login").submit();
            }
        }
    </script>
	</head>
	<body>
    <div class="container text-center mt-3">
        <div class="col-lg-8 mx-auto">
            <h2 >로그인</h2>
            <form id="loginform" class="text-left mb-3" method="post" action="">
                <div class="form-group">
                    <label for="userid">아이디</label>
                    <input type="text" class="form-control" id="userid" name="userId">
                </div>
                <div class="form-group">
                    <label for="userpwd">비밀번호</label>
                    <input type="password" class="form-control" id="userpwd" name="userPwd">
                </div>
                <div class="text-danger mb-2">${msg}</div>
                <div class="form-group text-center">
                    <button type="button" id="loginBtn" class="btn btn-outline-warning">로그인</button>
                    <button type="button" id="mvRegisterBtn" class="btn btn-outline-primary">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>