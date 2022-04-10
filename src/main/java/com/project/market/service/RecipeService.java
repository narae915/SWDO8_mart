package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.RecipeDAO;
import com.project.market.vo.RecipeVO;


@Service
public class RecipeService {
	
	@Autowired
	private RecipeDAO dao;

	//레시피 게시판 조회
	public ArrayList<RecipeVO> getRecipeList(int countPerPage) {
		return dao.getRecipeList(countPerPage);
	}

	//레시피 검색
	public ArrayList<RecipeVO> searchRecipe(String searchword) {
		return dao.searchRecipe(searchword);
	}

	//상세 게시글 조회
	public RecipeVO getRecipe(int recipeNum) {
		return dao.getRecipe(recipeNum);
	}

}
