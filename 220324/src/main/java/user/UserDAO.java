package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// 데이터베이스 접근개체
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(User user) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 해당 아이디가 존재하는 영역
				if(rs.getString(1).equals(user.getUserPassword())) {
					// 해당 아이디와 패스워드가 일치하는 경우 / 로그인 성공
					return 1;
				}else {
					// 아이디는 맞으나 패스워드가 불일치하는 경우
					return -2;
				}
			}else {
				// 해당 아이디가 존재하지 않는 영역
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류일 시
		return -3;
	}
	
	public int join(User user) {
		String SQL = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getUserBirthday());
			pstmt.setString(6, user.getUserGender());
			pstmt.setString(7, user.getUserEmail());
			pstmt.setString(8, user.getUserPhone());
			
			
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 데이터베이스 오류일 시
		return -3;
	}
}


