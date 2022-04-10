package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.RecipeVO;

public interface RecipeMapper {

	//레시피 게시판 조회
	ArrayList<RecipeVO> getRecipeList(int countPerPage);

	//레시피 검색
	ArrayList<RecipeVO> searchRecipe(String searchword);

	//상세 게시글 조회
	RecipeVO getRecipe(int recipeNum);

	//조회수 올리기
	int updateReadCount(int recipeNum);

}
