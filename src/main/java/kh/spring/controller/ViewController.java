package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Controller
@RequestMapping("/board")
public class ViewController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("post")
	public String post(int seq,Model model) throws Exception {
		BoardDTO dto = dao.view(seq);
		model.addAttribute("post",dto);
		
		return "/board/view";
	}
	

}
