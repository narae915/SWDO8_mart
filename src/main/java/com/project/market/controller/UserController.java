package com.project.market.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	//회원가입 페이지 이동
		@RequestMapping(value = "/signUp", method = RequestMethod.GET)
		public String signUp() {
			logger.info("회원가입 페이지(GET)");
			
			return "/user/signUp";
		}
		
		//회원가입 시도
		@RequestMapping(value = "/signUp", method = RequestMethod.POST)
		public String signUp(UserVO user) {
			logger.info("회원가입 페이지(POST)");
			logger.info("user : {}", user);

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
		
		//로그아웃
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			
			//로그인 시도했을 때 session에 저장했던 회원정보 삭제
			session.removeAttribute("loginMail");
			return "home";
		}
		
}
