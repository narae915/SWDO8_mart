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

	// 회원 탈퇴
	public boolean userDelete(String userMail) {

		return dao.userDelete(userMail) > 0;
	}
	
	/* ID 찾기 */
	public String selectId(String userName, String userCall) 
	{
		UserVO user = new UserVO();
		user.setUserName(userName);
		user.setUserCall(userCall);
		
		return dao.selectId(user);
	}
	
	/* PW 찾기 전 아이디 확인 */
	public String findUser(String userMail) 
	{
		UserVO user = new UserVO();
		user.setUserMail(userMail);
		
		return dao.findUser(user);
	}

	/* PW 초기화  */
	public boolean updatePw(String userMail, String encodeUserPw) 
	{
		UserVO newPw = new UserVO();
		newPw.setUserMail(userMail);
		newPw.setUserPw(encodeUserPw);
		
		return dao.updatePw(newPw) > 0;
	}

	/* 아이디로 수정할 정보 읽어오기 */
	public UserVO readUser(String userMail) 
	{
		return dao.readUser(userMail);
	}

	/* 회원 정보 수정 */
	public boolean userUpdate(String userName, String userMail, String userCall, int postcode, String userAddress) 
	{
		UserVO updateUser = new UserVO();
		updateUser.setUserName(userName);
		updateUser.setUserMail(userMail);
		updateUser.setUserCall(userCall);
		updateUser.setPostcode(postcode);
		updateUser.setUserAddress(userAddress);
		
		return dao.userUpdate(updateUser) > 0;
	}
	
	/* 유저 본인 확인 */
	public String selectUser(String userId) 
	{
		UserVO user = new UserVO();
		user.setUserMail(userId);
		
		return dao.selectUser(user);
	}
}
