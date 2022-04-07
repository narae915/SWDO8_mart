package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.OrderDAO;
import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;


@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;

	// 주문 리스트 페이징
	public int getTotalRecordsCount(String searchWord) {
		
		return dao.getTotalRecordsCount(searchWord);
	}
	
	// 주문 리스트 불러오기 메소드
	/*
	public ArrayList<OrderVO> getOrderList(String userMail, int startRecord, int countPerPage, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);
		map.put("userMail", userMail);
		
		return dao.getOrderList(map);
	}
	*/
	
	// 주문 리스트 불러오기 임시 메소드
	public ArrayList<OrderVO> getOrderList(int startRecord, int countPerPage, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);

		return dao.getOrderList(map);
	}

	// 주문 취소 메소드
	public boolean orderCancel(List<String> cancelNum) {
		
		List<Integer> intCancelNum = cancelNum.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		
		return dao.orderCancel(intCancelNum) > 0;
	}

	// 장바구니 리스트 페이징 메소드
	public int getCartTotalRecordsCount() {

		return dao.getCartTotalRecordsCount();
	}

	// 장바구니 리스트 불러오기 메소드
	public ArrayList<CartVO> getCartList(int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);

		return dao.getCartList(map);
	}
	
	// 장바구니 삭제
	public boolean cartCancel(int cartNum) {
		
		return dao.cartCancel(cartNum) > 0;
	}
	
	//장바구니에 상품넣기
	public boolean insertCart(int itemNum, int cartAmount, int userNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("cartAmount", cartAmount);
		map.put("userNum", userNum);
		return dao.insertCart(map) > 0;
	}

	//장바구니 상품 조회
	public ArrayList<ItemVO> selectCartList(String userMail) {
		return dao.selectCartList(userMail);
	}

	//장바구니에 같은 상품이 있는지 확인
	public CartVO checkCart(int itemNum,int userNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("userNum", userNum);
		return dao.checkCart(map);
	}

	//장바구니에 같은 상품이 있다면 수량을 증가
	public boolean updateCartAmount(int itemNum, int cartAmount,int userNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("cartAmount", cartAmount);
		map.put("userNum", userNum);
		return dao.updateCartAmount(map) > 0;
	}

}
