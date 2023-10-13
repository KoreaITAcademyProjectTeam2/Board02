package com.thread.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thread.domain.PostDTO;
import com.thread.domain.PostVO;
import com.thread.domain.UserVO;
import com.thread.service.PostService;
import com.thread.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService userservice;

	@Autowired
	private PostService service;

	private boolean isValidInput(String input) {
		return input != null && input.matches("^[가-힣a-zA-Z0-9]*$");
	}

	@GetMapping("/login")
	public void loginPage() {

		log.info("Login Page");
	}

	/* 로그인 */

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		UserVO lvo = userservice.userLogin(user);

		if (lvo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/login";

		}

		session.setAttribute("member", lvo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)

		return "redirect:/main";

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	/*
	 * @PostMapping("/login") public String userJoinSuccess() {
	 * log.info("go LoginPage");
	 * 
	 * return "redirect:./login"; }
	 */

	// 로그인 이후 나오는 첫 페이지. 모든 글과 댓글이 보이도록 한다.
	@GetMapping("/main")
	public String mainView(HttpSession session, Model model) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if(currentUser == null) {
			return "login";
		}
		List<PostVO> postVOs = service.getList(5L, 0L);
		List<PostDTO> postDTOs = new ArrayList<>();
		
		for( PostVO postVO: postVOs) {
			PostDTO postDTO = new PostDTO();
			postDTO.setPost(postVO);
			postDTO.setCommentCount(service.getCommentCount(postVO.getPost_id()));
			postDTOs.add(postDTO);
		}
		
		model.addAttribute("list", postDTOs);
		log.info("Main Page Thread List");
		return "main";
	}

	@PostMapping("/main")
	public String loginSuccess() {
		log.info("go mainPage");

		return "redirect:/main";
	}

	@GetMapping("/userJoin")
	public void userJoinForm() {
		log.info("UserJoin Page");
	}

	@PostMapping("/userJoin")
	public void userJoin() {
		log.info("UserJoin Page");
	}

	@PostMapping("/registerUser")
	public String registerUser(UserVO user, RedirectAttributes rttr) {

		if (user.getUser_email().length() < 6 || user.getUser_email().length() > 12) {
			rttr.addFlashAttribute("error", "아이디는 6자 이상 12자 이하로 설정해주세요.");
			return "redirect:/userJoin";
		}

		if (!isValidInput(user.getUser_email()) || !isValidInput(user.getUser_password())
				|| !isValidInput(user.getUser_name())) {
			rttr.addFlashAttribute("error", "아이디, 비밀번호, 닉네임에 공백 또는 특수문자를 사용할 수 없습니다.");
			return "redirect:/userJoin";
		}

		if (user.getUser_email().isEmpty() || user.getUser_password().isEmpty() || user.getUser_name().isEmpty()) {
			rttr.addFlashAttribute("error", "모든 필드를 입력해주세요.");
			return "redirect:/userJoin";
		}

		userservice.newUser(user);
		rttr.addFlashAttribute("success", "회원가입을 축하드립니다. 로그인해주세요");
		return "redirect:/login";
	}

	@GetMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		int userPostCount = service.countPostsByUser(currentUser.getUser_email());
		model.addAttribute("userPostCount", userPostCount);
		return "myPage";
	}

	@PostMapping("/modify")
	public void modify() {
		log.info("modifyPage");
	}

	@PostMapping("/withdrawal")
	public void withdrawal() {
		log.info("withdrawalPage");
	}

	@ResponseBody
	@PostMapping("/nicknameCheck")
	public ResponseEntity<Integer> nicknameCheck(@RequestParam("user_name") String user_name) {
		Integer cnt = userservice.nicknameCheck(user_name);
		log.info("cnt" + cnt);
		return ResponseEntity.ok(cnt);
	}

	@ResponseBody
	@PostMapping("/emailCheck")
	public ResponseEntity<Integer> emailCheck(@RequestParam("user_email") String user_email) {
		Integer ecnt = userservice.emailCheck(user_email);
		log.info("cnt" + ecnt);
		return ResponseEntity.ok(ecnt);
	}

	@ResponseBody
	@PostMapping("/updateUserName")
	public boolean updateUserName(HttpSession session, @RequestParam("user_name") String user_name) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if (currentUser == null) {
			return false;
		}
		currentUser.setUser_name(user_name);
		return userservice.modifyUserName(currentUser);
	}

	@ResponseBody
	@PostMapping("/checkCurrentPassword")
	public boolean checkCurrentPassword(HttpSession session, @RequestParam("password") String password) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if (currentUser == null) {
			return false;
		}
		UserVO dbUser = userservice.get(currentUser.getUser_email());
		return dbUser.getUser_password().equals(password);
	}

	@ResponseBody
	@PostMapping("/updateUserPassword")
	public boolean updateUserPassword(HttpSession session, @RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if (currentUser == null) {
			return false;
		}
		UserVO dbUser = userservice.get(currentUser.getUser_email());
		if (dbUser.getUser_password().equals(currentPassword)) {
			dbUser.setUser_password(newPassword);
			return userservice.modifyPassword(dbUser);
		}
		return false;
	}

	@ResponseBody
	@PostMapping("/removeUser")
	public boolean removeUser(HttpSession session) {
		UserVO currentUser = (UserVO) session.getAttribute("member");
		if (currentUser == null) {
			return false;
		}
		log.info("User Email: " + currentUser.getUser_email());
		return userservice.remove(currentUser.getUser_email());
	}

}