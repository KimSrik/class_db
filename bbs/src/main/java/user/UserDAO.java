package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {	// Database Access Object
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try{
// 실행될 코드				
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e) {
// 예외처리
			e.printStackTrace();
		}
	}
	
//	로그인 관련 메서드
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) { // .next()는 결과값을 가지고 있으면 true를 반환.
//	성공(ID가 존재할때)
//	해당 아이디를 갖는 자료가 존재
				if(rs.getString(1).equals(userPassword)) {
//	로그인 성공					
					return 100;
				}else {
//	패스워드 불일치				
					return -100;
				}
			}else {
//	실패				
				return -200; 	// 아이디가 존재하지 않는다.
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;		// 데이터베이스 오류
	}
	
//	회원가입 관련 메서드
	public int join(User user) {
		String SQL = "insert into user values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserPhone());
			
			return pstmt.executeUpdate();
			//System.out.println(SQL);
		}catch(Exception e){
			e.printStackTrace();
		}
		return -300;
	}
	
}
