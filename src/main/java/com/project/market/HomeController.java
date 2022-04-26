package com.project.market;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.market.service.ItemService;
import com.project.market.service.RecipeService;
import com.project.market.util.lookingImgSrc;
import com.project.market.vo.ItemVO;
import com.project.market.vo.RecipeVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ItemService iService;

	@Autowired
	private RecipeService rService;
	
	//이미지 주소를 불러오는 Class
	private lookingImgSrc imgSrc;
	
	//기본 메인화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("home 메인화면 (GET)");
		session.removeAttribute("findId");
		int countPerPage = 3;
		
		//상품 조회
		ArrayList<ItemVO> mealItemList = iService.getItemList(5, null, 10);
		model.addAttribute("mealItemList", mealItemList);
		ArrayList<ItemVO> seafoodItemList = iService.getItemList(5, null, 20);
		model.addAttribute("seafoodItemList", seafoodItemList);
		//과일 + 채소를 함께 조회하기 위한 전용 메소드 
		ArrayList<ItemVO> produceItemList = iService.getProduceList();
		model.addAttribute("produceItemList", produceItemList);
		
		
		//게시글 조회 최근 3개
		ArrayList<RecipeVO> recipeList = rService.getRecipeList(countPerPage);
		
		String temp = "";
		String titleImg = "";
		for(int i = 0; i < recipeList.size(); i++) {
			temp = recipeList.get(i).getContent();
			titleImg = lookingImgSrc.getImgSrc(temp);
			//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
			if(titleImg == null || titleImg == "") {
				recipeList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
				continue;
			}
			//등록된 이미지가 있다면 그 이미지가 출력되게 설정
			recipeList.get(i).setTitleImg(titleImg);
		}
		
		logger.info("recipeList:{}", recipeList);
		model.addAttribute("recipeList", recipeList);
		
		int countReply = 0;
		int [] countReplyArr = new int[3];

		//댓글 갯수를 배열에 저장 -> model에 저장
		for(int i = 0; i < recipeList.size(); i++) {
			countReply = rService.countReply(recipeList.get(i).getRecipeNum());
			countReplyArr[i] = countReply;
		}
		model.addAttribute("countReplyArr", countReplyArr);
		

		return "home";
	}
	
	@RequestMapping(value="/allSearch", method = RequestMethod.GET)
	public String allSearch(String searchword, Model model) {
		logger.info("모든 검색 결과(GET)");
		logger.info("searchword: {}", searchword);
		//검색어 사용자에게도 확인 시켜주기
		model.addAttribute("searchword", searchword);
		
		// 상품 확인 - 검색 결과 개수 확인, 검색 결과에 맞는 내용 확인
		int countItem = iService.countItemList(searchword);
		model.addAttribute("countItem", countItem); //검색 결과 개수 model 저장
		
		ArrayList<ItemVO> searchItemList = iService.getSearchItem(searchword, countItem);
		logger.info("searchItemList:{}",searchItemList);
		
		//검색 결과에 맞는 list가 있으면 model에 저장
		if(searchItemList != null) {
			model.addAttribute("searchItemList", searchItemList);
		}
		
		// 게시글 확인 - 검색 결과 개수 확인, 검색 결과에 맞는 내용 확인
		int countRecipe = rService.countRecipeList(searchword);
		model.addAttribute("countRecipe", countRecipe); //검색 결과 개수 model 저장
		
		ArrayList<RecipeVO> searchRecipeList = rService.searchRecipe(searchword, countRecipe);
		logger.info("searchRecipeList: {}", searchRecipeList);

		//검색 결과에 맞는 list가 있으면 model에 저장
		if(searchRecipeList != null) {
			model.addAttribute("searchRecipeList", searchRecipeList);
		}
		
		//총 검색 결과 알려주기
		model.addAttribute("totalCount", countItem + countRecipe);

		return "allSearch";
	}

}
