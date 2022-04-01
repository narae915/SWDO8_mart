package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;

public interface OrderMapper {

	// 1. 페이징
	int getTotalRecordsCount(String searchWord);
	
	// 1-1.주문 리스트 불러오기 메소드
	// ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);
	
	// 1-2.주문 리스트 불러오기 임시 메소드
	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);

	// 2.주문 취소 메소드
	int orderCancel(List<Integer> intCancelNum);

	//장바구니에 상품넣기 - 박나래
	int insertCart(HashMap<String, Object> map);

	//장바구니 조회 - 박나래
	ArrayList<ItemVO> selectCartList();

	//장바구니에 같은 상품이 있는지 확인 - 박나래
	CartVO checkCart(int itemNum);

	//장바구니에 같은 상품이 있다면 수량을 증가 - 박나래
	int updateCartAmount(HashMap<String, Object> map);

}
