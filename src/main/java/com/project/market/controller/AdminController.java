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
}