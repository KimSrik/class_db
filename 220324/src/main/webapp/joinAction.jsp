<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>


<!-- setCharacterEncoding는 데이터를 주고 받을 인코딩 값을 정할 수 있다. -->
<% request.setCharacterEncoding("utf-8"); %>

<!-- xml에서는 단일 태그로 사용할 때 마지막에 / 로 닫아주는게 안정성이 높다. -->

<!-- scope는 적용범위 / page는 현재 페이지 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userAddress"/>
<jsp:setProperty name="user" property="userBirthday"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPhone"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		// 자료 입력 여부
		
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserAddress() == null || user.getUserBirthday() == null || user.getUserGender() == null || user.getUserEmail() == null || user.getUserPhone() == null)
		{
			script.println("<script>");
			script.println("alert('입력이 누락되었습니다..');");
			script.println("history.back();");
			script.println("</script>");
		}else {
			if(session.getAttribute("userID") != null) {
				// 로그인 중
				script.println("<script>");
				script.println("alert('로그인 중 입니다.');");
				script.println("location.href = './main.jsp';");
				script.println("</script>");
			}
		
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
		
			if(result == -3){
				// 데이터베이스 오류			
				
				script.println("<script>");
				script.println("alert('데이터베이스 오류');");
				script.println("location.href = './join.jsp';");
				script.println("</script>");
			}else{
				// 회원가입 성공
				script.println("<script>");
				script.println("alert('회원가입을 환영합니다.');");
				script.println("location.href = './main.jsp';");
				script.println("</script>");
			}
		}
		
	%> 
</body>
</html>