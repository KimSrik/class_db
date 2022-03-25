<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹게시판</title>
    <link rel="stylesheet" href="./css/read.css">
    <style>
        
    </style>
</head>
<body>
    <%
		String userID = null;
    	PrintWriter script = response.getWriter();
		if(session.getAttribute("userID") != null){
			//로그인 중
			userID = (String)session.getAttribute("userID");
		}else{
			//로그오프
			
			script.println("<script>");
			script.println("alert('잘못된 접근입니다. 매인페이지로 돌아갑니다.');");
			script.println("location.href='./main.jsp';");				
			script.println("</script>");
		}
		
		int noticeID = 0;
		
		if(request.getParameter("noticeID") != null){
			noticeID = Integer.parseInt(request.getParameter("noticeID"));
		}
		
		if(noticeID == 0){
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.');");
			script.println("location.href='./notice.jsp';");				
			script.println("</script>");
		}else{
			Notice notice = new Notice();
			
		}
		
		
	%>
    <div class="wrap">
        <header class="header">
            <div class="container">
                <nav class="nav">
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
                           		%>
                           			<!-- 로그인 아님 -->
	                            	<li><a href="./login.jsp">로그인</a></li>
	                            	<li><a href="./join.jsp">회원가입</a></li>
                            	<%	
                            	}else{
                           		%>
                            		<!-- 로그인 중임 -->
                            		<li><a href="./logoutAction.jsp">로그아웃</a></li>
                           		<%
                            	}
                            	%>
                            
                                
                                
                                
                                
                                
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <section class="sec main-sec">
            <div class="container">
                <div class="contents clearfix">                    
                    <div class="sec-tit">글읽기</div>
                    <div class="table">
                        <div class="n-tit">
                            제목
                            <br>
                            <input type="text" name="noticeTit" id="noticeTit" value="문의 드립니다." disabled>    
                        </div>
                        <div class="n-content">
                            내용
                            <br>
                            <textarea name="noticeContent" id="noticeContent"  disabled>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Beatae aperiam ipsa ullam tenetur veritatis, explicabo repellendus officia minus magni perspiciatis nam quis, iure aliquid sequi dolor vel molestias, pariatur temporibus.
                                Vitae maiores ullam quam magni incidunt necessitatibus facere eos. Quod, iusto rem earum dignissimos quae a exercitationem. In obcaecati nisi fugit ab, voluptates, necessitatibus, inventore architecto quidem eaque illo beatae!
                            </textarea>
                        </div>
                        
                    </div>
                    <div class="g-btn">
                        <button type="button"><a href="./update.jsp">수정</a></button>
                        <button type="button">삭제</button>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <address>
                    Copyright CHO
                </address>
            </div>
        </footer>
    </div>
</body>
</html>