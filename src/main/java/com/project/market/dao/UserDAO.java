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

	//회원 정보 조회
	public UserVO getUser(String userMail) {
		UserVO result = null;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.getUser(userMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

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
	
	/* ID 찾기 */
	public String selectId(UserVO user) 
	{
		String result = null;
		UserMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.selectId(user);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}

	/* PW 찾기 전 아이디 확인 */
	public String findUser(UserVO user) 
	{
		String result = null;
		UserMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.findUser(user);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}

	/* PW 초기화  */
	public int updatePw(UserVO newPw)
	{
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.updatePw(newPw);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	/* 아이디로 수정할 정보 읽어오기 */
	public UserVO readUser(String userMail) 
	{
		UserVO user = null;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			user = mapper.readUser(userMail);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
	}
	
	/* 회원 정보 수정 */
	public int userUpdate(UserVO updateUser) 
	{
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.userUpdate(updateUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 유저 본인 확인 */
	public String selectUser(UserVO user) 
	{
		String result = null;
		UserMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.selectUser(user);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
}
