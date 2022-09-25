<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서적관리 시스템 - 조회(R3)</h1>
<hr>
<h2>전체보기(부분조회 미포함, 페이징기능 개선, 출력레코드갯수선택, 세션 객체 사용안함)</h2>
<hr>
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
	String record = request.getParameter("record");
	if (request.getParameter("record") == null) { 
		record = "10";
	}

	
%>

<%
	int book_id;
	String title;
	String publisher;
	String year;
	int price;
	
	int startRecord = 0;
	int limitCnt = Integer.parseInt(record);
	int currentPageNo;

	currentPageNo = Integer.parseInt(request.getParameter("currentPageNo"));
	startRecord = currentPageNo * limitCnt;
	
	String sql = "select * from books order by book_id limit ";
	sql += startRecord + "," + limitCnt;
	ResultSet rs = stmt.executeQuery(sql);
%>
		<%
	String sql2 = "select count(*) from books";
	ResultSet rs2 = stmt.executeQuery(sql2);
	
	int recordCnt = 0;
	int pageCnt;
	
	while(rs2.next()) {
		recordCnt = rs2.getInt(1);
	}
	
	pageCnt = recordCnt / limitCnt;
	if (recordCnt%10 != 0)
		pageCnt++;
%>
<h2>현재 DISPLAY RECORDS NUMBER: <%=record %></h2>
<hr>
<form method = 'post' action ='book_r3.jsp?currentPageNo=<%=0%>'>
<p>디스플레이 레코드수 변경 : 
	<select name = 'record' id = 'record' size = '1'>
		<option value = '10'>10</option>
		<option value = '20'>20</option>
		<option value = '50'>50</option>
		<option value = '100'>100</option>
	</select>
	<input type = "submit" value ="확인"></p>
</form>

	<table border = "1">
		<thead>
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>출판사</th>
				<th>출판년도</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>



<%
		while(rs.next()) {
			book_id = rs.getInt("book_id");
			title = rs.getString("title");
			publisher = rs.getString("publisher");
			year = rs.getString("year");
			price = rs.getInt("price");
%>
			<tr>
				<td><%=book_id %></td>
				<td><%=title %></td>
				<td><%=publisher %></td>
				<td><%=year %></td>
				<td><%=price %></td>
			</tr>
<%
		}
%>

		</tbody>
	</table>
	<br>
	<a href = "./book_r3.jsp?currentPageNo=0">[FIRST]</a>
	<%
		
		if(currentPageNo > 0) {
	%>
	<a href = "./book_r3.jsp?currentPageNo=<%=(currentPageNo-1)%>&record=<%=record%>">[PRE]</a>
	<%
		}else{
	%>
		[PRE]
	<%
		}
		int addPage = 0;
		if (recordCnt % limitCnt > 0){
			addPage += 1;
		}
		
		if (pageCnt / 10 == currentPageNo /10){
		for(int i = ((currentPageNo / 10) * 10) ;i < ((currentPageNo / 10) * 10) + pageCnt % 10 + addPage ; i++){

			if(i == currentPageNo) {
	%>
			[<%=(i+1) %>]
	<%
			}else{
				
	%>
		<a href="./book_r3.jsp?currentPageNo=<%=i%>&record=<%=record%>">[<%=(i+1)%>]</a>
	<%
			}
		}
		}else {
			for(int i = ((currentPageNo / 10) * 10) ;i < ((currentPageNo / 10) * 10) + 10; i++){

				if(i == currentPageNo) {
		%>
				[<%=(i+1) %>]
		<%
				}else{
					
		%>
			<a href="./book_r3.jsp?currentPageNo=<%=i%>&record=<%=record%>">[<%=(i+1)%>]</a>
		<%
				}
			}
		}
	%>
	<%
		if(currentPageNo < pageCnt - 1){

			%>
			<a href="./book_r3.jsp?currentPageNo=<%=(currentPageNo+1) %>&record=<%=record%>">[NXT]</a>
	<%
		}else {
	%>
		[NXT]
		<%
		}
	%>

	<a href="./book_r3.jsp?currentPageNo=<%=(pageCnt-1)%>&record=<%=record%>">[END]</a>
	<br><br>
	<a href="./index.jsp">홈으로 돌아가기</a>
</body>
</html>