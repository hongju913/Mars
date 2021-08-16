<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.KHJ.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login success</title>
</head>
<body>


<%
	
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		//액션태그로 전달받은 정보 저장하기
	%>
		<jsp:useBean id="mb" class="com.KHJ.member.MemberBean" />
		
		<jsp:setProperty property="*" name="mb"/>
	<% 
		System.out.println("전달 정보 : " +mb);
	
		//DB이동 후 로그인 상태 판별
		//DB연결정보
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/universe";
		final String DBID = "root";
		final String DBPW = "1234";
		
		//1. 드라이버 로드
		Class.forName(DRIVER);
	
		//2. 디비연결
		Connection con = 
			DriverManager.getConnection(DBURL, DBID, DBPW);
		
		//3. sql구문 작성 & pstmt 객체 생성
		String sql = "select pw from universe_member where id=?";
		
		PreparedStatement pstmt =  con.prepareStatement(sql);
		
		//??
		pstmt.setString(1, mb.getId());
		
		
		//4. sql구문문 실행	
		ResultSet rs = pstmt.executeQuery();
		
		  // 5 데이터 처리 
	     if(rs.next()){ 
	    	 
			//회원이다 => 비밀번호를 통해서 본인확인!
	    	 if(mb.getPw().equals(rs.getString("pw")) ){
	    		 //비밀번호 같음 => 회원이다
	    		
	    	    // 로그인 성공 => 세션에 정보 저장하기
	    	    session.setAttribute("id", mb.getId() ); 
	    	    
	    	    // main.jsp 페이지 이동 %> 
	    	    <script type="text/javascript">
	    	   		 alert("<%=mb.getId()%>님 환영합니다.");
	    	   		location.href="main.jsp";
	    	    </script>		
	    	     <% 
	    	 }else{
	    		 //비밀번호만 다름 (회원일)
	    		 %>
	    		 <script type="text/javascript">
	    		   alert(" 비밀번호 오류!!! ");
	    		   history.back();
	    		 </script>    		 
	    		 <%
	    	 }
	     
	     }else{
	    	 // 비회원이다.
	    	 %>
			 <script type="text/javascript">
			    // confirm(" 비회원 입니다. 회원가입 하겠습니까? ")
			    // Y - 회원가입 페이지 이동, N -페이지 뒤로가기
			    var result = confirm(" 비회원 입니다. 회원가입 하겠습니까? ");
			    
			    if(result){
			    	location.href="insertForm.jsp";
			    }else{
			    	 history.back();
			    }
			   //alert(" 비회원 입니다 !!! ");
			  
			 </script>    		 
			 <%
	    	 
	     }
	%>
	







</body>
</html>