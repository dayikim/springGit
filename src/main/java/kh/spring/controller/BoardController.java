package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	
	@RequestMapping("boardlist")
	public String boardlist(Model model) {
		
		List<BoardDTO> list = dao.listAll();
		
		model.addAttribute("boardAll",list);
		
		return "/board/boardlist";
	}
}
	

