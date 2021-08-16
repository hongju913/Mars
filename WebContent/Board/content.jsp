<%@page import="com.KHJ.member.BoardBean"%>
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
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	boardDAO bdao = new boardDAO();
	
	//조회수 +1 증가
	bdao.updateReadCount(num);
	
	//DB에서 글번호(num)에 해당하는 글정보를 모두 가져와 출력하기
	BoardBean bb = bdao.getBoard(num);
	
%>

<br><br><br>

<table class="table">
    <tr>
      <th scope="col">#</th>
      <td><%=bb.getNum() %></td>
      <th scope="col">hits</th>
      <td><%=bb.getReadcount() %></td>
    </tr>

	<tr>
      <th scope="col">name</th>
      <td><%=bb.getName() %></td>
      <th scope="col">date</th>
      <td><%=bb.getDate() %></td>
    </tr>  
    
	<tr>      
      <th scope="col">subject</th>
      <td colspan="3" style="color: #50c100;"><b><%=bb.getSubject() %></b></td>
    </tr>
	<tr>
		<th scope="col">content</th>
		<td colspan="3" rowspan="4"><%=bb.getContent() %></td>
	</tr>
    
  <%
  	//목록으로 가기, 조회수 증가 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  
  %>
  
</table>

	<button type="button" id="form-submit" class="main-button-icon"
	onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>';" style="float: left;">목록으로 
	<i class="fa fa-arrow-right"></i></button>		

	<a href="#" class="main-filled-button" style="float: right;"
             onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';">수정하기</a>
	<a href="#" class="main-filled-button" style="float: right;"
             onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';">삭제하기</a>










</body>
</html>