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
<script>
	var delConfirm = confirm("정말로 회원탈퇴를 하시겠습니까?");
	if (delconfirm){
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
		String userID = (String) session.getAttribute("userId");;

		int result;
		String sql = "delete from users where userId = '";
		sql += userID + "'";
		System.out.println(sql);
		
		result = stmt.executeUpdate(sql);
		session.invalidate();
		System.out.println("여기까ㄴ");
	%>	
	</script>
		alert("정상적으로 회원탈퇴가 되었습니다.")
	<script>
		location.href = "main.jsp";
		
	}else {
		alert("탈퇴가 취소되었습니다.")
		location.href = "index.jsp";
	}
		</script>	

	


</body>
</html>