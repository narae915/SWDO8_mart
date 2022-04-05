package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

public interface AdminMapper {


	int getTotalRecordsCount(HashMap<String, Object> map); // 페이징

	String StaffOnlyChk(String chkMessage); //직원인지 확인

	int getEmpTotalRecordsCount(HashMap<String, Object> map); // 총 직원 수 조회 (페이징)

	ArrayList<ItemVO> getItemList(HashMap<String, Object> map); // 1.상품 리스트 불러오기 메소드

	int itemDelete(List<Integer> intCancelNum);// 2.상품 삭제 메소드

	int itemInsert(HashMap<String, Object> map); // 3.상품 추가 메소드

	int adminRegister(EmpVO newEmp); // 직원 ID 등록

	String selectEmpNm(EmpVO emp); // 로그인
	
	ArrayList<EmpVO> getEmpInfoList(HashMap<String, Object> map); // 로그인 정보 가져오기

	ArrayList<EmpVO> getEmpList(HashMap<String, Object> map); // 직원 리스트 조회
	
	ArrayList<EmpVO> searchEmp(HashMap<String, Object> map); // 직원 검색
	
	EmpVO readEmp(int empNum); // 직원 번호로 해당 직원 정보 조회
	
	int empUpdate(EmpVO updateEmp); // 직원 정보 수정
	
	int empDelete(int empNum); // 직원 정보 삭제

	ItemVO readitem(int upItemNum);

	ArrayList<ItemVO> itemUpdateList(List<Integer> intUpdateNum);

	int selectEmpId(EmpVO findEmp); // ID 찾기

}
