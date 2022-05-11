package com.project.market.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler2 implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();

		System.out.println("관리자 핸들러");
		String empNum = authentication.getName();
		System.out.println(empNum);

		session.setAttribute("empNum", empNum);
		//로그인 성공 후 보내주고 싶은 페이지
		response.sendRedirect("/admin/adminMain");
	}

}
