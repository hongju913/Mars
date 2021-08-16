<%@page import="com.KHJ.member.FileDAO"%>
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
	String pageNum = request.getParameter("pageNum");
%>

	<jsp:useBean id="fb" class="com.KHJ.member.FileBeanF"/>
	<jsp:setProperty property="*" name="fb"/>
	
<%
	FileDAO bdao = new FileDAO();

	int check = bdao.deleteBoard(fb);
	
	
	if(check == 1){
		%>
		<script type="text/javascript">
			var delCheck = confirm("게시글이 삭제됩니다.");
			
			if(delCheck){
				
				alert("게시글이 삭제되었습니다.");
				location.href="boardList.jsp?pageNum=<%=pageNum%>";
				
			}else{
				
				alert("삭제가 취소되었습니다.");
				history.back();
			}
		
		</script>
			<%
		}else if(check == 0){ //비밀번호 오류!! (데이터는 있음)
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