package com.project.market.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.market.service.AdminService;
import com.project.market.util.PageNavigator;
import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final int COUNT_PER_PAGE = 5; // 한 페이지 당 보여줄 최대 게시글 수
	private static final int PAGE_PER_GROUP = 5; // 한 그룹 당 보여줄 최대 페이지 수

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	// 2022-03-27 노채린
	// 상품 목록 불러오기
	@RequestMapping(value = "/itemManagement", method = RequestMethod.GET)
	public String itemMangement(@RequestParam(defaultValue = "1") int currentPage, HttpSession session, Model model) {
		logger.info("itemList 메소드 실행(GET).");
		
		// 페이징
		int totalRecordsCount = service.getTotalRecordsCount();
		
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		ArrayList<ItemVO> itemList = service.getItemList(navi.getStartRecord(), COUNT_PER_PAGE);
		
		model.addAttribute("itemList", itemList);
		
		
		return "/admin/itemManagement";
	}
	
	/* 관리자용 메인페이지로 이동 */
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain()
	{
		logger.info("adminMain 메소드 실행(GET).");
		
		return "admin/adminMain";
	}
	
	/* 관리자 ID 등록페이지로 이동 */
	@RequestMapping(value = "/adminRegister", method = RequestMethod.GET)
	public String adminRegister()
	{
		logger.info("adminRegister 메소드 실행 (GET).");
		
		return "admin/adminRegister";
	}
	
	/* 관리자 ID 등록 */
	@RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
	public String adminRegister(String empPw, String empName, String position, String empCall)
	{
		logger.info("adminRegister 메소드 실행 (POST).");
		
		logger.info("empPw: {}", empPw);
		logger.info("empName: {}", empName);
		logger.info("position: {}", position);
		logger.info("empCall: {}", empCall);
		
		boolean result = service.adminRegister(empPw, empName, position, empCall);
		String returnUrl = "admin/adminRegister";
		
		if ( result )
		{
			logger.info("관리자 ID 등록 성공.");
			returnUrl = "redirect:empManagement";
		}
		else
		{
			logger.info("관리자 ID 등록 실패.");
			returnUrl = "admin/adminRegister";
		}
		
		return returnUrl;
	}
	
	/* 로그인 페이지로 이동 */
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin()
	{
		logger.info("adminLogin 메소드 실행(GET).");
		
		return "admin/adminLogin";
	}
	
	/* 로그인 */
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(int empNum, String empPw, HttpSession session)
	{
		logger.info("login 메소드 실행(POST).");
		
		// 로그인을 시도하려고 하는 ID, PW를 출력
		logger.info("empNum: {}", empNum);
		logger.info("empPW: {}", empPw);
		
		// ID, PW를 데이터베이스에 전달해서 사원 이름과 직급을 가져옴
		ArrayList<EmpVO> empInfoList = service.getEmpInfoList(empNum, empPw);
		
		String returnUrl = null;
		
		for ( int i = 0; i < empInfoList.size(); i++ )
		{
			logger.info("empInfoList: {}", empInfoList.get(i));
			
			String empName = empInfoList.get(i).getEmpName();
			String position = empInfoList.get(i).getPosition();
			
			logger.info("empName: {}", empName);
			logger.info("position: {}", position);
			
			if ( empName != null )
			{
				logger.info("로그인 성공.");
				session.setAttribute("loginName", empName);
				session.setAttribute("loginId", empNum);
				session.setAttribute("loginPosition", position);
				returnUrl = "redirect:adminMain";
			}
			else
			{
				logger.info("로그인 실패.");
				returnUrl = "admin/adminLogin";
			}
		}
		
		return returnUrl;
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) 
	{
		logger.info("adminLogout 메소드 실행(GET).");
		
		session.removeAttribute("loginName");
		
		return "redirect:adminLogin";
	}
	
	/* 직원 리스트 조회 및 직원 검색 */
	@RequestMapping(value = "/empManagement", method = RequestMethod.GET)
	public String empList(@RequestParam(defaultValue = "1") int currentPage, Model model, String searchType, String searchWord) 
	{
		logger.info("empList 메소드 실행(GET).");
		logger.info("현재 페이지(currentPage): {}", currentPage);
		
		// 입력된 검색종류와 검색어 출력
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		if ( searchWord == null )
		{
			searchWord = "";
		}
		
		// 총 직원 수를 가져옴
		int totalRecordsCount = service.getEmpTotalRecordsCount();
		logger.info("전체 직원 수: {}", totalRecordsCount);
		
		// 페이징 처리를 위한 내비게이터 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 게시글 시작 번호, 불러올 게시글 수를 전달해서 현재 페이지에 해당하는 10개의 게시글만 가져오도록 설정
		ArrayList<EmpVO> empList = new ArrayList<>();
		empList = service.getEmpList(navi.getStartRecord(), COUNT_PER_PAGE, searchType, searchWord);
		logger.info("empList: {}", empList);
		
		if ( empList != null )
		{
			logger.info("직원 조회 성공.");
			model.addAttribute("empList", empList);
		}
		else
		{
			logger.info("직원 조회 실패.");
		}
		
		
		return "admin/empManagement";
	}
	
	/* 직원 정보 수정 페이지 이동 */
	@RequestMapping (value = "/empUpdate", method = RequestMethod.GET)
	public String empUpdate(int empNum, Model model, HttpSession session) 
	{
		logger.info("empUpdate 메소드 실행(GET).");
		logger.info("empNum: {}", empNum);
		
		EmpVO emp = service.readEmp(empNum);
		
		model.addAttribute("emp", emp);
		

		if ( emp != null )
		{
			return "admin/empUpdate";
		}
		else
		{
			return "redirect:empManagement";
		}
		
	}
	
	/* 직원 정보 수정 */
	@RequestMapping (value = "/empUpdate", method = RequestMethod.POST)
	public String empUpdate(int empNum, String empName, String empPw, String empCall, String position, HttpSession session) 
	{
		logger.info("empUpdate 메소드 실행(POST).");
		
		logger.info("empNum: {}", empNum);
		logger.info("empName: {}", empName);
		logger.info("empPw: {}", empPw);
		logger.info("empCall: {}", empCall);
		logger.info("position: {}", position);
		
		boolean result = service.empUpdate(empNum, empName, empPw, empCall, position);
		
		String returnUrl = null;
		
		if ( result )
		{
			logger.info("직원 정보 수정 성공.");
			
			returnUrl = "redirect:empManagement";
		}
		else
		{
			logger.info("직원 정보 수정 실패.");
			
			returnUrl = "redirect:empUpdate?empNum="+empNum;
		}
		
		return returnUrl;
	}
	
	/* 직원 정보 삭제 */
	@RequestMapping(value = "/empDelete", method = RequestMethod.GET)
	public String empDelete(int empNum, HttpSession session) 
	{
		logger.info("empDelete 메소드 실행(GET).");
		
		logger.info("empNum: {}", empNum);
		
		boolean result = service.empDelete(empNum);
		
		if ( result ) 
		{
			logger.info("직원 정보 삭제 성공.");
		} 
		else 
		{
			logger.info("직원 정보 삭제 실패.");
		}
		
		return "redirect:empManagement";
	}
}