package com.project.market.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.service.UserService;
import com.project.market.util.FileService;
import com.project.market.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService service;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	public String login(HttpSession session) {
		logger.info("로그인 페이지(GET)");
		session.removeAttribute("findId");
		
		return "user/login";
	}

	// 22-04-05 노채린
	// 회원정보 수정 페이지
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String mypage() {
		logger.info("회원정보 수정 페이지(GET)");
		
		return "user/mypage";
	}
	
	// 22-04-05 노채린
	// 회원 탈퇴
	@ResponseBody 
	@RequestMapping(value="/userDelete", method = RequestMethod.GET)
	public String userDelete(String userMail) {
		logger.info("회원탙퇴 실행(GET)");
		
		boolean result = service.userDelete(userMail);
		
		if(result) {
			logger.info("회원 탈퇴 성공");
			return "success";
		} else {
			logger.info("회원 탈퇴 실패");
			return null;
		}
		
	}
	
	/* ID 찾기 페이지 이동 */
	@RequestMapping (value = "/findId", method = RequestMethod.GET)
	public String findId(HttpSession session) 
	{
		logger.info("findId 메소드 실행(GET).");
		session.removeAttribute("findId");
		
		return "user/findId";
	}
	
	/* ID 찾기 */
	@RequestMapping (value = "/findId", method = RequestMethod.POST)
	public String findId(String userName, String userCall, Model model, HttpSession session) 
	{
		logger.info("findId 메소드 실행(POST).");
		
		// ID찾기를 시도하려고 하는 이름, PW를 출력
		logger.info("userName: {}", userName);
		logger.info("userCall: {}", userCall);
		
		String findId = service.selectId(userName, userCall);
		
		String errorMessage = "입력하신 정보와 일치하는 ID를 찾을 수 없습니다.";
		String returnUrl = null;
		
		if ( findId != null )
		{
			logger.info("ID 찾기 성공.");
			session.setAttribute("findId", findId);
			returnUrl = "redirect:findView";
		}
		else
		{
			logger.info("ID 찾기 실패.");
			model.addAttribute("errorMessageId", errorMessage);
			returnUrl = "user/findId";
		}
		
		return returnUrl;
	}
	
	/* ID 찾기결과 페이지 이동 */
	@RequestMapping (value = "/findView", method = RequestMethod.GET)
	public String findView() 
	{
		logger.info("findView 메소드 실행(GET).");
		
		return "user/findView";
	}
	
	/* PW 찾기 페이지 이동 */
	@RequestMapping (value = "/findPw", method = RequestMethod.GET)
	public String findPw(HttpSession session) 
	{
		logger.info("findPw 메소드 실행(GET).");
		
		session.removeAttribute("findId");
		
		return "user/findPw";
	}
	
	/* PW 찾기 */
	@RequestMapping (value = "/findPw", method = RequestMethod.POST)
	public String findPw(String userMail, Model model) 
	{
		logger.info("findPw 메소드 실행(POST).");
		logger.info("userMail: {}", userMail);
		
		// PW 찾기 전 일치하는 아이디가 있는지 확인
		String findUser = service.findUser(userMail);
		
		String returnUrl = null;
		
		if ( findUser != null )
		{
			logger.info("일치하는 ID가 있습니다.");
			model.addAttribute("findUserMail", userMail);
			returnUrl = "user/resetPw";
		}
		else
		{
			logger.info("일치하는 ID가 없습니다.");
			model.addAttribute("errorMessageId");
			returnUrl = "user/findPw";
		}
		
		return returnUrl;
	}
	
	/* 메일 보내기 */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(String userMail)
	{
		 logger.info("sendMail 메소드 실행(GET).");
	     logger.info("userMail: {}", userMail);
	     
	     /* 인증번호 생성 */
	     Random random = new Random();
	     int pinNum = random.nextInt(888888) + 111111;
	     
	     /* 이메일 보내기 */
	     String setFrom = "kings3517@naver.com";
	     String toMail = null;
	     String title = null;
	     String content = null;
        
	     // PW 찾기 전 일치하는 아이디가 있는지 확인
	     String findUser = service.findUser(userMail);
		 
		String errorMessageId = "입력하신 정보와 일치하는 ID를 찾을 수 없습니다.";
		 
		 if ( findUser != null )
		 {
			 toMail = userMail;
			 title = "봄날 식자재에서 요청하신 인증번호를 알려드립니다.";
			 content = 
	                "<b>아래의 인증번호를 인증번호 입력창에 입력해 주세요.</b>" +
	                "<br><br>" + 
	                "<b>인증번호 : </b>" + "<b style='color: #e7ab3c;'>" + pinNum + "</b>" +
	                "<br><br>" + 
	                "봄날 식자재를 이용해 주셔서 감사합니다." + 
	                "<br>" + 
	                "더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.";
			logger.info("일치하는 ID가 있습니다.");
		 }
		 else
		 {
			 logger.info("일치하는 ID가 없습니다.");
			 
			 return errorMessageId;
		 }
 
		 try 
	     {
	    	 MimeMessage message = mailSender.createMimeMessage();
	    	 MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");
	    	 helper.setFrom(setFrom);
	    	 helper.setTo(toMail);
	    	 helper.setSubject(title);
	    	 helper.setText(content,true);
	    	 mailSender.send(message);
	     }
	     catch(Exception e) 
	     {
	    	 e.printStackTrace();
	     }
        
	     String checkNum = Integer.toString(pinNum);
        
	     return checkNum;
	}
	
	/* PW 초기화 페이지 이동 */
	@RequestMapping (value = "/resetPw", method = RequestMethod.GET)
	public String resetPw() 
	{
		logger.info("resetPw 메소드 실행(GET).");
		
		return "user/resetPw";
	}
	
	/* PW 초기화  */
	@RequestMapping (value = "/resetPw", method = RequestMethod.POST)
	public String resetPw(String userMail, String userPw) 
	{
		logger.info("resetPw 메소드 실행(POST).");
		logger.info("userMail: {}", userMail);
		logger.info("userPw: {}", userPw);
		
		String encodeUserPw = pwdEncoder.encode(userPw);
		
		boolean result = service.updatePw(userMail, encodeUserPw);
		
		String returnUrl = null;
		
		if ( result )
		{
			logger.info("비밀번호 초기화 성공.");
			returnUrl = "user/login";
		}
		else
		{
			logger.info("비밀번호 초기화 실패.");
			returnUrl = "user/resetPw";
		}
		
		return returnUrl;
	}
	
	/* 유저 본인 확인 */
	@ResponseBody
	@RequestMapping(value = "/userConfirm", method = RequestMethod.GET)
	public String userConfirm(String userId, String userPw) 
	{
		logger.info("userConfirm 메소드 실행(GET).");
		logger.info("userId: {}", userId);
		logger.info("userPw: {}", userPw);
		
		String selectUser = service.selectUser(userId);
		
		String resultString = null;
		
		if ( pwdEncoder.matches(userPw, selectUser) )
		{
			logger.info("ID 찾기 성공.");
			resultString = "success";
		}
		else
		{
			logger.info("ID 찾기 실패.");
			resultString = null;
		}
		
		
//		if ( selectUser != null )
//		{
//			logger.info("ID 찾기 성공.");
//			resultString = "success";
//		}
//		else
//		{
//			logger.info("ID 찾기 실패.");
//			resultString = null;
//		}
		
		return resultString;
	}
	
	/* 회원 정보 수정 페이지 이동 */
	@RequestMapping (value = "/userUpdate", method = RequestMethod.GET)
	public String userUpdate(String userMail, Model model) 
	{
		logger.info("userUpdate 메소드 실행(GET).");
		logger.info("userMail: {}", userMail);
		
		UserVO user = service.readUser(userMail);
		model.addAttribute("user", user);
		
		if ( user != null )
		{
			return "user/userUpdate";
		}
		else
		{
			return "redirect:mypage";
		}
	}
	
	/* 회원 정보 수정 */
	@RequestMapping (value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(String userName, String userMail, String userCall, int postcode, String userAddress, Model model) 
	{
		logger.info("userUpdate 메소드 실행(POST).");
		logger.info("userName: {}", userName);
		logger.info("userMail: {}", userMail);
		logger.info("userCall: {}", userCall);
		logger.info("postcode: {}", postcode);
		logger.info("userAddress: {}", userAddress);
		
		boolean result = service.userUpdate(userName, userMail, userCall, postcode, userAddress);
		
		String returnUrl = null;
		
		if ( result )
		{
			logger.info("회원 정보 수정 성공.");
			
			returnUrl = "user/mypage";
		}
		else
		{
			logger.info("회원 정보 수정 실패.");
			
			returnUrl = "redirect:userUpdate?userMail="+userMail;
		}
		
		return returnUrl;
	}
}
