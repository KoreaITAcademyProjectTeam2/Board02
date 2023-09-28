package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thread.service.PostService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private PostService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("list", service.getList());
		return "redirect:/main";
	}
	
}
