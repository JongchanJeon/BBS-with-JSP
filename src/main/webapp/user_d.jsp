<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서적관리시스템 - 회원탈퇴</h1>
<hr>


		<%
		String userID = (String) session.getAttribute("userId");
		%>
		<h3>안녕하세요 <%=userID %>님 정말로 회원 탈퇴를 하시겠어요?
		<form method = "post" action="./user_dao.jsp">
			<input type="submit" value="예">
			<input type ="hidden" name = "actionType" value="D">
		</form>
		<input type="button" onClick="location.href='index.jsp'" value="아니요">



</body>
</html>