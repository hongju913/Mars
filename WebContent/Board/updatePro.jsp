<%@page import="com.KHJ.member.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	

	if(id == null){
		response.sendRedirect("../Login/LoginForm.jsp");
	}


%>

	<jsp:useBean id="bb" class="com.KHJ.member.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
<%

	boardDAO bdao = new boardDAO();

	int check = bdao.updateBoard(bb);

	
	if(check == 1){
	%>	
		<script type="text/javascript">
			alert("수정 완료");
			location.href="boardList.jsp?pageNum=<%=pageNum%>";
		</script>
	<%	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	}else if(check == 0){
		%>
		<script type="text/javascript">
			alert("비밀번호 오류");
			history.back();
		</script>
		<%
		
	}else{
		%>
		<script type="text/javascript">
			alert("해당 글 없음");
			history.back();
		</script>
		<%
	}

%>












</body>
</html>