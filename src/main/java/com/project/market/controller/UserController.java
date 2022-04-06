package com.project.market.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.market.service.UserService;
import com.project.market.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		logger.info("회원가입 페이지(GET)");
		
		return "/user/signUp";
	}
	
	//회원가입 시도
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(HttpServletRequest request, Model model, UserVO user) {
		logger.info("회원가입 페이지(POST)");
		logger.info("user : {}", user);

		String userPw = pwdEncoder.encode(user.getUserPw());
		user.setUserPw(userPw);
		
		boolean result = service.signUpUser(user);
		String returnUrl = null;

		if(result) {
			logger.info("회원가입 성공");
			returnUrl = "user/login";
		} else {
			logger.info("회원가입 실패");
			returnUrl = "user/signUp";
		}
		return returnUrl;
	}
		
	//로그인 페이지 이동
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		logger.info("로그인 페이지(GET)");
		
		return "user/login";
	}
		
		// 22-04-05 노채린
		// 회원정보 수정 페이지
		@RequestMapping(value="/mypage", method = RequestMethod.GET)
		public String mypage() {
			logger.info("회원정보 수정 페이지(GET)");
			
			return "user/mypage";
		}
		
		/*
		// 22-04-05 노채린
		// 회원 탈퇴
		@RequestMapping(value="/userDelete", method = RequestMethod.GET)
		public String userDelete(HttpSession session) {
			logger.info("회원탙퇴 실행(GET)");
			
			String userMail = (String) session.getAttribute("loginMail");
			
			boolean result = service.userDelete(userMail);
			
			if(result) {
				logger.info("회원 탈퇴 성공");
			} else {
				logger.info("회원 탈퇴 실패");
			}
			
			return "redirect:/";
		}
		*/
}
