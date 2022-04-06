package com.project.market.vo;

import lombok.Data;
 
@Data
public class UserVO {
 
	private int userNum;		// 회원 번호		 	
	private String userName;	// 유저 이름
	private String userMail;	// 유저 메일(ID)
	private String userPw;		// 유저 PW
	private String userCall;	// 유저 연락처
	private int postcode;		// 우편번호
	private String userAddress;	// 유저 주소
	private String role;		// 권한

}