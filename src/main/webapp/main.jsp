<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>서적관리 시스템 Ver0.1 LOGIN IN</h1>
<hr><br>
<h3>로그인 시스템</h3>
<br>
<form>
<div>Id &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type = "text" id = "id"></div><br>
<div>Password <input type = "password" id = "password"></div>
<button type ="button" onclick ="alert('로그인에 실패하였습니다!')"> LOGIN</button>
</form>
<br><br><br>
<button type = "button" onclick = "./book_u.jsp"> 회원가입</button>
</body>
</html>