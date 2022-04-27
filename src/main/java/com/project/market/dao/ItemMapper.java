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

	//상품 개수 확인(검색결과)
	int countItemList(String searchword);

	//검색 결과 확인
	ArrayList<ItemVO> getSearchItem(HashMap<String, Object> map);

	//과일, 채소 조회하는 메소드(메인화면에서 사용)
	ArrayList<ItemVO> getProduceList();

	//상품테이블에 등록된 상품 수 확인
	int countRecipeList(int categoryNum);
}
