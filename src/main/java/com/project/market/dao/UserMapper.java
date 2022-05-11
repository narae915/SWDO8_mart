package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.UserVO;

public interface UserMapper {

	//회원가입
	int signUpUser(UserVO user);

	//회원 정보 조회
	UserVO getUser(String userMail);

	// 회원 탈퇴
	 int userDelete(String userMail);
	
	// ID 찾기
	String selectId(UserVO user);

	// PW 찾기 전 일치하는 아이디가 있는지 확인
	String findUser(UserVO user);

	// PW 초기화
	int updatePw(UserVO newPw);
	
	// 아이디로 수정할 정보 읽어오기
	UserVO readUser(String userMail);

	// 회원 정보 수정
	int userUpdate(UserVO updateUser);
	
	// 유저 본인 확인
	String selectUser(UserVO user);

	//사용가능한 메일인지 확인
	String mailChk(String userMail);
}
