package com.project.market.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.RecipeVO;

@Repository
public class RecipeDAO {
	
	@Autowired
	private SqlSession session;

	//레시피 게시판 조회
	public ArrayList<RecipeVO> getRecipeList() {
		ArrayList<RecipeVO> result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.getRecipeList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//레시피 검색
	public ArrayList<RecipeVO> searchRecipe(String searchword) {
		ArrayList<RecipeVO> result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.searchRecipe(searchword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
