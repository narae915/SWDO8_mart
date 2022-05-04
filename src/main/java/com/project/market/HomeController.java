package com.project.market;

import java.util.ArrayList;
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
import com.project.market.util.LookingImgSrc;
import com.project.market.vo.FileListVO;
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
	private LookingImgSrc imgSrc = new LookingImgSrc();
	
	//기본 메인화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("home 메인화면 (GET)");
		session.removeAttribute("findId");
		int countPerPage = 3;
		
		//파일을 불러오는 list 생성
		ArrayList<FileListVO> fileList = iService.getFileList();

		//상품 조회
		ArrayList<ItemVO> mealItemList = iService.mainItemList(10);
		
		//이미지 파일명을 itemList에 넣는 메소드
		mealItemList = imgSrc.setFileImg(mealItemList, fileList);
		logger.info("파일 입력완료 : {}", mealItemList);
		
		//세일상품 표현하는 메소드
		mealItemList = iService.sale(mealItemList);
		logger.info("세일 입력완료 :{}", mealItemList);
		model.addAttribute("mealItemList", mealItemList);

		//해산물 조회하는 메소드
		ArrayList<ItemVO> seafoodItemList = iService.mainItemList(20);
		
		//이미지 파일명을 itemList에 넣는 메소드
		seafoodItemList = imgSrc.setFileImg(seafoodItemList, fileList);
		model.addAttribute("seafoodItemList", seafoodItemList);
		
		//과일 + 채소를 함께 조회하기 위한 전용 메소드 
		ArrayList<ItemVO> produceItemList = iService.getProduceList();
		
		//이미지 파일명을 itemList에 넣는 메소드
		produceItemList = imgSrc.setFileImg(produceItemList, fileList);

		//세일상품 표현하는 메소드
		produceItemList = iService.sale(produceItemList);
		logger.info("세일 입력완료 :{}", produceItemList);
		model.addAttribute("produceItemList", produceItemList);
	
		//게시글 조회 최근 3개
		ArrayList<RecipeVO> recipeList = rService.getRecipeList(countPerPage);
		
		//게시글 조회 시 이미지 불러오기
		String temp = "";
		String titleImg = "";
		for(int i = 0; i < recipeList.size(); i++) {
			temp = recipeList.get(i).getContent();
			titleImg = LookingImgSrc.getImgSrc(temp);
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
	
	//상단바에서 검색했을 떄
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
		
		//파일을 불러오는 list 생성
		ArrayList<FileListVO> fileList = iService.getFileList();
		logger.info("상품 페이지 이미지파일 리스트 : {}", fileList);
		
		//검색 결과에 맞는 list가 있으면 model에 저장
		if(searchItemList != null) {
			//이미지 파일명을 itemList에 넣는 메소드
			searchItemList = imgSrc.setFileImg(searchItemList, fileList);

			//세일상품 표현하는 메소드
			searchItemList = iService.sale(searchItemList);
			logger.info("세일 입력완료 :{}", searchItemList);
			
			model.addAttribute("searchItemList", searchItemList);
		}
		
		// 게시글 확인 - 검색 결과 개수 확인, 검색 결과에 맞는 내용 확인
		int countRecipe = rService.countRecipeList(searchword);
		model.addAttribute("countRecipe", countRecipe); //검색 결과 개수 model 저장
		
		ArrayList<RecipeVO> searchRecipeList = rService.searchRecipe(searchword, countRecipe);
		logger.info("searchRecipeList: {}", searchRecipeList);

		//검색 결과에 맞는 list가 있으면 model에 저장
		if(searchRecipeList != null) {
			String temp = "";
			String titleImg = "";
			for(int i = 0; i < searchRecipeList.size(); i++) {
				temp = searchRecipeList.get(i).getContent();
				titleImg = LookingImgSrc.getImgSrc(temp);
				//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
				if(titleImg == null || titleImg == "") {
					searchRecipeList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
					continue;
				}
				//등록된 이미지가 있다면 그 이미지가 출력되게 설정
				searchRecipeList.get(i).setTitleImg(titleImg);
			}
			model.addAttribute("searchRecipeList", searchRecipeList);
		}
		
		//총 검색 결과 알려주기
		model.addAttribute("totalCount", countItem + countRecipe);

		return "allSearch";
	}

}
