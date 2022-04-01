package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession session;

	// 1.페이징
	public int getTotalRecordsCount(String searchWord) {
		int result = 0;
		OrderMapper mapper = null;

		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getTotalRecordsCount(searchWord);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	// 1-1.주문 리스트 불러오기 메소드
	/*
	public ArrayList<OrderVO> getOrderList(HashMap<String, Object> map) {
		OrderMapper mapper = session.getMapper(OrderMapper.class);
		ArrayList<OrderVO> orderList = mapper.getOrderList(map);
		
		return orderList;
	}
	*/
	
	// 1-2.주문 리스트 불러오기 임시 메소드
	public ArrayList<OrderVO> getOrderList(HashMap<String, Object> map) {
		OrderMapper mapper = session.getMapper(OrderMapper.class);
		ArrayList<OrderVO> orderList = mapper.getOrderList(map);
		
		return orderList;
	}

	// 2.주문 취소 메소드
	public int orderCancle(ArrayList<String> orderNumList) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.orderCancle(orderNumList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에 상품 넣기
	public int insertCart(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.insertCart(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니 상품 조회
	public ArrayList<ItemVO> selectCartList() {
		ArrayList<ItemVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.selectCartList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에 같은 상품이 있는지 확인
	public CartVO checkCart(int itemNum) {
		CartVO result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.checkCart(itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에 같은 상품이 있다면 수량을 증가
	public int updateCartAmount(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.updateCartAmount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
