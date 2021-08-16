<%@page import="com.KHJ.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>IDCheckPage</title>
<script type="text/javascript">
	
	function idFix(){
		opener.document.lfr.id.value = document.ofr.userid.value;
		
		window.close();
	}

	function idck(){
		window.close();
	}


</script>
</head>
<body>


	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form action="insertIDCheck.jsp" method="post" name="ofr">
					<h3 style="text-align: center">Login</h3>
						<div class="form-group">
													
							<%
								String id = request.getParameter("userid");
							
								memberDAO mdao = new memberDAO();
								
								int result = mdao.idCheck(id);
							
								if(result == 1){//회원정보가 있다 -> 해당 아이디사용불가능
									out.print("이미 사용중인 아이디입니다.");
								%>
								<input type="button" class="btn btn-outline-warning" value="닫기"
										   onclick="idck()">
								<%
								
								}else{//회원정보가 없다 -> 해당 아이디사용불가
									out.print("사용 가능한 아이디입니다.");
								%>
									<input type="button" class="btn btn-outline-warning" value="아이디 사용하기"
										   onclick="idFix()">
								<%
								
								}
							%>
													
						<input type="text" class="form-control" value="<%=id %>" name="userid" maxlength="20"> <br>
						</div>
				</form>

			 </div>
		<div class="col-lg-4"></div>
	</div>

</div>



</body>
</html>