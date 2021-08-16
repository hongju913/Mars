package com.KHJ.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FileDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	//디비연결 메소드 getConnection()
	private Connection getConnection() {
		
//		String DRIVER = "com.mysql.jdbc,Driver";
//		String DBURL = "jdbc:mysql://localhost:3306/universe";
//		String DBID = "root";
//		String DBPW = "12345678";

		try {
		Context initCTX = new InitialContext();
		
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		
		conn = ds.getConnection();
		
		
		}catch (NamingException e) {
				e.printStackTrace();
		}catch (SQLException e) {
				e.printStackTrace();
		}
		
		return conn;
	}//디비연결 메소드 getConnection()
	
	//closeDB() 자원해제
	public void closeDB() {
		
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch(SQLException e) {
				e.printStackTrace();
		}
	}
	//closeDB() 자원해제
	
	
	//게시판 글쓰기 writeBoard();
	public void writeBoard(FileBeanF fb) {
		int num = 0;
		System.out.println(fb);
		try {
			conn = getConnection();
			
			sql = "select max(num) from universe_file";

			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(num)")+1;
			}
		
			sql = "insert into universe_file values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println(fb.getFile());
			pstmt.setInt(1, num);
			pstmt.setString(2, fb.getName());
			pstmt.setString(3, fb.getPass());
			pstmt.setString(4, fb.getSubject());
			pstmt.setString(5, fb.getContent());
			pstmt.setInt(6, fb.getReadcount());
			pstmt.setInt(7, num); 
			pstmt.setInt(8, fb.getRe_lev());
			pstmt.setInt(9, fb.getRe_seq());
			pstmt.setString(10, fb.getIp());
			pstmt.setString(11, fb.getFile());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//게시판 글쓰기 writeBoard();
	
	//게시판에 저장된 글 갯수 getBoardCount()
	public int getBoardCount() {
		int cnt = 0;
		
		try {
			
			conn = getConnection();
			sql = "select count(*) from universe_file";
			
			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return cnt;
	}//게시판에 저장된 글 갯수 getBoardCount()
	
	
	//원하는 만큼 게시판 글 가져오기 getBoardList(startRow,pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) {
		
		ArrayList boardList = new ArrayList();
		
		//게시판에 있는 하나의 글의 정보를 저장하는 객체
		FileBeanF fb = new FileBeanF();
		
		try {
			conn = getConnection();
			sql = "select * from universe_file order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				fb = new FileBeanF();
				
				fb.setContent(rs.getString("content"));
				fb.setDate(rs.getDate("date"));
				fb.setFile(rs.getString("file"));
				fb.setIp(rs.getString("ip"));
				fb.setName(rs.getString("name"));
				fb.setNum(rs.getInt("num"));
				fb.setPass(rs.getString("boardpw"));
				fb.setRe_lev(rs.getInt("re_lev"));
				fb.setRe_ref(rs.getInt("re_ref"));
				fb.setRe_seq(rs.getInt("re_seq"));
				fb.setReadcount(rs.getInt("readcount"));
				fb.setSubject(rs.getString("subject"));
				
				//boardList에 모두 저장
				boardList.add(fb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}//원하는 만큼 게시판 글 가져오기 getBoardList(startRow,pageSize)
	
	
	//조회수 1씩 증가시키기 updateReadCount()
	public void updateReadCount(int num) {
	
		try {
			
			conn = getConnection();
			
			sql = "update universe_file set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			System.out.println("@!#$#$%$%^#$%^@#$@#@");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}//조회수 1씩 증가시키기 updateReadCount()
	
	//num에 해당하는 모든 글정보 가져오기 getBoard();
	public FileBeanF getBoard(int num) {
		FileBeanF fb = null;
		
		try {
			conn = getConnection();
			
			sql = "select * from universe_file where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				fb = new FileBeanF();
				
				fb.setContent(rs.getString("content"));
				fb.setDate(rs.getDate("date"));
				fb.setFile(rs.getString("file"));
				fb.setIp(rs.getString("ip"));
				fb.setName(rs.getString("name"));
				fb.setNum(rs.getInt("num"));
				fb.setPass(rs.getString("boardpw"));
				fb.setRe_lev(rs.getInt("re_lev"));
				fb.setRe_ref(rs.getInt("re_ref"));
				fb.setRe_seq(rs.getInt("re_seq"));
				fb.setReadcount(rs.getInt("readcount"));
				fb.setSubject(rs.getString("subject"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return fb;
	}//num에 해당하는 모든 글정보 가져오기 getBoard();
	
	//게시판 글 업데이트 updateBoard()
	public int updateBoard(FileBeanF fb) {
		//에러 생겼을때 리턴
		int check = -1;
		
		
		try {
			
			conn = getConnection();
			sql = "select boardpw from universe_file where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fb.getNum());
			rs = pstmt.executeQuery();
				System.out.println("ddddddddfasdfawefawsdfasdfasdfasdfasf");

			if(rs.next()) {
				if(fb.getPass().equals(rs.getString("boardpw"))) {
					
					sql = "update universe_file set subject=?, content=?, file=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, fb.getSubject());
					pstmt.setString(2, fb.getContent());
					pstmt.setString(3, fb.getFile());
					pstmt.setInt(4, fb.getNum());
					
					pstmt.executeUpdate();
					
					check = pstmt.executeUpdate();
					
				}else {
					//잘못된 비밀번호
					check = 0;
				}
				
			}else {
				//글이 없을때
				check = -1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}//게시판 글 업데이트 updateBoard()
	
	//게시판 글 삭제하기 deleteBoard()
	public int deleteBoard(FileBeanF fb){
		int check = -1;
		
		try {
			
			conn = getConnection();
			sql = "select boardpw from universe_file where num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fb.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(fb.getPass().equals(rs.getString("boardpw"))) {
					sql = "delete from universe_file where num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, fb.getNum());
					
					check = pstmt.executeUpdate();
				
				}else {
					check = 0;
				}
				
			}else {
				check = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}//게시판 글 삭제하기 deleteBoard()
	
	
	
	
	
	

	
}
