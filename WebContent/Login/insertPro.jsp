<%@page import="com.KHJ.member.memberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUp success</title>
</head>
<body>


 



<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	if(request.getParameter("id") == ""){
		%>
		<script type="text/javascript">
		 alert("아이디를 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("pw") == ""){
		%>
		<script type="text/javascript">
		 alert("비밀번호를 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("name") == ""){
		%>
		<script type="text/javascript">
		 alert("이름을 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("age") == ""){
		%>
		<script type="text/javascript">
		 alert("나이를 입력하세요.");
		 history.back();
		</script>
		<%
	}else if(request.getParameter("email") == ""){
		%>
		<script type="text/javascript">
		 alert("이메일을 입력하세요.");
		 history.back();
		</script>
		<%
	}






%>
	<%-- 액션태그로 파라미터값 저장 --%>>
	<jsp:useBean id="mb" class="com.KHJ.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
<%
	//회원가입 날짜 정보 (시간)
	mb.setRegdate(new Timestamp(System.currentTimeMillis()));
	System.out.println("객체정보 : " +mb);
	
	memberDAO mdao = new memberDAO();
 	mdao.InsertBoard(mb);

%>
<script type="text/javascript">
	alert("회원가입 완료");
	location.href = "LoginForm.jsp";

</script>




</body>
</html>