package com.project.market.vo;

import lombok.Data;

@Data
public class EmpVO {
	
	private int empNum;			// 사원 번호
	private String empPw;		// 사원 PW
	private String empName;		// 사원 이름
	private String empCall;		// 사원 연락처
	private String empMail;		// 사원 메일
	private String position;	// 사원 직급
}
