package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.market.dao.AdminDAO;
import com.project.market.vo.ItemVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	// 1.페이징
	public int getTotalRecordsCount(String searchWord) {
		return dao.getTotalRecordsCount(searchWord);
	}

	// 1. 상품 리스트 불러오기 메소드
	public ArrayList<ItemVO> getItemList(int startRecord, int countPerPage, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);

		return dao.getItemList(map);
	}

	// 2.상품 삭제 메소드
	public boolean itemDelete(int itemNum) {
		
		return dao.itemDelete(itemNum) > 0;
	}

	public boolean itemInsert(int category, String itemName, String price, String itemAmount) {
		int intPrice = Integer.parseInt(price);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("itemName", itemName);
		map.put("intPrice", intPrice);
		map.put("itemAmount", itemAmount);
		
		return dao.itemInsert(map) > 0;
	}
}
