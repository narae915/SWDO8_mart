package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession session;

	public int getTotalRecordsCount() {
		int result = 0;
		AdminMapper mapper = null;

		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getTotalRecordsCount();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<ItemVO> getItemList(HashMap<String, Object> map) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<ItemVO> itemList = mapper.getItemList(map);
		
		return itemList;
	}
	
	/* 관리자 ID 등록 */
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
	
	/* 직원 리스트 조회 및 직원 검색  */
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
}
