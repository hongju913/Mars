<%@page import="com.KHJ.member.FileDAO"%>
<%@page import="com.KHJ.member.FileBeanF"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	
	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");
	   
	   // -> 서버에 올라가는 파일의 이름(중복 처리)
	   String filename = multi.getFilesystemName("filename");
	   // -> 서버에 올라가는 파일 이름 X 파일 자체의 이름
	   String oFileName = multi.getOriginalFileName("filename");
	  System.out.println("file이름 : " +filename + oFileName);
	


	FileBeanF fb = new FileBeanF();
	
	fb.setNum(Integer.parseInt( multi.getParameter("num")));
	fb.setName(multi.getParameter("name"));
	fb.setPass(multi.getParameter("pass"));
	fb.setSubject(multi.getParameter("subject"));
	fb.setFile(filename);
	fb.setContent(multi.getParameter("content"));
	
	fb.setIp(request.getRemoteAddr());

	
	System.out.println(fb);

	FileDAO fdao = new FileDAO();

	int check = fdao.updateBoard(fb);

	
	if(check == 1){
	%>	
		<script type="text/javascript">
			alert("게시판 글 수정 완료");
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