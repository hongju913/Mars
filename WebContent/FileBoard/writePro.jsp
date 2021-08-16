<%@page import="com.KHJ.member.FileBeanF"%>
<%@page import="com.KHJ.member.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<%
	String id = (String)session.getAttribute("id");
	
	request.setCharacterEncoding("UTF-8");
	
	 String path = request.getRealPath("/upload");
	   
	   System.out.println("파일저장되는 실제 경로 : "+path);
	   
	   // 2) 파일의 크기를 지정 -> 10MB
	   int maxSize = 10 * 1024 * 1024;
		
		// 파일 업로드 => Multipart객체를 생성
		 MultipartRequest multi 
	      = new MultipartRequest(
	    		  request,
	    		  path,
	    		  maxSize,
	    		  "UTF-8",
	    		  new DefaultFileRenamePolicy()
	    		  );	
	   
	   System.out.println(" 파일 업로드 완료! ");
	   
	   // 이전페이지에서 전달해준 정보를 출력
	   String name = multi.getParameter("name");
	   String subject = multi.getParameter("subject");
	   
	   // -> 서버에 올라가는 파일의 이름(중복 처리)
	   String filename = multi.getFilesystemName("filename");
	   // -> 서버에 올라가는 파일 이름 X 파일 자체의 이름
	   String oFileName = multi.getOriginalFileName("filename");
	  System.out.println("file이름 : " +filename + oFileName);

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
<%
	FileBeanF fb = new FileBeanF();
	
	fb.setName(multi.getParameter("name"));
	fb.setPass(multi.getParameter("pass"));
	fb.setSubject(multi.getParameter("subject"));
	fb.setFile(filename);
	fb.setContent(multi.getParameter("content"));
	
	fb.setIp(request.getRemoteAddr());

	
	FileDAO fdao = new FileDAO();
	
	fdao.writeBoard(fb);
	
	response.sendRedirect("boardList.jsp");


%>





</body>
</html>