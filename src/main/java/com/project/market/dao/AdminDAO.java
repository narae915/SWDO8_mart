package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.ItemVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession session;

	// 1.페이징
	public int getTotalRecordsCount(String searchWord) {
		int result = 0;
		AdminMapper mapper = null;

		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.getTotalRecordsCount(searchWord);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 1.상품 리스트 불러오기 메소드
	public ArrayList<ItemVO> getItemList(HashMap<String, Object> map) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<ItemVO> itemList = mapper.getItemList(map);
		
		return itemList;
	}

	// 2.상품 삭제 메소드
	public int itemDelete(int itemNum) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemDelete(itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int itemInsert(HashMap<String, Object> map) {
		int result = 0;
		AdminMapper mapper = null;
		
		try {
			mapper = session.getMapper(AdminMapper.class);
			result = mapper.itemInsert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
