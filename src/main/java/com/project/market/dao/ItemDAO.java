package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.FileListVO;
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

	// 상품 리스트 불러오기
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

	//상품 개수 확인(검색결과)
	public int countItemList(String searchword) {
		int result = 0;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.countItemList(searchword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//검색 결과 확인
	public ArrayList<ItemVO> getSearchItem(HashMap<String, Object> map) {
		ArrayList<ItemVO> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getSearchItem(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//과일, 채소 조회하는 메소드(메인화면에서 사용)
	public ArrayList<ItemVO> getProduceList() {
		ArrayList<ItemVO> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getProduceList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상품테이블에 등록된 상품 수 확인
	public int countRecipeList(int categoryNum) {
		int result = 0;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.countRecipeList(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//상품 리스트 불러오기(메인화면용)
	public ArrayList<ItemVO> mainItemList(int categoryNum) {
		ArrayList<ItemVO> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.mainItemList(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 사진 파일 전체 불러오기
	public ArrayList<FileListVO> getFileList() {
		ArrayList<FileListVO> result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getFileList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//세일 상품을 불러옴
	public ItemVO getSaleProduct(int itemNum) {
		ItemVO result = null;
		ItemMapper mapper = null;

		try {
			mapper = session.getMapper(ItemMapper.class);
			result = mapper.getSaleProduct(itemNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
