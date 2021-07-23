package kh.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int write(HttpSession session,String title,String contents) {
		String sql = "insert into board values(board_seq.nextval,?,?,?,sysdate,0)";
		return jdbc.update(sql,title,session,contents);
	}
	

}
