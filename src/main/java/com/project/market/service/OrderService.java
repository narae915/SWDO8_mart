package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.OrderDAO;
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
	public boolean orderCancel(List<String> cancelNum) {
		
		List<Integer> intCancelNum = cancelNum.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		
		return dao.orderCancel(intCancelNum) > 0;
	}

}
