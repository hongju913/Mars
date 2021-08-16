package com.KHJ.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.websocket.Session;

public class memberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	//getConnection() 디비연결
	private Connection getConnection() {
		
		//디비연결정보
		//String DRIVER = "com.mysql.jdbc,Driver";
		//String DBURL = "jdbc:mysql://localhost:3306/universe";
		//String DBID = "root";
		//String DBPW = "1234";
		
	
		try {
			Context initCTX = new InitialContext();
			
			DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
			conn = ds.getConnection();
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}//getConnection() 디비연결 
	
	
	//closeDB() 자원해제
	public void closeDB() {
		
	try {	
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
	}catch (SQLException e) {
			e.printStackTrace();
	}	
		
	}//closeDB() 자원해제
	
	
	//아이디 중복체크 idCheck(id)
	public int idCheck(String id) {
		int result = 0;
		
		try {
			//1 드라이버롣 & 디비연결
			conn = getConnection();
			
			//2 sql구문 & pstmt객체 생성
			String sql = "select * from universe_member where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			//3 실행하기
			rs = pstmt.executeQuery();
			
			//데이터처리하기
			if(rs.next()) {
				result = 1; //회원정보가 있다 -> 해당 아이디사용불가능
			}else {
				result = 0; //회원정보가 없다 -> 해당 아이디사용불가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	//아이디 중복체크 idCheck(id)
	
	
	//회원가입 InsertBoard(mb);
	public void InsertBoard(MemberBean mb) {
		
		try {
			//1 드라이버로드 & 디비연결
			conn = getConnection();
			
			//2 sql구문 & pstmt객체 생성
			String sql =  "insert into universe_member values (?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//? 채우기
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getEmail());
			pstmt.setTimestamp(6, mb.getRegdate());
			
			//sql 실행
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}//회원가입 InsertBoard(mb);
	
	//회원정보수정 getMemberUpdate()
	public MemberBean getMemberUpdate(String id) {
		
		MemberBean mb = null;
		try {
			//디비연결
			conn = getConnection();
			
			//sql 작성 & pstmp객체
			sql = "select * from universe_member where id=?";
			pstmt = conn.prepareStatement(sql);
			System.out.println(id);
			//?
			pstmt.setString(1, id);
			
			//sql 실행
			ResultSet rs = pstmt.executeQuery();
			
			//데이터처리	
			if(rs.next()) {
				mb = new MemberBean();
				System.out.println(rs.getString("name"));
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return mb;
	}//회원정보수정 getMemberUpdate()
	

	//회원정보 비밀번호 확인 updateCheck()
	public int updateCheck(MemberBean mb) {
		
		int update = -1; //에러 생겼을때 리턴
		
		
		try {
			
			conn = getConnection();
			
			String sql = "select pw from universe_member where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//데이터가 입력되었을 경우
				if(mb.getPw().equals(rs.getString("pw"))) {
					
					sql = "update universe_member set name=?, age=?, email=? where id=?";
					pstmt = conn.prepareStatement(sql);
					//?
					pstmt.setString(1, mb.getName());
					pstmt.setInt(2, mb.getAge());
					pstmt.setString(3, mb.getEmail());
					pstmt.setString(4, mb.getId());
					
					update = pstmt.executeUpdate();
					}else { //데이터가 있으나 비밀번호가 틀림
						
						update = 0;
						
					}
				
			}else {//데이터가 없을때
				
				update = -1;
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return update;
	}
	//회원정보 비밀번호 확인 updateCheck()
	
	
	//회원정보 삭제 비밀번호 확인 deleteCheck()
	public int deleteCheck(MemberBean mb) {
		
		int delete = -1; //에러 리턴
		
		try {
			conn = getConnection();
			
			String sql = "select pw from universe_member where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
	
				if(mb.getPw().equals(rs.getString("pw"))) {
					
					sql = "delete from universe_member where id=?";
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, mb.getId());
					
					delete = pstmt.executeUpdate();
					
					
				}else {//데이터가 있으나 비밀번호가 틀림
					
					delete = 0;
					
				}
				
			}else {//데이터 없삼
				
				delete = -1;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return delete;
	}//회원정보 삭제 비밀번호 확인 deleteCheck()
	
	
	
}
