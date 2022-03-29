<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>

<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css">
<title>JSP를 이용한 게시판 만들기</title>
</head>
<body>
	<%
			PrintWriter script = response.getWriter();		
	
			// 로그인 상태 확인
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
			
			
			// 존재하지 않는 또는 잘못된 접근 처리
			if(userID == null){
				script.println("<script>");
				script.println("alert('잘못된 접근입니다.');");
				script.println("location.href = './login.jsp';");
				script.println("</script>");
			}
			
			
			User user = new UserDAO().infoCheck(userID);
	%>


	<section class="wrap">
		<!-- 공통 영역 -->
		<header>
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="#" class="navbar-brand">JSP를 이용한 게시판 만들기</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="./main.jsp">메인</a></li>
						<li><a href="./bbs.jsp">게시판</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
							
							
							<%
								if(userID == null){
							%>
							
								
							<!-- 로그아웃 상태 -->	
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="active"><a href="./login.jsp">로그인</a></li>
								<li><a href="./join.jsp">회원가입</a></li>
							</ul>
							
							<%} else{ %>
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">마이페이지<span class="caret"></span></a>
							<!-- 로그인 상태 -->
							<ul class="dropdown-menu">
								<li><a href="./infoCheck.jsp">회원정보확인</a></li>
								<li><a href="./join.jsp">패스워드변경</a></li>
								<li><a href="./join.jsp">회원 탈퇴</a></li>
								<li class="active"><a href="./logoutAction.jsp">로그아웃</a></li>
								
							</ul>
							
							<%} %>
							
						</li>
					</ul>
				</div>
			</nav>
		</header>
		
		<!-- 페이지별 컨텐츠 영역 시작 -->
		<section>
			<!-- 나의 정보 양식 -->
			<div class="container">
				<div class="col-lg-12">
					<div class="jumbotron" style="margin-top: 20px; padding-top: 30px">
						<h2 style="text-align: center">내 정보 보기</h2>
						<div>
							<span>아이디</span>
							<span><%= user.getUserID() %></span>
							<br>
							<span>이름</span>
							<span><%= user.getUserName() %></span>
							<br>
							<span>성별</span>
							<span><%= user.getUserGender() %></span>
							<br>
							<span>이메일</span>
							<span><%= user.getUserEmail() %></span>
						</div>
					</div>
					<div class="button-group">
						<a href="./main.jsp" class="btn btn-success">메인으로</a>
					</div>
				</div>
			</div>	
		</section>
		
	</section>
	
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
</body>
</html>