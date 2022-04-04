package com.project.market.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.service.RecipeService;
import com.project.market.vo.RecipeVO;

@Controller
@RequestMapping(value = "/recipe")
public class RecipeController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

	@Autowired
	private RecipeService service;
	
	//레시피 게시판 이동
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String recipeList(Model model) {
		logger.info("recipeList 게시판(GET)");
		
		ArrayList<RecipeVO> recipeList = service.getRecipeList();
		
		if(recipeList != null) {
			logger.info("recipeList : {}", recipeList);
			model.addAttribute("recipeList", recipeList);
		}
		return "recipe/recipeList";
	}

	//레시피 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String searchword, Model model) {
		logger.info("검색 메소드(GET)");
		logger.info("searchword : {}", searchword);

		//검색결과 list에 저장
		ArrayList<RecipeVO> sRecipeList = service.searchRecipe(searchword);
		logger.info("검색 결과 : {}", sRecipeList);
		
		model.addAttribute("recipeList", sRecipeList);
		return "recipe/recipeListAjax";
	}
	
	//게시글 보기 이동
//	@RequestMapping(value = "/readRecipe", method = RequestMethod.GET)
//	public String readRecipe(String recipeNum) {
//		logger.info("readRecipe 게시글(GET)");
//		logger.info("recipeNum : {}", recipeNum);
//		
//		return "recipe/readRecipe?recipeNum="+recipeNum;
//	}
}
