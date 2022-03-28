package com.project.market.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.service.ItemService;
import com.project.market.vo.ItemVO;

@Controller
@RequestMapping(value = "/item")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	private int countPerPage = 9;
	@Autowired
	private ItemService service;
	
	//상품 선택 페이지 이동
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		logger.info("상품 선택 페이지(GET)");

		//DB에 저장된 카테고리 테이블 출력
		ArrayList<HashMap<String, Object>> category = service.getCategoryList();
		logger.info("category: {}",category);
		
		model.addAttribute("categoryList", category);

		String sorting = null;
		int categoryNum = 0;
		model.addAttribute("countPerPage", countPerPage);
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);
		logger.info("itemList:{}", itemList);

		model.addAttribute("itemList", itemList);
		
		return "item/itemList";
	}
	
	//정렬하기, 카테고리 별로 보기
	@RequestMapping(value = "/sorting", method = RequestMethod.POST)
	public String sortingItem(String sendNum, String sorting, Model model) {
		logger.info("Sorting 메소드 실행(POST)");
		logger.info("값 확인 -> sorting : {} , sendNum : {}",sorting, sendNum);
		int categoryNum = Integer.parseInt(sendNum); // int형으로 자료형변환
		
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);
		logger.info("itemList:{}", itemList);
		
		model.addAttribute("itemList", itemList);
		
		return "item/itemListAjax";
	}
	
	//정렬하기, 카테고리 별로 보기
		// @ResponseBody
		@RequestMapping(value = "/loading", method = RequestMethod.POST)
		public String loading(String startCount, String viewCount, String sorting, String searchNum, Model model) {
			logger.info("loading 메소드 실행(GET)");
			logger.info("startCount:{}", startCount);
			logger.info("viewCount:{}", viewCount);
			logger.info("searchNum:{}", searchNum);
			logger.info("sorting:{}", sorting);
		
			int categoryNum = Integer.parseInt(searchNum);
			int startNum = Integer.parseInt(startCount);
			int viewNum = Integer.parseInt(viewCount);
			
			int countPerPage = startNum + viewNum;

			ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting,categoryNum);
			logger.info("itemList:{}", itemList);
			
			model.addAttribute("itemList", itemList);

			return "item/itemListAjax";
		}
	
	
	//상품 상세 페이지 이동
	@RequestMapping(value = "/readItem", method = RequestMethod.GET)
	public String readItem(int itemNum, Model model) {
		logger.info("상품 상세 페이지 이동(GET)");
		logger.info("넘어온 아이템 번호:{}", itemNum);
		
		//DB에 저장된 카테고리 테이블 출력
		ArrayList<HashMap<String, Object>> category = service.getCategoryList();
		logger.info("category: {}",category);
		
		model.addAttribute("categoryList", category);

		ItemVO item = service.getOneItem(itemNum);
		logger.info("item:{}", item);
		
		model.addAttribute("item", item);
		return "item/readItem";
	}
}
