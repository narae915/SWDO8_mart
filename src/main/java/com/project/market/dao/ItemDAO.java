package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.ItemVO;


@Repository
public class ItemDAO {

	@Autowired
	private SqlSession session;

	// 카테고리 테이블 불러오기
	public ArrayList<HashMap<String, Object>> getCategoryList() {
		ArrayList<HashMap<String, Object>> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getCategoryList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//상품 리스트 불러오기
	public ArrayList<ItemVO> getItemList(HashMap<String,Object> map) {
		ArrayList<ItemVO> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getItemList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 상품 1개의 정보 불러오기
	public ItemVO getOneItem(int itemNum) {
		ItemVO result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getOneItem(itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
