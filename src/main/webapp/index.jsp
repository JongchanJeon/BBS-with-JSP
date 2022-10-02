<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>서적관리 시스템 Ver0.1</h1>
<hr>
<h2>JSP만 사용 (MVC패턴,. 서블릿, 스프링 미적용)</h2>
<hr>
<% 
		String userID = null;
		if (session.getAttribute("userId") != null){
			userID = (String) session.getAttribute("userId");
		}
		%>

<h3>안녕하세요 <%=userID %>님 <a href = "./signout.jsp">로그아웃</h3>
<li><a href ="./book_c.jsp">입력(C)</a></li>
<li><a href ="./book_r.jsp">조회(R)</a></li>
<li><a href ="./book_r2.jsp?currentPageNo=0">조회2(페이징,R2)</a></li>
<li><a href ="./book_r3.jsp?currentPageNo=0">조회3(페이징v2,레코드수선택, R3)</a></li>
<li><a href ="./book_u.jsp">수정(U)</a></li>
<li><a href ="./book_d.jsp">삭제(D)</a></li>
<li><a href ="./user_u.jsp">회원정보 수정</a></li>
<li><a href ="./user_d.jsp">회원 탈퇴</a></li>

</body>
</html>