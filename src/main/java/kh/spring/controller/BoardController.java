package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping("boardlist")
	public String boardlist() {
		
		
		
		return "/board/boardlist";
	}
	

}
