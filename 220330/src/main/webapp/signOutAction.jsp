<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>    
<%@ page import="user.UserDAO" %><!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바에서 자바스크립트 사용 -->
<% request.setCharacterEncoding("utf-8"); %><!-- 넘어온 한글자료 깨지지 않도록 -->


<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" />
<!-- 로그인 페이지에서 받아온 userID User.userID에 저장 -->
<jsp:setProperty name="user" property="userID" />
<!-- 로그인 페이지에서 받아온 userPassword User.userPassword에 저장 -->
<jsp:setProperty name="user" property="userPassword" />


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	
	
	
	
	//로그인상태 확인
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID=(String)session.getAttribute("userID");
	}
	
	//넘어온 userPassword를 초기화하고 request가 존재한다면 userPassword로 셋팅
	String userPassword = null;
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	String userPassword2 = null;
	if(request.getParameter("userPassword2") != null){
		userPassword2 = request.getParameter("userPassword2");
	}
	
	System.out.println("패스워드 1 : " + userPassword);
	System.out.println("패스워드 2 : " + userPassword2);
	User UserDAO = new UserDAO().getUser(userID);
	System.out.println("현재 패스워드 : " + UserDAO.getUserPassword());

	
	//로그인중일때 로그인방지
	if(userID == null){
		script.println("<script>");
		script.println("alert('회원전용 기능입니다.')");
		script.println("location.href='./main.jsp'");
		script.println("</script>");
	}else if(!userPassword.equals(UserDAO.getUserPassword())){
		script.println("<script>");
		script.println("alert('비밀번호가 틀렸습니다.')");
		script.println("history.back();");
		script.println("</script>");
	}else if(!userPassword.equals(userPassword2)){
		script.println("<script>");
		script.println("alert('두 비밀번호가 서로 다릅니다.')");
		script.println("history.back();");
		script.println("</script>");
	}else{	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.deleteUser(userID,userPassword);
		//탈퇴성공
		if(result == 1){
			script.println("<script>");
			script.println("alert('회원 탈퇴 성공')");
			script.println("location.href='./logoutAction.jsp'");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('사용자 정보를 확인하세요')");
			script.println("history.back();");
			script.println("</script>");
		}
		
	}

	%>
</body>
</html>








