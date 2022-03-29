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
<title>Insert title here</title>
</head>
<body>

</body>
</html>