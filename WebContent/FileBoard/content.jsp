₩<%@page import="com.KHJ.member.FileDAO"%>
<%@page import="com.KHJ.member.FileBeanF"%>
<%@page import="com.KHJ.member.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">



    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">


	
	<!--
	
	Breezed Template
	
	https://templatemo.com/tm-543-breezed
	
	-->
	    <!-- Additional CSS Files -->
	    <link rel="stylesheet" type="text/css" href="../temp/assets/css/bootstrap.min.css">
	
	    <link rel="stylesheet" type="text/css" href="../temp/assets/css/font-awesome.css">
	
	    <link rel="stylesheet" href="../temp/assets/css/templatemo-breezed.css">
	
	    <link rel="stylesheet" href="../temp/assets/css/owl-carousel.css">
	
	    <link rel="stylesheet" href="../temp/assets/css/lightbox.css">
	
	
	
	
	<title>content</title>
	<style>
	img { max-width: 100%; height: auto; }
	
	.im01 { width: 25%; }
	
	
	
	</style>
	
	</head>
	<body>
	
	  
	    <!-- ***** Header Area Start ***** -->
	    <header class="header-area header-sticky">
	        <div>
	            <div class="row">
	                <div class="col-12">
	                    <nav class="main-nav">
	                        <!-- ***** Logo Start ***** -->
	                        <a href="../Login/main.jsp" class="logo" style="color: #50c100;">
	                            &nbsp.Mars
	                        </a>
	                        <!-- ***** Logo End ***** -->
	
	                    </nav>
	                </div>
	            </div>
	        </div>
	    </header>
	    <!-- ***** Header Area End ***** -->
	
	<%
	
	
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			response.sendRedirect("../Login/LoginForm.jsp");
		}
		
	
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//전달되는 파라미터값 저장 (name, subject, filename, oFileName)
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String filename = request.getParameter("filename");
		String oFileName = request.getParameter("oFileName");
	
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		FileDAO fdao = new FileDAO();
		//조회수 +1 증가
		fdao.updateReadCount(num);
		
		//DB에서 글번호(num)에 해당하는 글정보를 모두 가져와 출력하기
		FileBeanF fb = fdao.getBoard(num);
		
	%>
	
	<br><br><br>
	
	<table class="table">
	    <tr>
	      <th scope="col">#</th>
	      <td><%=fb.getNum() %></td>
	      <th scope="col">hits</th>
	      <td><%=fb.getReadcount() %></td>
	    </tr>
	
		<tr>
	      <th scope="col">name</th>
	      <td><%=fb.getName() %></td>
	      <th scope="col">date</th>
	      <td><%=fb.getDate() %></td>
	    </tr>  
	    
		<tr>      
	      <th scope="col">subject</th>
	      <td colspan="3" style="color: #50c100;"><b><%=fb.getSubject() %></b></td>
	    </tr>
	    <tr>      
	      <th scope="col">file</th>
	      
		<%if(fb.getFile() != null){ %> 
		
	      <td colspan="3" style="color: #50c100;"><b><a href="file_down.jsp?filename=<%=fb.getFile()%>">
								<%=fb.getFile() %></a></b></td>
	
	    	<%} %>
	    </tr>
		<tr>
			<th scope="col">content</th>
			<td colspan="3" rowspan="4"><%=fb.getContent() %> <br><br>
			<%if(fb.getFile() != null){ %>	
			<div id="im01">
			  <img src="../upload/<%=fb.getFile()%>" >
			</div>
			   	<%} %>
			</td>
			
		</tr>
		
	    
	  <%
	  	//목록으로 가기, 조회수 증가 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	  %>
	  
	</table>
	
		<button type="button" id="form-submit" class="main-button-icon"
		onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';" style="float: left;">목록으로 
		<i class="fa fa-arrow-right"></i></button>		
	
		<a href="#" class="main-filled-button" style="float: right;"
	             onclick="location.href='updateForm.jsp?num=<%=fb.getNum()%>&pageNum=<%=pageNum%>';">수정하기</a>
		<a href="#" class="main-filled-button" style="float: right;"
	             onclick="location.href='deleteForm.jsp?num=<%=fb.getNum()%>&pageNum=<%=pageNum%>';">삭제하기</a>
	
	
	
	
	
	
	
	
	
	
	</body>
	</html>