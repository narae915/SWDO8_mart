package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession session;

	// 페이징
	//직원인지 확인
	public String StaffOnlyChk(String chkMessage) {
		String result = null;
		AdminMapper mapper = null;

		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.StaffOnlyChk(chkMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 1.페이징
	public int getTotalRecordsCount(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;

		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getTotalRecordsCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 1.상품 리스트 불러오기 메소드
	public ArrayList<ItemVO> getItemList(HashMap<String, Object> map) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<ItemVO> itemList = mapper.getItemList(map);
		
		return itemList;
	}

	// 2.상품 삭제 메소드
	public int itemDelete(List<Integer> intCancelNum) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemDelete(intCancelNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 3.상품 추가 메소드
	public int itemInsert(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemInsert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/* 직원 ID 등록 */
	public int adminRegister(EmpVO newEmp) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.adminRegister(newEmp);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 로그인 */
	public String selectEmpNm(EmpVO emp) 
	{
		String result = null;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.selectEmpNm(emp);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 로그인 정보 가져오기 */
	public ArrayList<EmpVO> getEmpInfoList(HashMap<String, Object> map) 
	{
		ArrayList<EmpVO> result = null;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getEmpInfoList(map);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 직원 리스트  */
	public ArrayList<EmpVO> getEmpList(HashMap<String, Object> map) 
	{
		ArrayList<EmpVO> result = null;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getEmpList(map);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 총 직원 수 조회  (페이징) */
	public int getEmpTotalRecordsCount(HashMap<String, Object> map) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getEmpTotalRecordsCount(map);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 직원 번호로 해당 직원 정보 조회 */
	public EmpVO readEmp(int empNum) 
	{
		EmpVO emp = null;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			emp = mapper.readEmp(empNum);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return emp;
	}
	
	/* 직원 정보 수정 */
	public int empUpdate(EmpVO updateEmp) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.empUpdate(updateEmp);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 직원 정보 삭제 */
	public int empDelete(int empNum) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.empDelete(empNum);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* ID 찾기 */
	public int selectEmpId(EmpVO emp) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.selectEmpId(emp);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* PW 찾기 전 해당하는 직원 찾기 */
	public int findEmp(EmpVO emp) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.findEmp(emp);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}

	/* PW 리셋 */
	public int updatePw(EmpVO newPw) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.updatePw(newPw);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

}
