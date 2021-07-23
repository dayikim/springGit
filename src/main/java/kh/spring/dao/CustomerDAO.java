package kh.spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	public int memberOut(String deleteID) {
		String sql="delete from customer where id=?";
		return jdbc.update(sql,deleteID);
	}

	}