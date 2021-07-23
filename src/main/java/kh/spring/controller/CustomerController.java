package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.CustomerDAO;
import kh.spring.dto.CustomerDTO;


public class CustomerController {

	@Controller
	@RequestMapping("/customer")
	public class MemberController {

		@Autowired
		private CustomerDAO dao;
		
		@Autowired
		private HttpSession session;
	
		@RequestMapping("signup")
		public String signup() {
			return "member/signup";
		}
		
		@RequestMapping(value="signupProc",produces="text/html;charset=utf8")
		public String signupProc(CustomerDTO dto) {
			dao.insert(dto);
			return "redirect:/";
		}
		
		@RequestMapping("loginProc")
		public String loginProc(String id, String pw) {
			
			int result = dao.login(id,pw);
			System.out.println(result);
			if(result>0) {
				session.setAttribute("loginID", id);
			}
			return "redirect:/";
		}
		
//		@RequestMapping("logOut")
//		public String logOut(String id) {
//		}
		
		@RequestMapping("memberOut")
		public String memberOut(String id) {
			 
			CustomerDTO dto = (CustomerDTO) session.getAttribute("loginID");
			String DeleteID = dto.getId(); 
			int result = dao.memberOut(DeleteID);
			
//			
//			request.getSession().invalidate();
//			return "redirect:/";
//		}
//			
		}
		
		@ResponseBody
		@RequestMapping(value="duplCheck",produces="text/html;charset=utf8")
		public String duplCheck(String id) {
			int result = dao.idDupleCheck(id);
			return String.valueOf(result); //string.valueof : 숫자를 문자로 바꾼 것!!
		}
		
	}
}
