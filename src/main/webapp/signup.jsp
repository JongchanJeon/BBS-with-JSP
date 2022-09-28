<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회 원 가 입</h1>
<hr><br>
<h3>회원가입 시스템</h3>
<br>
<form method = "post" action="./user_dao.jsp">
	<div>이름을 입력하세요 : <input type = "text" name = "userName"></div>
	<div>아이디를 입력하세요 : <input type = "text" name = "userId"></div>
	<div>비밀번호를 입력하세요 : <input type = "password" name = "userPassword"></div>
	<div>이메일을 입력하세요 : <input type = "email" name = "userEmail"></div>
	<div>전화번호을 입력하세요 : <input type = "text" name = "userPhone"></div>
	<div>주민등록번호을 입력하세요 : <input type = "text" name = "userSSN"></div>
	<input type ="hidden" name = "actionType" value="S">
	<input type = "submit" value ="회원가입">
</form>

</body>
</html>