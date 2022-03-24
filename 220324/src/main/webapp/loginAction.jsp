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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
	
		// 자료입력 여부 확인
		if(user.getUserID() == null){
			script.println("<script>");
			script.println("alert('아이디를 입력해주세요.');");
			script.println("history.back();");
			script.println("</script>");
		} else if(user.getUserPassword() == null){
			script.println("<script>");
			script.println("alert('비밀번호를 입력해주세요.');");
			script.println("history.back();");
			script.println("</script>");
		} else{
			// DAO 실행
			String userID = null;
			if(session.getAttribute("userID") != null) {
				// 로그인 중
				userID = (String)session.getAttribute("userID");
				script.println("<script>");
				script.println("alert('로그인 중 입니다.');");
				script.println("location.href = './main.jsp';");
				script.println("</script>");
			}
			if(userID != null){
				
			}
			
			
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user);
			
			
			if(result == 1){
				// 로그인 성공
			
				// 세션 로그인 정보
				session.setAttribute("userID", user.getUserID());
				
				
				script.println("<script>");
				script.println("alert('로그인 성공');");
				script.println("location.href = './main.jsp';");
				script.println("</script>");
		
			}else if(result == -1){
				// 아이디 없음
		
				script.println("<script>");
				script.println("alert('아이디 없음');");
				script.println("history.back();");
				script.println("</script>");
		
			}else if(result == -2){
				// 패스워드 다름
		
				script.println("<script>");
				script.println("alert('패스워드 다름');");
				script.println("history.back();");
				script.println("</script>");
			
			}else if(result == -3){
				// 데이터베이스 오류
		
				
				script.println("<h1 style = 'text-align: center;'>");
				script.println("데이터베이스 관리자에게 문의하세요");
				script.println("<h1>");

		
			}
		}
	
		
			
	%> 
</body>
</html>