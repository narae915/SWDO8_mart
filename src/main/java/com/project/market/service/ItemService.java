package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.ItemDAO;
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
}
