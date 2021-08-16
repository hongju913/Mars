<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<head>




<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>LoginForm</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			 
			<div class="jumbotron" style="padding-top: 20px">
			 <img src="../temp/assets/images/features-icon-1.png" alt="" onclick="location.href='../temp/index.jsp'">
				<form action="LoginPro.jsp" method="post">
				
					<h4 style="text-align: center; color: #50c100;">Login</h4><br>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"> <br>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20"> <br>
						</div>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<input type="submit" class="btn btn-light" value="Login" style="color: #50c100;" > 
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<input type="button" class="btn btn-light" value="Sign Up" style="color: #50c100;"
							   onclick="location.href='insertForm.jsp'">
				</form>

			 </div>
		<div class="col-lg-4"></div>
	</div>

</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>



</body>
</html>