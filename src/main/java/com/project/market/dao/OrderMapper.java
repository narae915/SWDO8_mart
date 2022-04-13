package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;
import com.project.market.vo.UserVO;

public interface OrderMapper {

	// 주문 리스트 페이징 - 노채린
	int getTotalRecordsCount(HashMap<String, Object> map);
	
	// 주문 리스트 불러오기 메소드 - 노채린
	ArrayList<OrderVO> getOrderList(HashMap<String, Object> map);

	// 주문 취소 메소드 - 노채린
	int orderCancel(List<Integer> intCancelNum);

	// 장바구니 페이징 - 노채린
	int getCartTotalRecordsCount(String userMail);

	// 장바구니 리스트 불러오기 메소드 - 노채린
	ArrayList<CartVO> getCartList(HashMap<String, Object> map);

	// 장바구니 삭제  - 노채린
	int cartCancel(int cartNum);
	
	//장바구니에 상품넣기 - 박나래
	int insertCart(HashMap<String, Object> map);

	//장바구니 조회 - 박나래
	ArrayList<ItemVO> selectCartList(String userMail);

	//장바구니에 같은 상품이 있는지 확인 - 박나래
	CartVO checkCart(HashMap<String, Object> map);

	//장바구니에 같은 상품이 있다면 수량을 증가 - 박나래
	int updateCartAmount(HashMap<String, Object> map);

	// 결제 정보 입력 페이지 회원정보 불러오기 - 노채린
	ArrayList<UserVO> getUserList(String userMail);

	// 결제 정보 입력 페이지 상품정보 불러오기 - 노채린
	ArrayList<ItemVO> getItemList(HashMap<String, Object> map);

}
