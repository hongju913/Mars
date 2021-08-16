<%@page import="com.KHJ.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete success</title>
</head>
<body>
<%

	String id = (String)session.getAttribute("id");

	//로그인이 안되어있으면 로그인페이지로 이동하기
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("pw") == ""){
		%>
		<script type="text/javascript">
		 alert("비밀번호를 입력하세요.");
		 history.back();
		</script>
		<%
	}
	
	
	
	
%>

	<jsp:useBean id="mb" class="com.KHJ.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>

<%

	memberDAO mdao = new memberDAO();

	int delete = mdao.deleteCheck(mb);
	System.out.println("@@@@@@");
	//정상적으로 삭제완료
	if(delete == 1){
		
		%>
		<script type="text/javascript">
			var delCheck = confirm("회원정보가 삭제됩니다.");
			
			if(delCheck){
				
				<%
				session.invalidate();
				%>
				alert("회원정보가 삭제되었습니다.");
				<%
				response.sendRedirect("LoginForm.jsp");
				%>
				
			}else{
				
				alert("삭제가 취소되었습니다.");
				history.back();
			}
		
		</script>
		<%
	}else if(delete == 0){ //비밀번호 오류!! (데이터는 있음)
		%>
		<script type="text/javascript">
			alert("비밀번호 오류");
			history.back();
		</script>
		<%
	}else{
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