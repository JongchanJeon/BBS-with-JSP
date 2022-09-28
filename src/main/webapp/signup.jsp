<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	<div>비밀번호를 입력하세요 : <input type = "text" name = "userPassword"></div>
	<div>이메일을 입력하세요 : <input type = "text" name = "userEmail"></div>
	<div>전화번호을 입력하세요 : <input type = "text" name = "userPhone"></div>
	<div>주민등록번호을 입력하세요 : <input type = "text" name = "userSSN"></div>
	<input type ="hidden" name = "actionType" value="SIGNUP">
	<button type = "button" onclick = "location.href = 'main.jsp'"> 회원가입</button>
</form>

</body>
</html>