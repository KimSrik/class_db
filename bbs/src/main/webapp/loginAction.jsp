<%@ 
	page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
%>

<%@ 	
	page import = "user.UserDAO"
%>

<%@ 
	page import = "java.io.PrintWriter"
%>
    
<% 
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>

	<%
		UserDAO userDAO = new UserDAO();

		int rst = userDAO.login(user.getUserID(), user.getUserPassword());
		PrintWriter script = response.getWriter();
		
		if(rst == 100){
			// 로그인 성공 페이지
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else if(rst == -100) {
			// 패스워드 다시 입력하는 페이지
			script.println("<script>");
			script.println("alert('패스워드 확인하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else if(rst == -200) {
			// 아이디가 존재하지 않습니다. 회원가입 페이지로 이동합니다.
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다. 회원가입 페이지로 이동합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else if(rst == -300){
			// 데이터베이스가 고장났어요.
			script.println("<script>");
			script.println("alert('데이터베이스가 고장났어요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>


</body>
</html>







