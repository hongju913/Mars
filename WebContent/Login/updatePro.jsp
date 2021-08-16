<%@page import="java.sql.ResultSet"%>
<%@page import="com.KHJ.member.memberDAO"%>
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
	String id = (String)session.getAttribute("id");

	//아이디가 없는경우 -> 로그인페이지로 돌아가기
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}

	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="mb" class="com.KHJ.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
		
<%
	memberDAO mdao = new memberDAO();
	
	int update = mdao.updateCheck(mb);

	//정상 수정 완료
	if(update == 1){
		%>
		<script type="text/javascript">
			alert("정보 수정 완료");
			location.href="main.jsp";
		</script>
		<%
	}else if(update == 0){ //글은 있지만 비밀번호 오류로 수정 실패
		%> 
		<script type="text/javascript">
			alert("비밀번호 오류");
			history.back();
		</script>
		<% 
	}else{ //없는정보 수정 실
		%> 
		<script type="text/javascript">
			alert("아이디 없음");
			history.back();
		</script>
		<% 
	}
	
%>



</body>
</html>