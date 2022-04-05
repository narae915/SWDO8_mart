package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.UserDAO;
import com.project.market.vo.UserVO;


@Service("userService")
public class UserService {

	@Autowired
	private UserDAO dao;

	//회원가입
	public boolean signUpUser(UserVO user) {
		return dao.signUpUser(user) > 0;
	}

	/*
	// 회원 탈퇴
	public boolean userDelete(String userMail) {

		return dao.userDelete(userMail) > 0;
	}
	*/
}
