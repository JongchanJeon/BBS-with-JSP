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
<h1>회원가입 시스템</h1>
<hr>
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/user";
	String user = "root";
	String passwd = "root";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("utf-8");
%>
<% 
	String actionType = request.getParameter("actionType");
	
	int userNum;
	String userName;
	String userId;
	String userPassword;
	String userEmail;
	String userPhone;
	String userSSN;
	String msg = "실행결과 : ";
	String sql;
	int result;
	System.out.println("test");
	switch(actionType) {
	
	case "S":
		userName = request.getParameter("userName");
		userId = request.getParameter("userId");
		userPassword = request.getParameter("userPassword");
		userEmail = request.getParameter("userEmail");
		userPhone = request.getParameter("userPhone");
		userSSN = request.getParameter("userSSN");
		System.out.println(userName);
		System.out.println(userId);
		System.out.println(userPassword);
		System.out.println(userEmail);
		System.out.println(userPhone);
		sql = "insert into users (userName, userId, userPassword, userEmail, userPhone, userSSN) values";
		sql += "('" + userName + "','" + userId + "','" + userPassword + "','" + userEmail + "','" + userPhone + "','"+ userSSN +"')";
		
		System.out.println(sql);
		
		result = stmt.executeUpdate(sql);
		
		if(result == 1){
			System.out.println("레코드 추가 성공");
			msg += "레코드 삭제 성공";
		}
		else {
			System.out.println("레코드 추가 실패");
			msg += "레코드 삭제 실패";
		}
		break;
	}
	
%>

<h2><%=msg %></h2>
<br><a href="./main.jsp">로그인하기/a>
</body>
</html>