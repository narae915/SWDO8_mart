package com.project.market.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.project.market.service.UserService;
import com.project.market.vo.UserVO;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		System.out.println("유저 핸들러");
		//로그인 인증된 name(메일주소)
		String userMail = authentication.getName();
		
		//메일 주소 중 아이디 부분만 자르기
		userMail = userMail.substring(0, userMail.lastIndexOf("@"));

		//JSP에 표현하고 싶은 값 session에 저장
		session.setAttribute("welcomeMessage", userMail);
		session.setAttribute("userMail", authentication.getName());
		
		//로그인 성공 후 보내주고 싶은 페이지
		response.sendRedirect("/");
	}

}

