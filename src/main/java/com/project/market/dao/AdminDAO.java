package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.EmpVO;
import com.project.market.vo.FileListVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.UserVO;

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
	public int adminRegister(EmpVO newEmp, FileListVO newFile) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.adminRegister(newEmp);
			mapper.empSetFile(newFile.getOriginalFilename(), newFile.getSavedFilename());
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
	public int empUpdate(EmpVO updateEmp, FileListVO updateImg) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.empUpdate(updateEmp);
			mapper.empSetFile(updateImg.getOriginalFilename(), updateImg.getSavedFilename());
			// mapper.empUpdateFile(updateImg.getEmpImg() ,updateImg.getOriginalFilename(), updateImg.getSavedFilename());
			
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
	
	public int empDeleteFile(String empImg) 
	{
		int result = 0;
		AdminMapper mapper = null;
		
		try 
		{
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.empDeleteFile(empImg);
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
	
	// 상품 수정 페이지 기존 정보 가져오기
	public ArrayList<ItemVO> getAdminItemList(String itemChk) {
		ArrayList<ItemVO> result = null;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getAdminItemList(itemChk);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 상품 수정
	public int itemUpdate(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemUpdate(map);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//회원 검색
	public ArrayList<UserVO> searchUser(HashMap<String, Object> map) {
		ArrayList<UserVO> result = null;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.searchUser(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//총 유저수 확인
	public int getUserTotalRecordsCount(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getUserTotalRecordsCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상품 판매글-보관법 작성
	public int itemInventoryWrite(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemInventoryWrite(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상품 판매글-상품정보 작성
	public int itemInforWrite(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemInforWrite(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상품 판매글-손질법 작성
	public int itemCookWrite(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemCookWrite(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 사진 등록 메서드
	public int itemImgSave(FileListVO newFile) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemImgSave(newFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 상품에 첨부된 사진들 불러오기
	public ArrayList<String> getItemFileList(String itemNum) {
		ArrayList<String> result = null;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getItemFileList(itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 사진 삭제
	public int itemImgDelete(String fileName) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemImgDelete(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 상품 사진 가져오기
	public ArrayList<FileListVO> getFileList(ArrayList<Integer> itemNumList) {
		ArrayList<FileListVO> result = null;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getFileList(itemNumList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 상품 사진 파일 추가
	public int itemFileInsert(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemFileInsert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int itemFileUpdate(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemFileUpdate(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//강제 회원 탈퇴
	public int deleteUser(int userNum) {
		int result = 0;
		AdminMapper mapper = null;

		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.deleteUser(userNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//세일 상품임을 알림
	public int saleFlag(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.saleFlag(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//로그인 확인
	public ArrayList<EmpVO> selectAdmin(HashMap<String, Object> map) {
		ArrayList<EmpVO> result = null;
		AdminMapper mapper = null;
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.selectAdmin(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
