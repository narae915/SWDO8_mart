package com.project.market.controller;

import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;
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
import org.springframework.web.multipart.MultipartFile;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.project.market.service.AdminService;
import com.project.market.service.UserService;
import com.project.market.util.FileService;
import com.project.market.util.PageNavigator;
import com.project.market.vo.EmpVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.UserVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final int COUNT_PER_PAGE = 5; // 한 페이지 당 보여줄 최대 게시글 수
	private static final int PAGE_PER_GROUP = 5; // 한 그룹 당 보여줄 최대 페이지 수
	private static final String UPLOAD_PATH = "C:\\Upload Files\\springday\\";

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
		model.addAttribute("searchWord", searchWord);
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
		logger.info("itemDelete 메소드 실행(GET)");
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
	public String adminMain(HttpSession session)
	{
		logger.info("adminMain 메소드 실행(GET).");
		
		session.removeAttribute("successResetPw");
		session.removeAttribute("findId");
		
		return "admin/adminMain";
	}
	
	/* 직원 ID 등록페이지로 이동 */
	@RequestMapping(value = "/adminRegister", method = RequestMethod.GET)
	public String adminRegister()
	{
		logger.info("adminRegister 메소드 실행 (GET).");
		
		return "admin/adminRegister";
	}
	
	/* 직원 ID 등록 */
	@RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
	public String adminRegister(String empName, String empPw, String empCall, String empMail, String position, @RequestParam("uploadFile") MultipartFile mfile)
	{
		logger.info("adminRegister 메소드 실행 (POST).");
		
		logger.info("empName: {}", empName);
		logger.info("empPw: {}", empPw);
		logger.info("empCall: {}", empCall);
		logger.info("empMail: {}", empMail);
		logger.info("position: {}", position);
		logger.info("mfile: {}", mfile);
		
		String originalFilename = null;
		if ( mfile != null )
		{
			originalFilename = mfile.getOriginalFilename();
			logger.info("originalFilename: {}", originalFilename);
		}
		
		String savedFilename = FileService.empSaveFile(mfile, UPLOAD_PATH, empName, empCall);
		if ( savedFilename != null )
		{
			logger.info("저장 파일명: {}", savedFilename);
		}
		else
		{
			logger.info("직원 사진 저장 실패.");
		}
		
		boolean result = service.adminRegister(empName, empPw, empCall, empMail, position, originalFilename, savedFilename);
		String returnUrl = "admin/adminRegister";
		
		if ( result )
		{
			logger.info("직원 ID 등록 성공.");
			returnUrl = "redirect:empManagement";
		}
		else
		{
			logger.info("직원 ID 등록 실패.");
			returnUrl = "admin/adminRegister";
		}
		
		return returnUrl;
	}
	
	/* 로그인 페이지로 이동 */
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String adminLogin(HttpSession session)
	{
		logger.info("adminLogin 메소드 실행(GET).");
		
		session.removeAttribute("successResetPw");
		session.removeAttribute("findId");
		
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
	public String empList(@RequestParam(defaultValue = "1") int currentPage, Model model, String searchType, String searchWord, HttpSession session) 
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
		
		String loginPosition = (String)session.getAttribute("loginPosition");
		
		// 총 직원 수를 가져옴
		int totalRecordsCount = service.getEmpTotalRecordsCount(searchType, searchWord);
		logger.info("직원 수: {}", totalRecordsCount);
		
		// 페이징 처리를 위한 내비게이터 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		
		// 게시글 시작 번호, 불러올 게시글 수를 전달해서 현재 페이지에 해당하는 5개의 게시글만 가져오도록 설정
		ArrayList<EmpVO> empList = service.getEmpList(navi.getStartRecord(), COUNT_PER_PAGE, searchType, searchWord, loginPosition);
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
	public String empUpdate(int empNum, Model model) 
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
	public String empUpdate(int empNum, String empName, String empPw, String empCall, String empMail, String position, HttpSession session, @RequestParam("uploadFile") MultipartFile mfile) 
	{
		logger.info("empUpdate 메소드 실행(POST).");
		
		logger.info("empNum: {}", empNum);
		logger.info("empName: {}", empName);
		logger.info("empPw: {}", empPw);
		logger.info("empCall: {}", empCall);
		logger.info("empMail: {}", empMail);
		logger.info("position: {}", position);
		
		String originalFilename = null;
		if ( mfile != null )
		{
			originalFilename = mfile.getOriginalFilename();
			logger.info("originalFilename: {}", originalFilename);
		}
		
		String savedFilename = FileService.empSaveFile(mfile, UPLOAD_PATH, empName, empCall);
		if ( savedFilename != null )
		{
			logger.info("저장 파일명: {}", savedFilename);
		}
		else
		{
			logger.info("직원 사진 저장 실패.");
		}
		
		boolean result = service.empUpdate(empNum, empName, empPw, empCall, empMail, position, originalFilename, savedFilename);
		
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
	
	/* 직원 사진 정보 삭제 */
	@ResponseBody
	@RequestMapping(value = "/empImgDelete", method = RequestMethod.GET)
	public String empImgDelete(String empImg) 
	{
		logger.info("empDelete 메소드 실행(GET).");
		
		logger.info("empImg: {}", empImg);
		
		String fullpath = UPLOAD_PATH + "\\" + empImg;
		
		boolean deleteFile = FileService.deleteFile(fullpath);
		
		String resultString = null;
		
		if ( deleteFile )
		{
			logger.info("직원 사진 삭제 성공.");
			
			boolean result = service.empDeleteFile(empImg);
			
			if ( result ) 
			{
				logger.info("직원 사진 정보 삭제 성공.");
				resultString = "success";
			} 
			else 
			{
				logger.info("직원 사진 정보 삭제 실패.");
				resultString = null;
			}
		}
		else
		{
			logger.info("직원 사진 삭제 실패.");
			resultString = null;
		}
		
		return resultString;
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
	     
	     /* 이메일 보내기 */
	     String setFrom = "kings3517@naver.com";
	     String toMail = empMail;
	     String title = "봄날 식자재에서 요청하신 인증번호를 알려드립니다.";
	     String content = 
                "<b>아래의 인증번호를 인증번호 입력창에 입력해 주세요.</b>" +
                "<br><br>" + 
                "<b>인증번호 : </b>" + "<b style='color: #e7ab3c;'>" + pinNum + "</b>" +
                "<br><br>" + 
                "봄날 식자재를 이용해 주셔서 감사합니다." + 
                "<br>" + 
                "더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.";
        
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
	public String empFindId(HttpSession session) 
	{
		logger.info("empFindId 메소드 실행(GET).");
		
		session.removeAttribute("successResetPw");
		session.removeAttribute("findId");
		
		return "admin/empFindId";
	}
	
	/* ID 찾기 */
	@RequestMapping (value = "/empFindId", method = RequestMethod.POST)
	public String empFindId(String empName, String empMail, Model model, HttpSession session) 
	{
		logger.info("empFindId 메소드 실행(POST).");
		
		// ID찾기를 시도하려고 하는 이름, PW를 출력
		logger.info("empName: {}", empName);
		logger.info("empMail: {}", empMail);
		
		int findEmpId = service.selectEmpId(empName, empMail);
		
		String errorMessage = "입력하신 정보와 일치하는 ID를 찾을 수 없습니다.";
		String returnUrl = null;
		
		if ( findEmpId != 0 )
		{
			logger.info("ID 찾기 성공.");
			session.setAttribute("findId", findEmpId);
			returnUrl = "admin/empFindView";
		}
		else
		{
			logger.info("ID 찾기 실패.");
			model.addAttribute("errorMessageId", errorMessage);
			returnUrl = "admin/empFindId";
		}
		
		return returnUrl;
	}
	
	/* PW 찾기 페이지 이동 */
	@RequestMapping (value = "/empFindPw", method = RequestMethod.GET)
	public String empFindPw(HttpSession session) 
	{
		logger.info("empFindPw 메소드 실행(GET).");
		
		session.removeAttribute("successResetPw");
		session.removeAttribute("findId");
		
		return "admin/empFindPw";
	}
	
	/* PW 찾기 */
	@RequestMapping (value = "/empFindPw", method = RequestMethod.POST)
	public String empFindPw(int empNum, String empMail, Model model, HttpSession session) 
	{
		logger.info("empFindPw 메소드 실행(POST).");
		
		// ID찾기를 시도하려고 하는 이름, PW를 출력
		logger.info("empNum: {}", empNum);
		logger.info("empMail: {}", empMail);
		
		// 일치하는 직원 찾기
		int findEmp = service.findEmp(empNum, empMail);
		String errorMessage = "입력하신 정보와 일치하는 ID를 찾을 수 없습니다.";
		
		String successResetPw = "임시 비밀번호가 이메일로 발송되었습니다.<br><br>" + "<b style='color: #e7ab3c;'>로그인 후 반드시 비밀번호를 변경해주세요.</b>";
		
		String returnUrl = null;
		
		if ( findEmp != 0 )
		{
			logger.info("findPW 페이지 ID 찾기 성공.");
			session.setAttribute("successResetPw", successResetPw);
			returnUrl = "admin/empFindPwView";
		}
		else
		{
			logger.info("findPW 페이지 ID 찾기 실패.");
			model.addAttribute("errorMessageId", errorMessage);
			returnUrl = "admin/empFindPw";
		}
		
		return returnUrl;
	}
	
	/* 임시 비밀번호 생성 및 메일 전송 */
	@ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(String empMail, Model model)
	{
		logger.info("sendMail 메소드 실행(GET).");
		logger.info("empMail: {}", empMail);
		
		/* 임시 비밀번호 생성 */
		Random random = new Random();
		String uuid = UUID.randomUUID().toString(); // String 값으로 형변환
		uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거
		uuid = uuid.substring(0, 7); // 7자리수로 만듬
		
		char spChar[] = new char[] {'!','@','#','$','%','^','&','*'}; // 특수문자를 포함하기 위한 배열
		int randomLength = random.nextInt(spChar.length) + 1; // 특수문자 배열의 길이 이하의 랜덤한 수를 생성
		
		String randomPw = null;
		
		for ( int i = 0; i < randomLength; i++ )
		{
			char randomChar = spChar[i];
			randomPw = uuid.concat(String.valueOf(randomChar)); // 생성한 uuid와 특수문자를 이어줌
		}
		
		boolean result = service.updatePw(empMail, randomPw);
		
		/* 이메일 보내기 */
		String setFrom = "kings3517@naver.com";
		String toMail = empMail;
		String title = "봄날 식자재에서 요청하신 임시 비밀번호를 알려드립니다.";
		String content = 
				"<b>로그인 후 반드시 비밀번호를 변경해주세요.</b>" +
				"<br><br>" + 
				"<b>임시 비밀번호 : </b>" + "<b style='color: #e7ab3c;'>" + randomPw + "</b>" +
				"<br><br>" + 
				"봄날 식자재를 이용해 주셔서 감사합니다." + 
				"<br>" + 
				"더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.";
		
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
		
		if ( result )
		{
			logger.info("직원 PW정보 수정 성공.");
		}
		else
		{
			logger.info("직원 PW정보 수정 실패.");
		}
		
		return randomPw;
	}
	
	/* ID 찾기결과 페이지 이동 */
	@RequestMapping (value = "/empFindView", method = RequestMethod.GET)
	public String empFindView() 
	{
		logger.info("empFindView 메소드 실행(GET).");
		
		return "admin/empFindView";
	}
	
	/* PW 찾기결과 페이지 이동 */
	@RequestMapping (value = "/empFindPwView", method = RequestMethod.GET)
	public String empFindPwView() 
	{
		logger.info("empFindPwView 메소드 실행(GET).");
		
		return "admin/empFindPwView";
	}
	
	// 상품 등록 페이지 이동
	@RequestMapping(value = "/itemRegister", method = RequestMethod.GET)
	public String itemRegister(Model model, String itemChk) {
		logger.info("itemRegister 메소드 실행(GET)");

		return "admin/itemRegister";
	}
	
	// 상품 신규 등록
	@RequestMapping(value = "/itemRegister", method = RequestMethod.POST)
	public String itemRegister(int category, String itemName, String price, String itemAmount) {
		logger.info("itemRegister 메소드 실행(POST)");

		boolean result = service.itemInsert(category, itemName, price, itemAmount);
		
		if(result) {
			logger.info("상품 신규 등록 성공");
		} else {
			logger.info("상품 신규 등록 실패");
		}
		
		return "redirect:/admin/itemManagement";
		
	}
	
	// 상품 수정 페이지 이동
	@RequestMapping(value = "/itemUpdate", method = RequestMethod.GET)
	public String itemUpdate(String itemChk, Model model) {
		logger.info("itemUpdate 메소드 실행(GET)");
		
		// 체크박스 itemNum
		logger.info("itemChk:{}", itemChk);
		model.addAttribute("itemChk", itemChk);
		
		ArrayList<ItemVO> itemList = service.getAdminItemList(itemChk);
		logger.info("itemList:{}",itemList);
		model.addAttribute("itemList",itemList);
		
		return "admin/itemUpdate";
	}

	// 상품 수정
	@RequestMapping(value = "/itemUpdate", method = RequestMethod.POST)
	public String itemUpdate(String itemNum, String itemName, String price, String itemAmount, int category) {
		logger.info("itemUpdate 메소드 실행(POST)");
		
		// 체크박스 itemNum
		logger.info("itemNum:{}", itemNum);
		
		boolean result = service.itemUpdate(itemNum, itemName, price, itemAmount, category);
		
		if(result) {
			logger.info("수정 성공");
		} else {
			logger.info("수정 실패");
		}
		return "redirect:/admin/itemManagement";
	}
	
	/* 메신저 페이지 이동 */
	@RequestMapping (value = "/empChattingPop", method = RequestMethod.GET)
	public String empChattingPop() 
	{
		logger.info("empChattingPop 메소드 실행(GET).");
		
		return "admin/empChattingPop";
	}
	
	// 상품 판매글 등록 페이지
	@RequestMapping (value = "/itemSale", method = RequestMethod.GET)
	public String itemSale(String itemNum, Model model) {
		logger.info("itemSale 메소드 실행(GET).");
		
		ArrayList<ItemVO> itemList = service.getAdminItemList(itemNum);
		model.addAttribute("itemList", itemList);
		logger.info("itemList:{}",itemList);

		return "admin/itemSale";
	}
	
	//회원 관리 페이지 이동
	@RequestMapping (value = "/userManagement", method = RequestMethod.GET)
	public String userManagement(@RequestParam(defaultValue = "1") int currentPage, Model model) {
		logger.info("userManagement 메소드 실행(GET).");
		
		String userAddress = null;
		
		// 총 회원 수를 가져옴
		int totalRecordsCount = service.getUserTotalRecordsCount(null, null);
		logger.info("회원 수: {}", totalRecordsCount);

		// 페이징 처리를 위한 내비게이터 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		model.addAttribute("searchType", null);
		model.addAttribute("searchWord", null);
		
		//모든 회원 정보를 조회
		ArrayList<UserVO> userList = service.searchUser(navi.getStartRecord(), COUNT_PER_PAGE, null, null);
		
		// 주소를 등록하지 않은 회원은 등록되지 않았다고 표시
		for(int i = 0; i < userList.size(); i++) {
			userAddress = userList.get(i).getUserAddress();
			if(userAddress.equals("_ ")) {
				userList.get(i).setUserAddress("등록된 주소 없음");
			}
		}
		
		logger.info("userList : {}", userList);
		model.addAttribute("userList", userList);
		
		return "admin/userManagement";
	}
	
	//회원 검색
	@RequestMapping(value = "/searchUser", method = RequestMethod.GET)
	public String searchUser(@RequestParam(defaultValue = "1") int currentPage, String searchType, String searchWord, Model model) {
		logger.info("searchUser 유저 검색 메소드 (GET)");
		logger.info("searchType: {}", searchType);
		logger.info("searchWord: {}", searchWord);
		
		// 총 회원 수를 가져옴
		int totalRecordsCount = service.getUserTotalRecordsCount(searchType, searchWord);
		logger.info("회원 수: {}", totalRecordsCount);

		// 페이징 처리를 위한 내비게이터 객체 생성
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
	
		//회원 검색 결과를 조회
		// 게시글 시작 번호, 불러올 게시글 수를 전달해서 현재 페이지에 해당하는 5개의 게시글만 가져오도록 설정
		ArrayList<UserVO> userList = service.searchUser(navi.getStartRecord(), COUNT_PER_PAGE, searchType, searchWord);
		
		String userAddress = null;
		// 주소를 등록하지 않은 회원은 등록되지 않았다고 표시
		for(int i = 0; i < userList.size(); i++) {
			userAddress = userList.get(i).getUserAddress();
			if(userAddress.equals("_ ")) {
				userList.get(i).setUserAddress("등록된 주소 없음");
			}
		}
		
		logger.info("userList: {}", userList);
		model.addAttribute("userList", userList);
		
		return "admin/userManagement";
	}
}