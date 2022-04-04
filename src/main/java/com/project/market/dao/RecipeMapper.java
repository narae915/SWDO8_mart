package com.project.market.dao;

import java.util.ArrayList;

import com.project.market.vo.RecipeVO;

public interface RecipeMapper {

	//레시피 게시판 조회
	ArrayList<RecipeVO> getRecipeList();

	//레시피 검색
	ArrayList<RecipeVO> searchRecipe(String searchword);

}
