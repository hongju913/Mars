<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>sign up</title>

<script type="text/javascript">
	
	function winopen(){
		
		if(document.lfr.id.value == ""){
			alert("아이디를 입력하세요.");
			document.fr.id.focus();
			return;
		}
		
		var userid = document.lfr.id.value;
		
		window.open("insertIDCheck.jsp?userid=" +userid,"","width=400, height=240");
		
	}
	
	

</script>
</head>
<body>

<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
			<img src="../temp/assets/images/features-icon-1.png" alt="" onclick="location.href='../temp/index.jsp'"><br>
				<form action="insertPro.jsp" method="post" name="lfr">
					<h4 style="text-align: center; color: #50c100;">Sign Up</h4><br>
						<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"> <br>
									<input type="button" class="btn btn-outline-secondary" value="ID 중복체크" onclick="winopen();"> <br>
						</div>
						<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="20"> <br>
						</div>
						<div class="form-group">
								<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20"> <br>
						</div>
						<div class="form-group">
								<input type="text" class="form-control" placeholder="나이" name="age" maxlength="20"> <br>
						</div>
						<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="email" maxlength="20"> <br>
						</div>
						<input type="submit" class="btn btn-light" value="Sign Up!" style="color: #50c100;"> <br> <br>
					
				</form>

			 </div>
		<div class="col-lg-4"></div>
	</div>

</div>



</body>
</html>