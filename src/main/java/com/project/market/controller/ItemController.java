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
	public String itemList(@RequestParam(defaultValue = "0") int categoryNum, Model model) {
		logger.info("상품 선택 페이지(GET)");

		//사용자가 카테고리를 선택해서 categoryNum이 0이 아닐 경우 number를 model에 저장
		if(categoryNum != 0) {
			model.addAttribute("categoryNum", categoryNum);
		}
		//DB에 저장된 카테고리 테이블 출력
		ArrayList<HashMap<String, Object>> category = service.getCategoryList();
		logger.info("category: {}",category);
		
		model.addAttribute("categoryList", category);

		String sorting = null;
		model.addAttribute("countPerPage", countPerPage);
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);
		
		String saleMenu = null;
		int salePrice = 0; // 할인된 가격
		int price = 0; //원래 가격
		
		//세일 상품 처리하는 for문
		for(int i = 0; i < itemList.size(); i++) {
			saleMenu = itemList.get(i).getItemName();
			price = itemList.get(i).getPrice();
			if(saleMenu.contains("포도")) {
				//20% 할인
				salePrice = (int)(price * 0.80);
				itemList.get(i).setSalePrice(salePrice);
			} else if(saleMenu.contains("참외")) {
				//30% 할인
				salePrice = (int)(price * 0.70);
				itemList.get(i).setSalePrice(salePrice);
			} else if(saleMenu.contains("오렌지")) {
				//50% 할인
				salePrice = (int)(price * 0.50);
				itemList.get(i).setSalePrice(salePrice);
			} else if(saleMenu.contains("스테이크")) { // "스테이크" 를 동적으로 이용하고 싶으면 변수로 지정
				//30% 할인
				salePrice = (int)(price * 0.70);
				itemList.get(i).setSalePrice(salePrice);
			} else {
				//할인 상품이 아닐경우 jsp에 표현하기 위해 0을 입력
				itemList.get(i).setSalePrice(0);
			}
		}
		
		logger.info("itemList:{}", itemList);

		model.addAttribute("itemList", itemList);
		
		return "item/itemList";
	}
	
	//정렬하기, 카테고리 별로 보기
	@RequestMapping(value = "/sorting", method = RequestMethod.GET)
	public String sortingItem(String sendNum, String sorting, Model model) {
		logger.info("Sorting 메소드 실행(POST)");
		logger.info("값 확인 -> sorting : {} , sendNum : {}",sorting, sendNum);
		int categoryNum = Integer.parseInt(sendNum); // int형으로 자료형변환
		
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);
		logger.info("itemList:{}", itemList);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("categoryNum", categoryNum);
		
		return "item/itemListAjax";
	}
	
	//정렬하기, 카테고리 별로 보기( 더보기 눌렀을 때 ajax)
	@RequestMapping(value = "/loading", method = RequestMethod.GET)
	public String loading(String startCount, String viewCount, String sorting, String searchNum, Model model) {
		logger.info("loading 메소드 실행(GET)");
		logger.info("startCount,viewCount:{} , {}", startCount, viewCount);
		logger.info("searchNum:{}", searchNum);
		logger.info("sorting:{}", sorting);
	
		int categoryNum = Integer.parseInt(searchNum);
		int startNum = Integer.parseInt(startCount);
		int viewNum = Integer.parseInt(viewCount);
		
		int countPerPage = startNum + viewNum;

		//상품 테이블의 등록된 상품 수 확인
		int countColumn = service.countRecipeList(categoryNum);
		logger.info("countColumn:{}",countColumn);

		//총 상품 수가 조회되어 있는 상품 수와 같거나,적을 경우 null을 보내므로서 ajax실패를 만듬
		if(countColumn <= startNum) {
			return null;
		//총 게시글 수가 조회되어 있는 게시글 수보다 많을 경우
		} else {
			ArrayList<ItemVO> itemList = service.getItemList(countPerPage,sorting,categoryNum);
			logger.info("itemList:{}", itemList);
			
			model.addAttribute("itemList", itemList);
		}
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
