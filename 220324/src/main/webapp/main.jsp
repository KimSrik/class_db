<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹게시판</title>
    <link rel="stylesheet" href="./css/main.css">
    <style>
        

    </style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			// 로그인 중
			userID = (String)session.getAttribute("userID");
		}
	%>
    <div class="wrap">
        <header class="header">
            <div class="container">
                <div class="nav">
                    <ul class="gbl-nav">
                        <li class="nav-left">
                            <ul>
                                <li class="logo"><a href="./main.jsp">게시판 만들기</a></li>
                                <li><a href="./main.jsp" class="active">메인</a></li>
                                <%
                                	if(userID != null){                            
                                %>
                                <li><a href="./notice.jsp">게시판</a></li>
                                <%
                                	}
                                %>
                            </ul>
                        </li>
                        <li class="nav-right">
                            <ul>
                            	<% 
                            		if(userID == null){
                            			// 로그인 중 아님.
                        		%>
                        			<li><a href="./login.jsp">로그인</a></li>
                                	<li><a href="./join.jsp">회원가입</a></li>
                        		<%
                            		}else{
                            			// 로그인 중
                            	%>
                            		<li><a href="./logoutAction.jsp">로그아웃</a></li>
                            	<%
                            		}
                            	%>
                                
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <section class="sec main-sec">
            <div class="container">
                <div class="contents">
                	<div class="contents-tit">환영합니다.</div>
                		<% 
                          		if(userID == null){
                         			// 로그인 중 아님.
                        %>
                    
                    <div class="contents-txt">로그인 후 게시판 작성이 가능합니다.</div>
                    	<%
                          		}else{
                            			// 로그인 중
                       	%>
                    <div class="contents-txt">이제 게시판 이용이 가능합니다.</div>
                    <div class="contents-txt" style="display:none">자유롭게 게시판 기능을 사용할 수 있습니다.</div>
                    	<%
                           		}
                       	%>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <address>
                    Copyright KIM
                </address>
            </div>
        </footer>
    </div>
</body>
</html>