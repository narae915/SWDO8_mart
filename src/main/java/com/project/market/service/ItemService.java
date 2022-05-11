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

	// 상품 리스트 불러오기
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

	// 상품테이블에 등록된 상품 수 확인
	public int countRecipeList(int categoryNum) {
		return dao.countRecipeList(categoryNum);
	}

	// 사진 파일 전체 불러오기
	public ArrayList<FileListVO> getFileList() {
		return dao.getFileList();
	}
	
	//세일 상품 처리하는 메소드
	public ArrayList<ItemVO> sale(ArrayList<ItemVO> itemList) {
		ItemVO saleMenu = null;
		int salePrice = 0; // 할인된 가격
		int price = 0; //원래 가격
		int itemNum = 0; // 아이템번호
		double temp = 0; 
		
		//세일 상품 처리하는 for문
		for(int i = 0; i < itemList.size(); i++) {
			//상품의 원가
			price = itemList.get(i).getPrice();
			itemNum = itemList.get(i).getItemNum();
			// 세일 상품인지 확인
			saleMenu = dao.getSaleProduct(itemNum);
			// 만약 세일 상품이라면
			if(saleMenu != null) {
				//할인율을 salePrice에 저장
				salePrice = saleMenu.getSalePercent();
				//할인율 계산 -> 사용자가 입력한 값이 30퍼였을 경우, 70퍼의 값을 받아야함. 할인된 가격을 구하기위해 100에서 빼고, 0.01을 곱함
				temp =(100-salePrice)*0.01;
				//원래 가격에서 할인되고 난 뒤의 값을 도출
				salePrice = (int)(price*temp);
				itemList.get(i).setSalePrice(salePrice);
			} else {
				itemList.get(i).setSalePrice(0);
			}
		}
		
		return itemList;
	}
}
