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
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/book_db";
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
	
	String sql;
	int result;
	switch(actionType) {
	case "SIGNUP":
		userName = request.getParameter("userName");
		userId = request.getParameter("userId");
		userPassword = request.getParameter("userPassword");
		userEmail = request.getParameter("userEmail");
		userPhone = request.getParameter("userPhone");
		userSSN = request.getParameter("userSSN");
		
		sql = "insert into users (userName, userId, userPassword, userEmail, userPhone, userSSN) values";
		sql += "('" + userName + "','" + userId + "','" + userPassword + "','" + userEmail + "','" + userPhone + "','"+ userSSN +"')";
		
		System.out.println(sql);
		
		result = stmt.executeUpdate(sql);
		if(result == 1){
			System.out.println("레코드 추가 성공");
		}
		else {
			System.out.println("레코드 추가 실패");
		}
		break;
	}
	
%>
</body>
</html>