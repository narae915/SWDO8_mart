package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int orderCancel(List<Integer> intCancelNum) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.orderCancel(intCancelNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
