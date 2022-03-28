<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- 로그인 페이지에서 받아온 userID User.userID에 저장 -->
<jsp:setProperty name="user" property="userID"/>
<!-- 로그인 페이지에서 받아온 userPassword User.userPassword에 저장 -->
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
		}
	
	
		/* 자료입력 확인 */
		if(user.getUserID() == null || user.getUserPassword() == null){
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 확인해주세요.');");
			script.println("history.back();");
			script.println("</script>");
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user.getUserID(), user.getUserPassword());
			script.println("<script>");
			if(result == 1){
				// 로그인 성공	
				// 세션을 생성
				session.setAttribute("userID", user.getUserID());
				script.println("alert('로그인성공.');");
				script.println("location.href = './main.jsp';");
			}else if(result == -1){
				// 패스워드 불일치
				script.println("alert('패스워드를 확인하세요.');");
				script.println("history.back();");
			}else if(result == -2){
				// 아이디 없음
				script.println("alert('아이디를 확인하세요.');");
				script.println("history.back();");
			}else if(result == -3){
				// 데이터베이스 오류
				script.println("alert('데이터베이스 오류.');");
				script.println("history.back();");
			}
			script.println("</script>");
		}
		
	%>
</body>
</html>