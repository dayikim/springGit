package kh.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CustomerDTO;

@Repository
public class CustomerDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	public int insert(CustomerDTO dto) {
		String sql="insert into customer values(customer_seq.nextval,?,?,?,?,?,sysdate)";
		return jdbc.update(sql,dto.getId(),dto.getPw(),dto.getName(),dto.getPhone(),dto.getEmail());
	}
	
	
	public int idDupleCheck(String id) {
		String sql="select count(*) from customer where id=?";
		return jdbc.queryForObject(sql, Integer.class,id);
	}
	
	public int login(String id,String pw) {
		String sql= "select count(*) from customer where id=? and pw=?";
		return jdbc.queryForObject(sql, Integer.class,id,pw);
	}
	
	
	public CustomerDTO memberInfo(String SessionID) throws Exception {
		String sql= "select * from customer where id=?";
		return jdbc.queryForObject(sql, new RowMapper<CustomerDTO>() {

			@Override
			public CustomerDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerDTO dto = new CustomerDTO();
				dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getNString("phone"));
			dto.setEmail(rs.getString("Email"));
			dto.setReg_date(rs.getDate("reg_date"));
				return dto;
			}
			
		},SessionID);
	}


	
	public int memberOut(String SessionID) {
		String sql="delete from customer where id=?";
		return jdbc.update(sql,SessionID);
	}

	}