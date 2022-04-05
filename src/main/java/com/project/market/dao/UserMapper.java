package com.project.market.dao;

import com.project.market.vo.UserVO;

public interface UserMapper {

	//회원가입
	int signUpUser(UserVO user);
}
