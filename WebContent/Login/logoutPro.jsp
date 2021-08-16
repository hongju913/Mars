<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>

<%
	//세션삭제하기(로그아웃)	
	session.invalidate();

%>

<script type="text/javascript">
	alert("로그아웃 완료");
	location.href="../temp/index.jsp";
</script>


</body>
</html>