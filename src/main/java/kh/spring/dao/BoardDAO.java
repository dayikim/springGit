package kh.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public BoardDTO view(int seq) {
		String sql = "select * from board where seq = ?";
		return jdbc.queryForObject(sql, new RowMapper<BoardDTO>() {
			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException{
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContents(rs.getString("contents"));
				dto.setWrite_date(rs.getDate("write_date"));
				return dto;
			}
		}, seq);
	}
	

	public List<BoardDTO> listAll() {
		//게시판 리스트
		String sql = "select * from board";
		
		return jdbc.query(sql , new RowMapper<BoardDTO>() {
			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContents(rs.getString("contents"));
				dto.setWrite_date(rs.getDate("write_date"));
				dto.setView_count(rs.getInt("view_count"));
				return dto;
			}
			
		});
	}

	public int write(HttpSession session,String title,String contents) {
		String sql = "insert into board values(board_seq.nextval,?,?,?,sysdate,0)";
		return jdbc.update(sql,title,session,contents);
	}
	
	public int deleteBoard(int seq) {
		String sql = "delete from board where seq=?";
		return jdbc.update(sql,seq);
	}
	
	public int updateBoard(BoardDTO db) {
		String sql = "update board set title=?, contents =?, write_date = sysdate where seq=?";
		return jdbc.update(sql,db.getTitle(),db.getContents(),db.getSeq());
	}
	
	public BoardDTO getSelect(int seq) {
		String sql = "select * from board where seq=?";
		return jdbc.queryForObject(sql, (rs, rowNum)->new BoardDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getInt(6)),seq);
	}

}
