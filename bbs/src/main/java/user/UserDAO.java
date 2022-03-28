package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// DB ����
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");//���� ����̹�
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// user �α��� �޼���
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); // DB���� SQL�����غ�
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				}else {
					return -1; //�н����� ����ġ
				}
			}else {
				return -2; // ���̵� ����
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -3; // �����ͺ��̽� ����
	}
	
	// user ȸ������ �޼���
	public int join(String userID, String userPassword, String userName, String userGender, String userEmail) {
		String SQL = "insert into user values(?, ?, ?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(SQL); // DB���� SQL�����غ�
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userGender);
			pstmt.setString(5, userEmail);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}
