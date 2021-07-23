package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.CustomerDAO;
import kh.spring.dto.CustomerDTO;

@Controller
@RequestMapping("/customer")
public class CustomerController {

		@Autowired
		private CustomerDAO dao;
		
		@Autowired
		private HttpSession session;
	
		@RequestMapping("signup")
		public String signup() {
			return "customer/signup";
		}
		@ResponseBody
		@RequestMapping(value="duplCheck",produces="text/html;charset=utf8")
		public String duplCheck(String id) {
			int result = dao.idDupleCheck(id);
			return String.valueOf(result); //string.valueof : 숫자를 문자로 바꾼 것!!
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
			return "redirect:/Main/main";
		}
		
		@RequestMapping("logout")
		public String logOut(String id) {
			session.invalidate();
			return "redirect:/";
		}
		
		@RequestMapping("mypage")
		public String mypage() throws Exception {
			String SessionID = (String) session.getAttribute("loginID");
			CustomerDTO dto = (CustomerDTO) dao.memberInfo(SessionID);
			session.setAttribute("myinfo", dto);

			return "customer/mypage";
		}

		@RequestMapping("memberOut")
		public String memberOut() {
			String SessionID = (String) session.getAttribute("loginID");
			int result = dao.memberOut(SessionID);
			session.invalidate();
			return "redirect:/";
	
		}
		@ExceptionHandler
		public String exceptionHandler(Exception e) {
			e.printStackTrace();
			return "error";
		}
		
		
	}

