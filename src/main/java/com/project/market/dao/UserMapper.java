package com.project.market.dao;

import com.project.market.vo.UserVO;

public interface UserMapper {

	//회원가입
	int signUpUser(UserVO user);

	//회원 정보 조회
	UserVO getUser(String userMail);

	// 회원 탈퇴
	// int userDelete(String userMail);
}
