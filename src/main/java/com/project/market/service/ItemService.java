package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.ItemDAO;
import com.project.market.vo.FileListVO;
import com.project.market.vo.ItemVO;

@Service
public class ItemService {

	@Autowired
	private ItemDAO dao;

	//카테고리 테이블 불러오기
	public ArrayList<HashMap<String, Object>> getCategoryList() {
		
		return dao.getCategoryList();
	}

	//상품 리스트 불러오기
	public ArrayList<ItemVO> getItemList(int countPerPage, String sorting, int categoryNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("sorting", sorting);
		map.put("categoryNum", categoryNum);
		map.put("countPerPage", countPerPage);
		
		return dao.getItemList(map);
	}
	
	//상품 리스트 불러오기(메인화면용)
	public ArrayList<ItemVO> mainItemList(int categoryNum) {
		return dao.mainItemList(categoryNum);
	}

	//상품 1개의 정보 불러오기
	public ItemVO getOneItem(int itemNum) {
		return dao.getOneItem(itemNum);
	}

	//상품 개수 확인(검색결과)
	public int countItemList(String searchword) {
		return dao.countItemList(searchword);
	}

	//검색 결과 확인
	public ArrayList<ItemVO> getSearchItem(String searchword, int countItem) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchword", searchword);
		map.put("countPerPage", countItem);
		
		return dao.getSearchItem(map);
	}

	//과일, 채소 조회하는 메소드(메인화면에서 사용)
	public ArrayList<ItemVO> getProduceList() {
		return dao.getProduceList();
	}

	//상품테이블에 등록된 상품 수 확인
	public int countRecipeList(int categoryNum) {
		return dao.countRecipeList(categoryNum);
	}

	//전체 파일 불러오기
	public ArrayList<FileListVO> getFileList() {
		return dao.getFileList();
	}
	
	//세일 상품 처리하는 메소드
	public ArrayList<ItemVO> sale(ArrayList<ItemVO> itemList) {
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
		
		return itemList;
	}
}
