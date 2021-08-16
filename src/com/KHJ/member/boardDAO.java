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

public class boardDAO {
	
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
	public void writeBoard(BoardBean bb) {
		int num = 0;

		try {
			conn = getConnection();
			
			sql = "select max(num) from universe_board";

			pstmt = conn.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(num)")+1;
			}
		
			sql = "insert into universe_board values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, num); 
			pstmt.setInt(8, bb.getRe_lev());
			pstmt.setInt(9, bb.getRe_seq());
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
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
			sql = "select count(*) from universe_board";
			
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
		BoardBean bb = new BoardBean();
		
		try {
			conn = getConnection();
			sql = "select * from universe_board order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("boardpw"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				//boardList에 모두 저장
				boardList.add(bb);
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
			
			sql = "update universe_board set readcount=readcount+1 where num=?";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}//조회수 1씩 증가시키기 updateReadCount()
	
	//num에 해당하는 모든 글정보 가져오기 getBoard();
	public BoardBean getBoard(int num) {
		BoardBean bb = null;
		
		try {
			conn = getConnection();
			
			sql = "select * from universe_board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("boardpw"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bb;
	}//num에 해당하는 모든 글정보 가져오기 getBoard();
	
	//게시판 글 업데이트 updateBoard()
	public int updateBoard(BoardBean bb) {
		//에러 생겼을때 리턴
		int check = -1;
		
		
		try {
			
			conn = getConnection();
			sql = "select boardpw from universe_board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(bb.getPass().equals(rs.getString("boardpw"))) {
					
					sql = "update universe_board set subject=?, content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setInt(3, bb.getNum());
					
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
	public int deleteBoard(BoardBean bb){
		int check = -1;
		
		try {
			
			conn = getConnection();
			sql = "select boardpw from universe_board where num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(bb.getPass().equals(rs.getString("boardpw"))) {
					sql = "delete from universe_board where num=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setInt(1, bb.getNum());
					
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
