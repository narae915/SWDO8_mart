package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

public interface AdminMapper {

	String StaffOnlyChk(String chkMessage); //직원인지 확인
	
	int getTotalRecordsCount();
	
	int getEmpTotalRecordsCount(); // 총 직원 수 조회 (페이징)

	ArrayList<ItemVO> getItemList(HashMap<String, Object> map);

	int adminRegister(EmpVO newEmp); // 관리자 ID 등록

	ArrayList<EmpVO> getEmpInfoList(HashMap<String, Object> map); // 로그인

	ArrayList<EmpVO> getEmpList(HashMap<String, Object> map); // 직원 리스트 조회 및 직원 검색
	
	EmpVO readEmp(int empNum); // 직원 번호로 해당 직원 정보 조회
	
	int empUpdate(EmpVO updateEmp); // 직원 정보 수정
	
	int empDelete(int empNum); // 직원 정보 삭제

}
