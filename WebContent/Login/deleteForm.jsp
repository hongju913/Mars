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

<meta charset="UTF-8">
<title>delete Info</title>

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

	//로그인 안했을경우 로그인 페이지로 이동하기
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");

%>
<br><br><br>
	<form action="deletePro.jsp" method="post">
	
			
		<table class="table table-borderless" id="mc">
			 <thead>
		    <tr>
		      <th scope="col">id</th>
			  <td><input type="text" name="id" value="<%=id%>" readonly> </td>
		    </tr>
		     <tr>
		      <th scope="col">password</th>
			  <td> <input type="password" name="pw" placeholder="비밀번호 확인 후 삭제됩니다."> </td>
		    </tr>
		  </thead>

		</table>

	&nbsp&nbsp&nbsp<input type="submit" class="btn btn-light" value="delete" style="color: #50c100;">

</form>


</body>
</html>