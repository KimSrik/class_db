<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>

<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<!-- write 페이지에서 받아온 bbsTitle Bbs.bbsTitle에 저장 -->
<jsp:setProperty name="bbs" property="bbsTitle"/>
<!-- write 페이지에서 받아온 bbsContent Bbs.bbsContent에 저장 -->
<jsp:setProperty name="bbs" property="bbsContent"/>


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
		if(userID == null){
			script.println("<script>");
			script.println("alert('로그인 후 이용가능합니다.');");
			script.println("location.href = './login.jsp';");
			script.println("</script>");
		}else {
	
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				script.println("<script>");
				script.println("alert('문서 내용을 확인해주세요.');");
				script.println("history.back();");
				script.println("</script>");
			}else {
				
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				script.println("<script>");
				if(result == -1){				
					script.println("alert('글쓰기 실패.');");
					script.println("location.href = './main.jsp';");
				}else{
					script.println("alert('글쓰기 성공.');");
					script.println("location.href = './bbs.jsp';");
				}
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>