package du.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import du.user.domain.UserVO;
import du.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/signUpPage.do")
	public String signUpPage() {
		System.out.println("123");
		return "user/signUp.jsp";
	}
	
	@RequestMapping("/signUp.do")
	public String signUp(UserVO user) {
		userService.insertUser(user);
		return "redirect:/loginPage.do";
	}
	
	@RequestMapping("/userInfo.do")
	public String userInfo() {
		return "user/userInfo.jsp";
	}
	
	@RequestMapping("/userModify.do")
	public String userModify(UserVO user) {
		userService.updateUser(user);
		return "redirect:/mainPage.do";
	}
	
	@RequestMapping("/userDelete.do")
	public String userDelete(String id) {
		userService.deleteUser(id);
		return "login.jsp";
	}
}
