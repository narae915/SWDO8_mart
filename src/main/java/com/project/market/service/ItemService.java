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
}
