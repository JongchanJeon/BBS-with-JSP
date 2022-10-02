<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>서적관리 시스템 Ver0.1 LOGIN IN</h1>
	<hr>
	<br>
	<h3>로그인 시스템</h3>
	<br>
	<form method="post" action="./user_dao.jsp">
		<div>
			Id &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="userId">
		</div>
		<br>
		<div>
			Password <input type="password" name="userPassword">
		</div>
		<input type ="hidden" name = "actionType" value="I">
		<br>
		<button type="submit" onclick="location.href='user_dao.jsp'">
			LOGIN</button>
		<button type="button" onclick="location.href='signup.jsp'">
			회원가입</button>
	</form>

</body>
</html>