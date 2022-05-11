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
import com.project.market.util.LookingImgSrc;
import com.project.market.vo.FileListVO;
import com.project.market.vo.ItemVO;

@Controller
@RequestMapping(value = "/item")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	private int countPerPage = 9;
	@Autowired
	private ItemService service;
	
	//이미지 주소를 불러오는 Class
	private LookingImgSrc imgSrc = new LookingImgSrc();
	
	//상품 선택 페이지 이동
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList(@RequestParam(defaultValue = "0") int categoryNum, Model model) {
		logger.info("상품 선택 페이지(GET)");

		//사용자가 카테고리를 선택해서 categoryNum이 0이 아닐 경우 number를 model에 저장
		if(categoryNum != 0) {
			model.addAttribute("categoryNum", categoryNum);
		}
		
		// 카테고리 테이블 불러오기
		ArrayList<HashMap<String, Object>> category = service.getCategoryList();
		logger.info("category: {}",category);
		
		model.addAttribute("categoryList", category);

		String sorting = null;
		model.addAttribute("countPerPage", countPerPage);
		
		//상품 리스트 불러오기
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);

		//파일을 불러오는 list 생성
		ArrayList<FileListVO> fileList = service.getFileList();
		logger.info("상품 페이지 이미지파일 리스트 : {}", fileList);
		//파일 이미지 저장
		itemList = imgSrc.setFileImg(itemList, fileList);
		// 세일 상품 저장
		itemList = service.sale(itemList);
		logger.info("세일,파일 포함:{}", itemList);

		model.addAttribute("itemList", itemList);
		
		return "item/itemList";
	}
	
	//정렬하기, 카테고리 별로 보기
	@RequestMapping(value = "/sorting", method = RequestMethod.GET)
	public String sortingItem(String sendNum, String sorting, Model model) {
		logger.info("Sorting 메소드 실행(POST)");
		logger.info("값 확인 -> sorting : {} , sendNum : {}",sorting, sendNum);
		int categoryNum = Integer.parseInt(sendNum); // int형으로 자료형변환
		
		//상품 리스트 불러오기
		ArrayList<ItemVO> itemList = service.getItemList(countPerPage, sorting, categoryNum);
		
		//파일을 불러오는 list 생성
		ArrayList<FileListVO> fileList = service.getFileList();
		logger.info("상품 페이지 이미지파일 리스트 : {}", fileList);

		//파일 이미지 저장
		itemList = imgSrc.setFileImg(itemList, fileList);
		
		// 세일 상품 저장
		itemList = service.sale(itemList);
		logger.info("세일,파일 포함:{}", itemList);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("categoryNum", categoryNum);
		
		return "item/itemListAjax";
	}
	
	//정렬하기, 카테고리 별로 보기(더보기 눌렀을 때 ajax)
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

		// 상품 테이블의 등록된 상품 수 확인
		int countColumn = service.countRecipeList(categoryNum);
		logger.info("countColumn:{}",countColumn);

		//총 상품 수가 조회되어 있는 상품 수와 같거나,적을 경우 null을 보내므로서 ajax실패를 만듬
		if(countColumn <= startNum) {
			return null;
		//총 게시글 수가 조회되어 있는 게시글 수보다 많을 경우
		} else {
			// 상품 리스트 불러오기
			ArrayList<ItemVO> itemList = service.getItemList(countPerPage,sorting,categoryNum);
			
			// 파일을 불러오는 list 생성
			// 사진 파일 전체 불러오기
			ArrayList<FileListVO> fileList = service.getFileList();
			logger.info("상품 페이지 이미지파일 리스트 : {}", fileList);
			
			//파일 이미지 저장
			itemList = imgSrc.setFileImg(itemList, fileList);
			
			// 세일 상품 저장
			itemList = service.sale(itemList);
			logger.info("세일,파일 포함:{}", itemList);
			
			model.addAttribute("itemList", itemList);
		}
		return "item/itemListAjax";
	}
	
	
	//상품 상세 페이지 이동
	@RequestMapping(value = "/readItem", method = RequestMethod.GET)
	public String readItem(int itemNum, Model model) {
		logger.info("상품 상세 페이지 이동(GET)");
		logger.info("넘어온 아이템 번호:{}", itemNum);
		
		// 카테고리 테이블 불러오기
		ArrayList<HashMap<String, Object>> category = service.getCategoryList();
		logger.info("category: {}",category);
		
		model.addAttribute("categoryList", category);

		// 상품 1개의 정보 불러오기
		ItemVO item = service.getOneItem(itemNum);
		logger.info("item:{}", item);
		
		//세일 확인
		String itemName = item.getItemName();
		int salePrice = 0;
		if(itemName.contains("포도")) {
			//20%할인
			salePrice = (int)(item.getPrice() * 0.80);
			item.setSalePrice(salePrice);
		} else if(itemName.contains("참외")) {
			//30%할인
			salePrice = (int)(item.getPrice() * 0.70);
			item.setSalePrice(salePrice);
		} else if(itemName.contains("오렌지")) {
			//50%할인
			salePrice = (int)(item.getPrice() * 0.50);
			item.setSalePrice(salePrice);
		} else if(itemName.contains("스테이크")) {
			//30%할인
			salePrice = (int)(item.getPrice() * 0.70);
			item.setSalePrice(salePrice);
		} else {
			item.setSalePrice(0);
		}
		
		//파일을 불러오는 list 생성
		ArrayList<FileListVO> tempList = service.getFileList();
		ArrayList<String> fileList = new ArrayList<>();

		
		//모든 파일 정보를 알 수 있는 tempList에서 jsp에 표시하고 싶은 fileList로 옮기기
		// 같은 아이템 번호일 경우만 옮긴다.
		for(int i = 0; i < tempList.size(); i++) {
			if(tempList.get(i).getItemNum() == itemNum) {
				fileList.add(tempList.get(i).getSavedFilename());
			}
		}
		
		logger.info("상품 페이지 이미지파일 리스트 : {}", fileList);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("item", item);
		return "item/readItem";
	}

}
