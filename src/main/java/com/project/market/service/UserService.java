package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
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
}
