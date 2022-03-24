<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "notice.NoticeDAO" %>
<%@ page import = "java.io.PrintWriter" %>


<!-- setCharacterEncoding는 데이터를 주고 받을 인코딩 값을 정할 수 있다. -->
<% request.setCharacterEncoding("utf-8"); %>

<!-- xml에서는 단일 태그로 사용할 때 마지막에 / 로 닫아주는게 안정성이 높다. -->

<!-- scope는 적용범위 / page는 현재 페이지 -->
<jsp:useBean id="notice" class="notice.Notice" scope="page"/>
<jsp:setProperty name="notice" property="noticeTit"/>
<jsp:setProperty name="notice" property="noticeContent"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userID = null;
		if(session.getAttribute("userID") != null) {
			// 로그인 중
			userID = (String)session.getAttribute("userID");
		}
	
		NoticeDAO noticeDAO = new NoticeDAO();
		int result = noticeDAO.write(notice.getNoticeTit(), userID, notice.getNoticeContent());
	
		if(result == -3){
			// 데이터베이스 오류			
			script.println("<script>");
			script.println("alert('데이터베이스 오류');");
			script.println("location.href = './write.jsp';");
			script.println("</script>");
		}else{
			// 게시판 작성 성공
			script.println("<script>");
			script.println("alert('게시판 작성이 완료되었습니다.');");
			script.println("location.href = './notice.jsp';");
			script.println("</script>");
		}
	
		
	%> 
</body>
</html>