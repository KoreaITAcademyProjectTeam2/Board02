package com.thread.controller;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

=======
>>>>>>> f2912afb812be2a54089616773531c8fb800dc16
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thread.domain.UserVO;
import com.thread.service.UserService;

import com.thread.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class UserController {
<<<<<<< HEAD
	
	@Autowired
	private UserService userservice;
	
    /* 로그인 */
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception{
        
    	HttpSession session = request.getSession();
    	UserVO lvo = userservice.userLogin(user);
    	
    	if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
            
            int result = 0;
            rttr.addFlashAttribute("result", result);
            return "redirect:/login";
            
        }
        
        session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
        
        return "redirect:/main";

    }
	
    //로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
    @GetMapping("/main")
    public void mainView(){
=======
>>>>>>> f2912afb812be2a54089616773531c8fb800dc16

	@Autowired
	private PostService service;

	// 로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
	@GetMapping("/main")
	public void mainView(Model model) {

		model.addAttribute("list", service.getList());
		log.info("Main Page Thread List");
	}

	@PostMapping("/main")
	public String loginSuccess() {
		log.info("go mainPage");

<<<<<<< HEAD
        log.info("Login Page");
    }
	/*
=======
		return "redirect:/main";
	}

	@GetMapping("/login")
	public void loginPage() {

		log.info("Login Page");
	}

>>>>>>> f2912afb812be2a54089616773531c8fb800dc16
	@PostMapping("/login")
	public String userJoinSuccess() {
		log.info("go LoginPage");

		return "redirect:./login";
	}

	@PostMapping("/userJoin")
	public void userJoinPage() {
		log.info("UserJoin Page");
	}
<<<<<<< HEAD
	
	*/
	
	
=======

	@GetMapping("/myPage")
	public void myPage() {
		log.info("go MyPage");
	}

>>>>>>> f2912afb812be2a54089616773531c8fb800dc16
}
