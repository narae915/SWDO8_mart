package com.project.market.controller;

import java.util.ArrayList;
import java.util.Random;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;

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
	private JavaMailSender mailSender;
	
	@Autowired
	private AdminService service;
	
	// 직원인지 확인
	@ResponseBody
	@RequestMapping(value = "/staffOnlyChk", method = RequestMethod.GET)
	public String staffOnlyChk(String chkMessage) {
		logger.info("staffOnlyChk 메소드(GET)");
		logger.info("사용자가 입력한 텍스트 : {} ", chkMessage);
		
		String staffInfo = service.StaffOnlyChk(chkMessage);
		logger.info("staffInfo:{}", staffInfo);
		
		if (staffInfo != null) {
			staffInfo = "yes";
		} else {
			staffInfo = "no";
		}
		return staffInfo;
	}
	
	// 2022-03-27 노채린
	// 상품 목록 불러오기
	@RequestMapping(value = "/itemManagement", method = RequestMethod.GET)
	public String itemManagement(@RequestParam(defaultValue = "1") int currentPage, String searchWord,
									Integer category, HttpSession session, Model model) {
		logger.info("itemManagement 메소드 실행(GET).");
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		if(category == null) {
			category = 0;
		}
		
		// 페이징
		int totalRecordsCount = service.getTotalRecordsCount(searchWord, category);
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 상품 리스트 불러오기 메소드
		ArrayList<ItemVO> itemList = service.getItemList(navi.getStartRecord(), COUNT_PER_PAGE, searchWord, category);
		model.addAttribute("itemList", itemList);
		
		return "/admin/itemManagement";
	}
	

	// 2022-03-28 노채린
	// 상품 목록 삭제
	@ResponseBody
	@RequestMapping(value = "/itemDelete", method = RequestMethod.GET)
	public String itemDelete(@RequestParam(value="cancelNumArray[]") List<String> cancelNum) {
		logger.info("itemDelete 메소드 실행");
		logger.info("cancelNum:{}", cancelNum);
		
		 // 상품 목록 삭제 메소드
		boolean result = service.itemDelete(cancelNum);
		
		if(result) {
			logger.info("상품 삭제 성공");
			
			return "success";
			
		} else {
			logger.info("상품 삭제 실패");
			
			return null;
		}
		
		
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
	
	/* 직원 ID 등록 */
	@RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
	public String adminRegister(String empName, String empPw, String empCall, String empMail, String position)
	{
		logger.info("adminRegister 메소드 실행 (POST).");
		
		logger.info("empName: {}", empName);
		logger.info("empPw: {}", empPw);
		logger.info("empCall: {}", empCall);
		logger.info("empMail: {}", empMail);
		logger.info("position: {}", position);
		
		boolean result = service.adminRegister(empName, empPw, empCall, empMail, position);
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
	public String adminLogin(int empNum, String empPw, HttpSession session, Model model)
	{
		logger.info("login 메소드 실행(POST).");
		
		// 로그인을 시도하려고 하는 ID, PW를 출력
		logger.info("empNum: {}", empNum);
		logger.info("empPW: {}", empPw);
		
		String loginEmpName = service.selectEmpNm(empNum, empPw);
		
		// ID, PW를 데이터베이스에 전달해서 사원 이름과 직급을 가져옴
		ArrayList<EmpVO> empInfoList = service.getEmpInfoList(empNum, empPw);
		
		String errorMessage = "아이디 또는 비밀번호를 잘못 입력하셨습니다.";
		
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
				session.setAttribute("loginName", empName);
				session.setAttribute("loginId", empNum);
				session.setAttribute("loginPosition", position);
				returnUrl = "redirect:adminMain";
			}
			else
			{
				returnUrl = "admin/adminLogin";
			}
		}
		
		if ( loginEmpName != null )
		{
			logger.info("로그인 성공.");
			returnUrl = "redirect:adminMain";
		}
		else
		{
			logger.info("로그인 실패.");
			model.addAttribute("errorMessage", errorMessage);
			returnUrl = "admin/adminLogin";
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
	
	/* 직원 리스트 조회 */
	@RequestMapping(value = "/empManagement", method = RequestMethod.GET)
	public String empList(@RequestParam(defaultValue = "1") int currentPage, Model model, String searchType, String searchWord) 
	{
		logger.info("empList 메소드 실행(GET).");
		logger.info("현재 페이지(currentPage): {}", currentPage);
		
		// 입력된 검색종류와 검색어 출력
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		if ( searchType == null ) 
		{
			searchType = "";
		}
		if ( searchWord == null ) 
		{
			searchWord = "";
		}
		
		// 총 직원 수를 가져옴
		int totalRecordsCount = service.getEmpTotalRecordsCount(searchType, searchWord);
		logger.info("직원 수: {}", totalRecordsCount);
		
		// 페이징 처리를 위한 내비게이터 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 게시글 시작 번호, 불러올 게시글 수를 전달해서 현재 페이지에 해당하는 5개의 게시글만 가져오도록 설정
		ArrayList<EmpVO> empList = service.getEmpList(navi.getStartRecord(), COUNT_PER_PAGE, searchType, searchWord);
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
	
	/* 직원 검색 */
	@RequestMapping(value = "/searchEmp", method = RequestMethod.GET)
	public String searchEmp(String searchType, String searchWord, Model model) 
	{
		logger.info("searchEmp 메소드 실행(GET).");
		
		// 입력된 검색종류와 검색어 출력
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		ArrayList<EmpVO> empList = service.searchEmp(searchType, searchWord);
		logger.info("empList: {}", empList);
		
		if ( empList != null )
		{
			logger.info("직원 검색 성공.");
			model.addAttribute("empList", empList);
		}
		else
		{
			logger.info("직원 검색 실패.");
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
	public String empUpdate(int empNum, String empName, String empPw, String empCall, String empMail, String position, HttpSession session) 
	{
		logger.info("empUpdate 메소드 실행(POST).");
		
		logger.info("empNum: {}", empNum);
		logger.info("empName: {}", empName);
		logger.info("empPw: {}", empPw);
		logger.info("empCall: {}", empCall);
		logger.info("empMail: {}", empMail);
		logger.info("position: {}", position);
		
		boolean result = service.empUpdate(empNum, empName, empPw, empCall, empMail, position);
		
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
	public String empDelete(int empNum) 
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
	
	/* 메일 보내기 */
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    public String mailCheck(String empMail)
	{
		 logger.info("mailCheck 메소드 실행(GET).");
	     logger.info("empMail: {}", empMail);
	     
	     /* 인증번호 생성 */
	     Random random = new Random();
	     int pinNum = random.nextInt(888888) + 111111;
	     logger.info("pinNum: {}", pinNum);
	     
	     /* 이메일 보내기 */
        String setFrom = "kings3517@naver.com";
        String toMail = empMail;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "봄날 식자재 직원 등록 인증 메일 확인입니다." +
                "<br><br>" + 
                "인증 번호는 " + pinNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입해주시기 바랍니다.";
        
        try 
        {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }
        catch(Exception e) 
        {
            e.printStackTrace();
        }
        
        String checkNum = Integer.toString(pinNum);
        
        return checkNum;
    }

	
	/* ID 찾기 페이지 이동 */
	@RequestMapping (value = "/empFindId", method = RequestMethod.GET)
	public String empFindId() 
	{
		logger.info("empFindId 메소드 실행(GET).");
		
		return "admin/empFindId";
	}
	
	/* ID 찾기 */
	@RequestMapping (value = "/empFindId", method = RequestMethod.POST)
	public String empFindId(String empName, String empMail, Model model) 
	{
		logger.info("empFindId 메소드 실행(POST).");
		
		// ID찾기를 시도하려고 하는 이름, PW를 출력
		logger.info("empName: {}", empName);
		logger.info("empMail: {}", empMail);
		
		int findEmpId = service.selectEmpId(empName, empMail);
		
		String returnUrl = null;
		
		if ( findEmpId != 0 )
		{
			logger.info("ID 찾기 성공.");
			model.addAttribute("findId", findEmpId);
			returnUrl = "redirect:empFindView";
		}
		else
		{
			logger.info("ID 찾기 실패.");
			returnUrl = "empFindId";
		}
		
		return returnUrl;
	}
	
	/* ID/PW 찾기결과 페이지 이동 */
	@RequestMapping (value = "/empFindView", method = RequestMethod.GET)
	public String empFindView() 
	{
		logger.info("empFindView 메소드 실행(GET).");
		
		return "admin/empFindView";
	}
	
}