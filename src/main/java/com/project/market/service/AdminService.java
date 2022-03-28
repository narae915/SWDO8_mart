package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.market.dao.AdminDAO;
import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	public int getTotalRecordsCount() {
		return dao.getTotalRecordsCount();
	}

	public ArrayList<ItemVO> getItemList(int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);

		return dao.getItemList(map);
	}
	
	/* 관리자 ID 등록 */
	public boolean adminRegister(String empPw, String empName, String position, String empCall) 
	{
		EmpVO newEmp = new EmpVO();
		newEmp.setEmpPw(empPw);
		newEmp.setEmpName(empName);
		newEmp.setPosition(position);
		newEmp.setEmpCall(empCall);
		
		return dao.adminRegister(newEmp) > 0;
	}

	/* 로그인 */
	public ArrayList<EmpVO> getEmpInfoList(int empNum, String empPw) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNum", empNum);
		map.put("empPw", empPw);
		
		return dao.getEmpInfoList(map);
	}

	/* 직원 리스트 조회 및 직원 검색 */
	public ArrayList<EmpVO> getEmpList(int startRecord, int countPerPage, String searchType, String searchWord) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);
		map.put("searchType", searchType);
		
		return dao.getEmpList(map);
	}
	
	/* 총 직원 수 조회  (페이징) */
	public int getEmpTotalRecordsCount() 
	{
		return dao.getEmpTotalRecordsCount();
	}

	/* 직원 번호로 해당 직원 정보 조회 */
	public EmpVO readEmp(int empNum) 
	{
		return dao.readEmp(empNum);
	}
	
	/* 직원 정보 수정 */
	public boolean empUpdate(int empNum, String empName, String empPw, String empCall, String position) 
	{
		EmpVO updateEmp = new EmpVO();
		updateEmp.setEmpNum(empNum);
		updateEmp.setEmpName(empName);
		updateEmp.setEmpPw(empPw);
		updateEmp.setEmpCall(empCall);
		updateEmp.setPosition(position);
		
		return dao.empUpdate(updateEmp) > 0;
	}
	
	/* 직원 정보 삭제 */
	public boolean empDelete(int empNum) 
	{
		return dao.empDelete(empNum) > 0;
	}
}
