<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- 회원가입 페이지에서 받아온 userID User.userID에 저장 -->
<jsp:setProperty name="user" property="userID"/>
<!-- 회원가입 페이지에서 받아온 userPassword User.userPassword에 저장 -->
<jsp:setProperty name="user" property="userPassword"/>
<!-- 회원가입 페이지에서 받아온 userName User.userName에 저장 -->
<jsp:setProperty name="user" property="userName"/>
<!-- 회원가입 페이지에서 받아온 userGender User.userGender에 저장 -->
<jsp:setProperty name="user" property="userGender"/>
<!-- 회원가입 페이지에서 받아온 userEmail User.userEmail에 저장 -->
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
	
	// 로그인 상태 확인
				String userID = null;
				if(session.getAttribute("userID") != null){
					userID = (String)session.getAttribute("userID");
				}
		
		
		// 로그인중일때 로그인 방지
		if(userID != null){
			script.println("<script>");
			script.println("alert('로그인 상태입니다.');");
			script.println("location.href = './main.jsp';");
			script.println("</script>");
		}else{
	
			if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null){
				script.println("<script>");
				script.println("alert('가입정보를 확인해주세요.');");
				script.println("history.back();");
				script.println("</script>");
			}else {
				session.setAttribute("userID", user.getUserID());
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(user.getUserID(), user.getUserPassword(), user.getUserName(), user.getUserGender(), user.getUserEmail());
				script.println("<script>");
				if(result == -1){
					// 로그인 성공					
					script.println("alert('회원가입 실패.');");
					script.println("history.back()");
				}else{
					// 데이터베이스 오류
					script.println("alert('회원가입 성공.');");
					script.println("location.href = './main.jsp';");
				}
				script.println("</script>");
			}
		}
	%>
</body>
</html>