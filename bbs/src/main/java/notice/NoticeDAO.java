package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class NoticeDAO {

	private Connection conn;  
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 데이터베이스 접근개체
	public NoticeDAO() {
		  try {
			  String dbURL = "jdbc:mysql://localhost:3306/bbs";
			  String dbID="root";
			  String dbPassword = "root";
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		  }catch (Exception e){
			  e.printStackTrace();
		  }
	}
	
	
	//일련번호 작성
	public int docNum() {
		String SQL = "SELECT noticeID FROM notice order by noticeID desc";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1)+1;
			 }
			 return 1;			 			
		}catch (Exception e){
			  e.printStackTrace();
	    }
		return -3;
	}
	
	//작성일 자동 입력
	public String docDate() {
		String SQL ="select date(now())";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 System.out.println(rs.getString(1));
			 	return rs.getString(1);
			 }
		}catch (Exception e){
			  e.printStackTrace();
	    }
		return "";	
	}
	

	// 게시글 작성 
    public int write(String noticeTit, String userID, String noticeContent) {
		  String SQL="INSERT INTO notice VALUES(?,?,?,?,?);";
		  try {
			  PreparedStatement pstmt = conn.prepareStatement(SQL);			  
			  pstmt.setInt(1, docNum());//noticeID
			  pstmt.setString(2, noticeTit);//noticeTit			  
			  pstmt.setString(3, noticeContent);//noticeContent
			  pstmt.setString(4, userID);//noticeName
			  pstmt.setString(5, docDate()); //noticeDate
			  return  pstmt.executeUpdate();
		  }catch (Exception e){
			  e.printStackTrace();
		  }
		  return -3;	  
	  }
	
	   
    
    
    
    
	// 게시글 리스트 작성
    public ArrayList<Notice> noticeList(int pageNumber){
    	String SQL = "select * from notice where noticeID < ? order by noticeID desc limit 10;";
    	ArrayList<Notice> list = new ArrayList<Notice>();
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, docNum() - (pageNumber - 1) * 10);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			Notice notice = new Notice();
    			notice.setNoticeID(rs.getInt(1));
    			notice.setNoticeTit(rs.getString(2));
    			notice.setNoticeContent(rs.getString(3));
    			notice.setNoticeName(rs.getString(4));
    			notice.setNoticeDate(rs.getString(5));
    			list.add(notice);
    		}
    		return list;
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return list;
    }
    
    // 이전 다음 페이지 이동 메서드
    public boolean nextPage(int pageNumber) {
    	String SQL = "select * from notice where noticeID < ?";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, docNum() - (pageNumber - 1) * 10);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return true;
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    
    // 선택한 게시물 보기
    public Notice readCon(int viewID) {
    	String SQL = "select * from notice where noticeID = ?";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		pstmt.setInt(1, viewID);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			Notice notice = new Notice();
    			notice.setNoticeID(rs.getInt(1));
    			notice.setNoticeTit(rs.getString(2));
    			notice.setNoticeContent(rs.getString(3));
    			notice.setNoticeName(rs.getString(4));
    			notice.setNoticeDate(rs.getString(5));
    			return notice;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return null;
    }
	  
}







