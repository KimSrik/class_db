package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// DB ����
	public BbsDAO() {
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
	
	// ���� ��¥ ���ϱ�
	public String getDate() {
		String SQL = "select date(now());";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return "";
	}
	
	// ������ȣ ���ϱ�
	public int getNext() {
		String SQL = "select bbsID from bbs where bbsAvailable = 1 order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;	// ���� ��ȣ
			}else {
				return 1;	// ���� ��ȣ
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// ���� ��ȣ
	}
	
	// �� ���� �޼���
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "insert into bbs values(?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// �����ͺ��̽� ����
	}
	
	// �Խ���(bbs) ��� �������� �޼ҵ�
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "select * from bbs where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10;";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
				//pstmt.setInt(1, getNext() - ((pageNumber-1)*10));
		
				System.out.println(lastNum((pageNumber-1)*10));
				pstmt.setInt(1, lastNum((pageNumber-1)*10));

			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// ������ ó�� �޼���
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from bbs where bbsID < ? AND bbsAvailable = 1;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - ((pageNumber-1)*10));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// ���� �б�
	public Bbs getBbs(int bbsID) {
		String SQL = "select * from bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ���� ���� �޼���
	public int update(String bbsTitle, String userID, String bbsContent, int bbsID) {
		String SQL = "update bbs set bbsTitle = ?, bbsContent = ? where userID = ? and bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setString(3, userID);
			pstmt.setInt(4, bbsID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// �����ͺ��̽� ����
	}
	
	// ���� ��¥ ���� �޼���
//	public int delete(String userID, int bbsID) {
//		String SQL = "delete from bbs where bbsID = ? and userID = ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bbsID);
//			pstmt.setString(2, userID);
//			return pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return -1;	// �����ͺ��̽� ����
//	}
	
	// ���� �ӽ� ���� �޼���
	public int delete(String userID, int bbsID) {
		String SQL = "update bbs set bbsAvailable = 0 where bbsID = ? AND userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// �����ͺ��̽� ����
	}
	
	
	
	public int getNum() {
		String SQL = "select * from bbs where bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			int recordCount = 0;
			while(rs.next()) {
				recordCount++;
			}return recordCount;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int lastNum(int num) {
		String SQL = "select bbsID from bbs where bbsAvailable = 1 order by bbsID desc limit ?, 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}