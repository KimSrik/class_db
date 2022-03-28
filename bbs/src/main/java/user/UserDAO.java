package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// DB 접근
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");//접속 드라이버
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// user 로그인 메서드
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에서 SQL실행준비
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}else {
					return -1; //패스워드 불일치
				}
			}else {
				return -2; // 아이디 없음
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -3; // 데이터베이스 오류
	}
	
	// user 회원가입 메서드
	public int join(String userID, String userPassword, String userName, String userGender, String userEmail) {
		String SQL = "insert into user values(?, ?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(SQL); // DB에서 SQL실행준비
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userGender);
			pstmt.setString(5, userEmail);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
