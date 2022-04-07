package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.project.market.dao.UserDAO;
import com.project.market.vo.UserVO;


@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	//회원가입
	public boolean signUpUser(UserVO user) {
		return dao.signUpUser(user) > 0;
	}

	//회원 정보 조회
	public UserVO getUser(Authentication authentication) {
		return dao.getUser(authentication.getName());
	}

	/*
	// 회원 탈퇴
	public boolean userDelete(String userMail) {

		return dao.userDelete(userMail) > 0;
	}
	*/
}
