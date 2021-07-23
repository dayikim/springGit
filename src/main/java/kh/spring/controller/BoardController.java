package kh.spring.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("post")
	public String post(int seq,Model model) throws Exception {
		System.out.println(seq);
		BoardDTO dto = dao.view(seq);
		model.addAttribute("post",dto);
		
		return "/board/view";
	}
	
	@RequestMapping("write")
	public String write() {
		return "/board/boardWrite";
	}
	

	@RequestMapping("boardWrite")
	public String boardWrite(HttpSession session, String title, String contents) {
		dao.write(session,title,contents);
		return "redirect:boardList";
	}
	
}
	

