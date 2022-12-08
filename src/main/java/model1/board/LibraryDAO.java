package model1.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnectCol;

public class LibraryDAO extends JDBConnectCol {
	
	public LibraryDAO(ServletContext application) {
		super(application);
	}
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0; 
		
		String query = "SELECT COUNT(*) FROM library";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} 
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<LibraryDTO> selectList(Map<String, Object> map){
		
		List<LibraryDTO> bbs = new Vector<LibraryDTO>();
		
		String query = "SELECT * FROM library";
		if(map.get("searchWord") != null) {
			query += " WHERE "+ map.get("searchField") + " LIKE '%"+ map.get("searchWord")+ "%'";
		}
		query += " ORDER BY num DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				LibraryDTO dto = new LibraryDTO();
				
				dto.setCode(rs.getString("code"));
				dto.setTitle(rs.getString("title"));
				dto.setGenre(rs.getString("genre"));
				dto.setAuthor(rs.getString("author"));
				dto.setStatus(rs.getString("status"));
	
				bbs.add(dto);
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO library (code,title,genre,author,status) VALUES (?.?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("게시물 입력중 예외 발생.");
			e.printStackTrace();
		}
		return result;
	}
	

}
