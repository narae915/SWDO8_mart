package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	// 1.페이징
	public int getTotalRecordsCount(String searchWord) {
		return dao.getTotalRecordsCount(searchWord);
	}
	
	// 1-1.주문 리스트 불러오기 메소드
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
	
	// 1-2.주문 리스트 불러오기 임시 메소드
	public ArrayList<OrderVO> getOrderList(int startRecord, int countPerPage, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("searchWord", searchWord);

		return dao.getOrderList(map);
	}

	// 2.주문 취소 메소드
	public boolean orderCancle(String[] orderNum) {
		// ArrayList로 변환
		ArrayList<String> orderNumList = new ArrayList<>();
		for (int i = 0; i < orderNum.length; i++) {
			orderNumList.add(i, orderNum[i]);
			// System.out.print(orderNumList.get(i));
		}
		
		return dao.orderCancle(orderNumList) > 0;
	}

	//장바구니에 상품넣기
	public boolean insertCart(int itemNum, int cartAmount) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("cartAmount", cartAmount);
		return dao.insertCart(map) > 0;
	}

	//장바구니 상품 조회
	public ArrayList<ItemVO> selectCartList() {
		return dao.selectCartList();
	}

	//장바구니에 같은 상품이 있는지 확인
	public CartVO checkCart(int itemNum) {
		return dao.checkCart(itemNum);
	}

	//장바구니에 같은 상품이 있다면 수량을 증가
	public boolean updateCartAmount(int itemNum, int cartAmount) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
		map.put("cartAmount", cartAmount);
		return dao.updateCartAmount(map) > 0;
	}

}
