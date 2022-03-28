package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.ItemVO;

public interface ItemMapper {

	//카테고리 테이블 불러오기
	ArrayList<HashMap<String, Object>> getCategoryList();

	//상품 리스트 불러오기
	ArrayList<ItemVO> getItemList(HashMap<String,Object> map);

	//상품 1개의 정보 불러오기
	ItemVO getOneItem(int itemNum);
}
