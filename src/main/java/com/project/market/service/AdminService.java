package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.market.dao.AdminDAO;
import com.project.market.vo.EmpVO;
import com.project.market.vo.FileListVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.UserVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	//직원인지 확인
	public String StaffOnlyChk(String chkMessage) {
		return dao.StaffOnlyChk(chkMessage);
	}

	// 1.페이징
	public int getTotalRecordsCount(String searchWord, int category) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchWord", searchWord);
		map.put("category", category);
		
		return dao.getTotalRecordsCount(map);
	}

	// 1. 상품 리스트 불러오기 메소드
	public ArrayList<ItemVO> getItemList(int startRecord, int countPerPage, String searchWord, int category) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);
		map.put("category", category);

		return dao.getItemList(map);
	}

	// 2.상품 삭제 메소드
	public boolean itemDelete(List<String> cancelNum) {
		List<Integer> intCancelNum = cancelNum.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		return dao.itemDelete(intCancelNum) >0;
	}

	// 3.상품 추가 메소드
	public boolean itemInsert(int category, String itemName, String price, String itemAmount, String introduce) {
		int intPrice = Integer.parseInt(price);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("itemName", itemName);
		map.put("intPrice", intPrice);
		map.put("itemAmount", itemAmount);
		map.put("introduce", introduce);
		
		return dao.itemInsert(map) > 0;
	}

	/* 직원 ID 등록 */
	public boolean adminRegister(String empName, String empPw, String empCall, String empMail, String position, String originalFilename, String savedFilename) 
	{
		EmpVO newEmp = new EmpVO();
		newEmp.setEmpName(empName);
		newEmp.setEmpPw(empPw);
		newEmp.setEmpCall(empCall);
		newEmp.setEmpMail(empMail);
		newEmp.setPosition(position);
		
		FileListVO newFile = new FileListVO();
		newFile.setOriginalFilename(originalFilename);
		newFile.setSavedFilename(savedFilename);
		
		return dao.adminRegister(newEmp, newFile) > 0;
	}
	
	/* 로그인 */
	public String selectEmpNm(int empNum, String empPw) 
	{
		EmpVO emp = new EmpVO();
		emp.setEmpNum(empNum);
		emp.setEmpPw(empPw);
		
		return dao.selectEmpNm(emp);
	}
	
	/* 로그인 정보 가져오기 */
	public ArrayList<EmpVO> getEmpInfoList(int empNum, String empPw) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNum", empNum);
		map.put("empPw", empPw);
		
		return dao.getEmpInfoList(map);
	}

	/* 직원 리스트 조회 */
	public ArrayList<EmpVO> getEmpList(int startRecord, int countPerPage, String searchType, String searchWord, String loginPosition) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("loginPosition", loginPosition);
		
		return dao.getEmpList(map);
	}
	
	/* 총 직원 수 조회  (페이징) */
	public int getEmpTotalRecordsCount(String searchType, String searchWord) 
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		return dao.getEmpTotalRecordsCount(map);
	}

	/* 직원 번호로 해당 직원 정보 조회 */
	public EmpVO readEmp(int empNum) 
	{
		return dao.readEmp(empNum);
	}
	
	/* 직원 정보 수정 */
	public boolean empUpdate(int empNum, String empName, String empPw, String empCall, String empMail, String position, String originalFilename, String savedFilename) 
	{
		EmpVO updateEmp = new EmpVO();
		updateEmp.setEmpNum(empNum);
		updateEmp.setEmpName(empName);
		updateEmp.setEmpPw(empPw);
		updateEmp.setEmpCall(empCall);
		updateEmp.setEmpMail(empMail);
		updateEmp.setPosition(position);
		
		FileListVO updateImg = new FileListVO();
		updateImg.setOriginalFilename(originalFilename);
		updateImg.setSavedFilename(savedFilename);
		
		return dao.empUpdate(updateEmp, updateImg) > 0;
	}
	
	/* 직원 정보 삭제 */
	public boolean empDelete(int empNum) 
	{
		return dao.empDelete(empNum) > 0;
	}
	
	public boolean empDeleteFile(String empImg) 
	{
		return dao.empDeleteFile(empImg) > 0;
	}
	
	/* ID 찾기 */
	public int selectEmpId(String empName, String empMail) 
	{
		EmpVO emp = new EmpVO();
		emp.setEmpName(empName);
		emp.setEmpMail(empMail);
		
		return dao.selectEmpId(emp);
	}
	
	/* PW 리셋 전 해당하는 직원 찾기 */
	public int findEmp(int empNum, String empMail) 
	{
		EmpVO emp = new EmpVO();
		emp.setEmpNum(empNum);
		emp.setEmpMail(empMail);
		
		return dao.findEmp(emp);
	}

	/* PW 리셋 */
	public boolean updatePw(String empMail, String randomPw) 
	{
		EmpVO newPw = new EmpVO();
		newPw.setEmpMail(empMail);
		newPw.setEmpPw(randomPw);
		
		return dao.updatePw(newPw) > 0;
	}

	// 상품 수정 페이지 기존 상품 정보 불러오기
	public ArrayList<ItemVO> getAdminItemList(String itemChk) {
		
		return dao.getAdminItemList(itemChk);
	}

	// 상품 수정
	public boolean itemUpdate(String itemNum, String itemName, String price, String itemAmount, int category, String introduce) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("itemNum", itemNum);
		map.put("itemName", itemName);
		map.put("price", price);
		map.put("itemAmount", itemAmount);
		map.put("category", category);
		map.put("introduce", introduce);
		
		return dao.itemUpdate(map) > 0;
	}

	//회원 검색
	public ArrayList<UserVO> searchUser(int startRecord, int countPerPage, String searchType, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		return dao.searchUser(map);
	}

	//총 유저수 확인
	public int getUserTotalRecordsCount(String searchType, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		return dao.getUserTotalRecordsCount(map);
	}

	// 상품 판매글-보관법 작성
	public boolean itemInventoryWrite(String itemNum, String editordata) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("editordata", editordata);
		
		return dao.itemInventoryWrite(map) > 0;
	}

	// 상품 판매글-상품정보 작성
	public boolean itemInforWrite(String itemNum, String editordata) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("editordata", editordata);
		
		return dao.itemInforWrite(map) > 0;
	}

	// 상품 판매글-손질법 작성
	public boolean itemCookWrite(String itemNum, String editordata) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("editordata", editordata);
		
		return dao.itemCookWrite(map) > 0;
	}

	// 상품 판매글-사진 등록 메서드
	public boolean itemImgSave(String originalFilename, String savedFilename, String itemNum) {

		int intItemNum = Integer.parseInt(itemNum);
		
		FileListVO newFile = new FileListVO();
		newFile.setOriginalFilename(originalFilename);
		newFile.setSavedFilename(savedFilename);
		newFile.setItemNum(intItemNum);
		
		return dao.itemImgSave(newFile) > 0;
	}

	// 상품에 첨부된 사진들 불러오기
	public ArrayList<String> getItemFileList(String itemNum) {
		
		return dao.getItemFileList(itemNum);
	}

	// 사진 삭제
	public boolean itemImgDelete(String fileName) {

		return dao.itemImgDelete(fileName) > 0;
	}
	
	// 상품 사진 가져오기
	public ArrayList<FileListVO> getFileList(ArrayList<Integer> itemNumList) {

		return dao.getFileList(itemNumList);
	}

	// 상품 사진파일 추가
	public boolean itemFileInsert(String originalFilename, String savedFilename) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("originalFilename", originalFilename);
		map.put("savedFilename", savedFilename);
		
		return dao.itemFileInsert(map) > 0;
	}

	public boolean itemFileUpdate(String originalFilename, String savedFilename, String basicFile) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("originalFilename", originalFilename);
		map.put("savedFilename", savedFilename);
		map.put("basicFile", basicFile);
		
		return dao.itemFileUpdate(map) > 0;
	}

	//강제 회원 탈퇴
	public boolean deleteUser(int userNum) {
		return dao.deleteUser(userNum) > 0;
	}

	//세일 상품임을 알림
	public boolean saleFlag(String saleName, int salePercent) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("saleName", saleName);
		map.put("salePercent", salePercent);

		return dao.saleFlag(map) > 0;
	}

	//로그인 확인
	public ArrayList<EmpVO> selectAdmin(String empNum, String empPw) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("empNum", empNum);
		map.put("empPw", empPw);
		
		return dao.selectAdmin(map);
	}
}
