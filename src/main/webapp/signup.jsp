<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ȸ �� �� ��</h1>
<hr><br>
<h3>ȸ������ �ý���</h3>
<br>
<form method = "post" action="./user_dao.jsp">
	<div>�̸��� �Է��ϼ��� : <input type = "text" name = "userName"></div>
	<div>���̵� �Է��ϼ��� : <input type = "text" name = "userId"></div>
	<div>��й�ȣ�� �Է��ϼ��� : <input type = "text" name = "userPassword"></div>
	<div>�̸����� �Է��ϼ��� : <input type = "text" name = "userEmail"></div>
	<div>��ȭ��ȣ�� �Է��ϼ��� : <input type = "text" name = "userPhone"></div>
	<div>�ֹε�Ϲ�ȣ�� �Է��ϼ��� : <input type = "text" name = "userSSN"></div>
	<input type ="hidden" name = "actionType" value="SIGNUP">
	<button type = "button" onclick = "location.href = 'main.jsp'"> ȸ������</button>
</form>

</body>
</html>