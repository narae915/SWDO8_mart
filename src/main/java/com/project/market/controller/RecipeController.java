package com.project.market.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

	private int countPerPage = 6;
	@Autowired
	private RecipeService service;
	
	//레시피 게시판 이동
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String recipeList(Model model) {
		logger.info("recipeList 게시판(GET)");
		
		model.addAttribute("countPerPage", countPerPage);
		ArrayList<RecipeVO> recipeList = service.getRecipeList(countPerPage);
		
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
		model.addAttribute("searchword", searchword);
		return "recipe/recipeList";
	}
	
	//더보기 페이징
	@RequestMapping(value = "/loading", method = RequestMethod.GET)
	public String loading(String startCount, String viewCount, Model model) {
		logger.info("loading 메소드 실행(GET)");
		logger.info("startCount:{}", startCount);
		logger.info("viewCount:{}", viewCount);
	
		int startNum = Integer.parseInt(startCount);
		int viewNum = Integer.parseInt(viewCount);
		
		int countPerPage = startNum + viewNum;

		ArrayList<RecipeVO> recipeList = service.getRecipeList(countPerPage);
		logger.info("recipeList:{}", recipeList);
		
		model.addAttribute("recipeList", recipeList);

		return "recipe/recipeListAjax";
	}
	
	//게시글 보기 이동
	@RequestMapping(value = "/readRecipe", method = RequestMethod.GET)
	public String readRecipe(int recipeNum, HttpSession session, Model model) {
		logger.info("readRecipe 게시글(GET)");
		logger.info("recipeNum : {}", recipeNum);
		
		// 게시글 번호가 있으면 실행
		if(recipeNum != 0) {
			RecipeVO recipe = service.getRecipe(recipeNum);
			model.addAttribute("recipe", recipe);

			logger.info("recipe : {} ", recipe);
			
			//이전글 번호, 다음글 번호를 변수에 저장
			int prev = recipe.getPrev();
			int next = recipe.getNext();

			String emptyMessage = null;
			
			// 이전글과 다음글이 존재한다면 조회하여 model에 저장
			if(prev != -1) {
				RecipeVO prevRecipe = service.getRecipe(prev);
				if(prevRecipe != null) {
					model.addAttribute("prev", prevRecipe);
				}
			} else {
				emptyMessage = "이전 글이 존재하지 않습니다.";
				model.addAttribute("emptyMessage", emptyMessage);
			}
			if(next != -1) {
				RecipeVO nextRecipe = service.getRecipe(next);
				if(nextRecipe != null) {
					model.addAttribute("next", nextRecipe);
				}
			} else {
				emptyMessage = "다음 글이 존재하지 않습니다.";
				model.addAttribute("emptyMessage", emptyMessage);
			}
		}
		
		String userMail = (String)session.getAttribute("userMail");
		userMail = userMail.substring(0, userMail.lastIndexOf("@"));
		model.addAttribute("userMail", userMail);
		
		return "recipe/readRecipe";
	}
}
