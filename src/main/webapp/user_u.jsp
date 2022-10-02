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
<h1>서적관리시스템 - 수정(U)</h1>
<hr>
<h2>전체보기(부분조회, 페이징기능 미포함)</h2>

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
	String userName;
	String userId = (String) session.getAttribute("userId");
	String userPassword;
	String userEmail;
	String userPhone;
	String userSSN;
	
	String sql = "select * from users where userId ='" + userId + "'";
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	while (rs.next()) {
		userName = rs.getString("userName");
		userPassword = rs.getString("userPassword");
		userEmail = rs.getString("userEmail");
		userPhone = rs.getString("userPhone");
		userSSN = rs.getString("userSSN");
		
%>
<form method="post" action="./user_dao.jsp">
	<br>아이디 : <input type="text" name = "userId" size = "30" value = <%=(String) session.getAttribute("userId") %> readonly/>
	<br>이름 : <input type="text" name = "userName" size ="30" value = <%="'" + userName + "'" %> maxlength='10' >
	<br>비밀번호 : <input type="password" name = "userPassword" size ="30" value = <%=userPassword %> maxlength='20' >
	<br>이메일 : <input type="email" name = "userEmail" size ="30" value = <%=userEmail %> maxlength='50' >
	<br>휴대전화 : <input type="number" name = "userPhone" size ="30" value = <%=userPhone %> maxlength='11' >
	<br>주민등록번호 : <input type="number" name = "userSSN" size ="30" value = <%=userSSN %> maxlength='13' >
	<br><input type ="hidden" name = "actionType" value="U">
	<br><input type ="submit" value="수정">
</form>
<% 
	}
%>
<br><a href ="./index.jsp">홈으로 돌아가기</a>
</body>
</html>