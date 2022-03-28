package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.ItemVO;

public interface AdminMapper {

	// 1.페이징
	int getTotalRecordsCount(String searchWord);

	// 1.상품 리스트 불러오기 메소드
	ArrayList<ItemVO> getItemList(HashMap<String, Object> map);

	// 2.상품 삭제 메소드
	int itemDelete(int itemNum);

	int itemInsert(HashMap<String, Object> map);

}
