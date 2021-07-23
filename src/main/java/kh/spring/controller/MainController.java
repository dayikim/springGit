package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Main")
public class MainController {
	
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}
	
}
