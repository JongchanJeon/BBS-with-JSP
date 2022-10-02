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
		if(userName.equals("") || userId.equals("") || userPassword.equals("") || userEmail.equals("") || userPhone.equals("") || userSSN.equals("")){
		%>
		<script>alert("양식을 모두 채워주세요.")</script>
		<%
		System.out.println("레코드 추가 실패");
		msg += "빈 값이 있습니다";
		}else {
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
		}
		
		break;
	case "I":
		PreparedStatement pstmt; // 쿼리문 대기 및 설정
		ResultSet rs; // 결과값 받아오기
		int loginResult;
		userId = request.getParameter("userId");
		userPassword = request.getParameter("userPassword");
		System.out.println(userId);
		System.out.println(userPassword);
		if (userId.equals("") || userPassword.equals("")){
			%>
			<script>alert("아이디 또는 비밀번호를 입력해 주세요.")</script>
			<%
			System.out.println("아이디 또는 비밀번호를 입력해주세요.");
			msg += "아이디 또는 비밀번호를 입력해주세요.";
		}else {
			sql = "select userPassword from users where userId =?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) {
						System.out.println("checking 1");
						response.sendRedirect("index.jsp");
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("checking 4");
			%> <script>alert("아이디 또는 비밀번호를 확인 해 주세요.")</script><%
			msg += "아이디 또는 비밀번호를 확인 해 주세요.";
			
		}
		
	}
	
%>

<h2><%=msg %></h2>
<br><a href="./main.jsp">로그인하기</a>
</body>
</html>