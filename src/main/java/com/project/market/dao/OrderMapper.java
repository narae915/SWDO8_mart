package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.OrderVO;

public interface OrderMapper {

	// 1. 페이징
	int getTotalRecordsCount(String searchWord);
	
	// 1-1.주문 리스트 불러오기 메소드
	// ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);
	
	// 1-2.주문 리스트 불러오기 임시 메소드
	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);

	// 2.주문 취소 메소드
	int orderCancle(ArrayList<String> orderNumList);

}
