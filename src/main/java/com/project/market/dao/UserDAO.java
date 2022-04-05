package com.project.market.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	
	//회원 가입
	public int signUpUser(UserVO user) {
		int result = 0;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.signUpUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/*
	// 회원 탈퇴
	public int userDelete(String userMail) {
		int result = 0;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.userDelete(userMail);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
*/

}
