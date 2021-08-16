<%@page import="java.util.ArrayList"%>
<%@page import="com.KHJ.member.BoardBean"%>
<%@page import="com.KHJ.member.boardDAO" %>
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

<title>BoardList</title>

<style>

	.page {text-align: center;}


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


	boardDAO bdao = new boardDAO();

	int cnt = bdao.getBoardCount();

	//페이지 당 보이는 글의 갯수
	int pageSize = 10;

	//현재페이지 확인
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null || pageNum==""){
			pageNum = "1";
	}
System.out.println(pageNum);
	//현재페이지
	int currentPage = Integer.parseInt(pageNum);
	//페이지별 시작행 계산
	int startRow = (currentPage-1)*pageSize+1;
	
	//끝행
	int endRow = currentPage*pageSize;
	
	//////
	
	ArrayList boardList = bdao.getBoardList(startRow, pageSize);
	
%>
<br><br><br><br>

&nbsp; <small>글 목록 [<%=cnt %>]</small> <small style="float: right">Board</small>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">subject</th>
      <th scope="col">name</th>
      <th scope="col">date</th>
      <th scope="col">hits</th>
    </tr>
  </thead>
<%
	for(int i=0;i<boardList.size();i++){
		BoardBean bb = (BoardBean)boardList.get(i);

%>
<tbody>
    <tr>
      <th scope="row"><%=bb.getNum() %></th>
      <td><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum %>" 
      		 style="color: #50c100;"><b><%=bb.getSubject() %></a></b></td>
      <td><%=bb.getName() %></td>
      <td><%=bb.getDate() %></td>
      <td><%=bb.getReadcount() %></td>
    </tr>
  
<%
	}
%>
</table>
<div class="page">
	<div class="page.1">
<%
	if(cnt != 0){
		
		//전체 페이지 수 
		int pageCount = cnt/pageSize+(cnt%pageSize == 0? 0 : 1);
		
		//페이지 블럭
		int pageBlock = 10;
		
		//페이지 블럭 시작페이지 번호	
		int startPage = ((currentPage-1)/pageBlock)*pageBlock +1;
		
		//페이지 블럭의 끝 페이지 번호	
		int endPage = startPage+pageBlock-1;
		
		//페이지 블럭의 끝 페이지 번호
		if(endPage > pageCount){
				endPage = pageCount;
		}
		
		//이전 (해당 페이지블럭 첫번째 페이지 호출)
		if(startPage > pageBlock){
			%>
			<button type="button" id="form-submit" class="main-button-icon"
			onclick="location.href='boardList.jsp?pageNum=<%=startPage-pageBlock%>'">이전 
			<i class="fa fa-arrow-right"></i></button>
			
			<%
		}
		
		//1 ~ n 페이지
		for(int i=startPage;i<=endPage;i++){
			%>
			<a href="#" class="main-filled-button"
                  	 onclick="location.href='boardList.jsp?pageNum=<%=i%>'"><%=i %></a>
			
			<%
		}
		
		if(endPage < pageCount){
			%>
			<button type="button" id="form-submit" class="main-button-icon"
			onclick="location.href='boardList.jsp?pageNum=<%=startPage+pageBlock%>'">다음 
			<i class="fa fa-arrow-right"></i></button>
			
			<%
			
		}
		
	}
	

	if(id != null){
		if(id.equals("1206")){
%>  
		 <a href="#" class="main-filled-button"
		                  	 onclick="location.href='writeForm.jsp'"
		                  	 style="float: right;">글쓰기</a>
                  	 
<%
		}
	}
%>        	 
	</div>
</div>

  

  
  
  


</body>
</html>