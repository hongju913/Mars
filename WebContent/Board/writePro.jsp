<%@page import="com.KHJ.member.boardDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite success</title>
</head>
<body>

	
<%
	String id = (String)session.getAttribute("id");
	
	request.setCharacterEncoding("UTF-8");

	if(id == null){
		response.sendRedirect("../Login/LoginForm.jsp");
	}

	if(request.getParameter("pass") == ""){
		%>
		<script type="text/javascript">
		 alert("비밀번호를 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("subject") == ""){
		%>
		<script type="text/javascript">
		 alert("제목을 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("content") == ""){
		%>
		<script type="text/javascript">
		 alert("내용을 입력하세요.");
		 history.back();
		</script>
		<%
	}

	
%>
	
	<jsp:useBean id="bb" class="com.KHJ.member.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
<%

	bb.setIp(request.getRemoteAddr());


	boardDAO bdao = new boardDAO();
	
	bdao.writeBoard(bb);

	response.sendRedirect("boardList.jsp");


%>





</body>
</html>