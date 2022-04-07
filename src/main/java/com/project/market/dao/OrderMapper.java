package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;

public interface OrderMapper {

	// 주문 리스트 페이징
	int getTotalRecordsCount(String searchWord);
	
	// 1-1.주문 리스트 불러오기 메소드
	// ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);
	
	// 1-2.주문 리스트 불러오기 임시 메소드
	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);

	// 주문 취소 메소드
	int orderCancel(List<Integer> intCancelNum);

	// 장바구니 페이징
	int getCartTotalRecordsCount();

	// 장바구니 리스트 불러오기 메소드
	ArrayList<CartVO> getCartList(HashMap<String, Object> map);

	// 장바구니 삭제 
	int cartCancel(int cartNum);
	
	//장바구니에 상품넣기 - 박나래
	int insertCart(HashMap<String, Object> map);

	//장바구니 조회 - 박나래
	ArrayList<ItemVO> selectCartList(String userMail);

	//장바구니에 같은 상품이 있는지 확인 - 박나래
	CartVO checkCart(HashMap<String, Object> map);

	//장바구니에 같은 상품이 있다면 수량을 증가 - 박나래
	int updateCartAmount(HashMap<String, Object> map);

}
