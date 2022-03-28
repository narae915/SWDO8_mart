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
import com.project.market.vo.ItemVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final int COUNT_PER_PAGE = 5;
	private static final int PAGE_PER_GROUP = 5;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	// 2022-03-27 노채린
	// 상품 목록 불러오기
	@RequestMapping(value = "/itemManagement", method = RequestMethod.GET)
	public String itemManagement(@RequestParam(defaultValue = "1") int currentPage, HttpSession session, Model model, String searchWord) {
		logger.info("itemManagement 메소드 실행(GET).");
		
		// 페이징
		// 검색하지 않았을 때
		if(searchWord == null) {
			searchWord = "";
		}
		int totalRecordsCount = service.getTotalRecordsCount(searchWord);
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 1. 상품 리스트 불러오기 메소드
		ArrayList<ItemVO> itemList = service.getItemList(navi.getStartRecord(), COUNT_PER_PAGE, searchWord);
		model.addAttribute("itemList", itemList);
		
		return "/admin/itemManagement";
	}
	
	// 2022-03-28 노채린
	// 상품 목록 삭제
	@RequestMapping(value = "/itemDelete", method = RequestMethod.POST)
	public String itemDelete(int itemNum) {
		logger.info("itemDelete 메소드 실행");
		logger.info("itemNum:{}", itemNum);
		boolean result = service.itemDelete(itemNum);
		
		if(result) {
			logger.info("상품 삭제 성공");
		} else {
			logger.info("상품 삭제 실패");
		}
		
		// 삭제 알림 표시해주기
		return "redirect:/admin/itemManagement";
	}
	
	// 상품 목록 추가 페이지
	@RequestMapping(value = "/itemInsert", method = RequestMethod.GET)
	public String itemInsert(HttpSession session, Model model){
		logger.info("itemInsert 메소드 실행(GET).");

		return "/admin/itemUpdate";
	}
	
	@RequestMapping(value ="/itemInsert", method = RequestMethod.POST)
	public String itemInsert(int category, String itemName, String price, String itemAmount) {
		logger.info("itemInsert 메소드 실행");
		
		logger.info("category:{}", category);
		logger.info("itemName:{}", itemName);
		logger.info("price:{}", price);
		logger.info("itemAmount:{}", itemAmount);

		boolean result = service.itemInsert(category, itemName, price, itemAmount);
		
		if(result) {
			logger.info("상품 추가 성공");
		} else {
			logger.info("상품 추가 실패");
		}
		
		// 추가됐다는 알림 표시해주기
		return "redirect:/admin/itemManagement";
	}
}