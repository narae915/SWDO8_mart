package com.project.market.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.market.dao.UserDAO;
import com.project.market.service.RecipeService;
import com.project.market.util.LookingImgSrc;
import com.project.market.vo.RecipeVO;
import com.project.market.vo.ReplyVO;
import com.project.market.vo.ScoreVO;
import com.project.market.vo.UserVO;

@Controller
@RequestMapping(value = "/recipe")
public class RecipeController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

	private int countPerPage = 6;
	@Autowired
	private RecipeService service;
	@Autowired
	private UserDAO uDao;
	
	//이미지 주소를 불러오는 Class
	private LookingImgSrc imgSrc;
	
	//레시피 게시판 이동
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String recipeList(Model model) {
		logger.info("recipeList 게시판(GET)");
		String nothing = null;
		
		// 레시피 게시판 조회
		ArrayList<RecipeVO> recipeList = service.getRecipeList(countPerPage);

		//레시피 게시판에 게시글이 없을 때
		if(recipeList.size() == 0) {
			nothing = "nothing";
		}
		model.addAttribute("nothing", nothing);
		
		//최신글 전용
		ArrayList<RecipeVO> newPostList = service.getRecipeList(6);
		
		if(recipeList != null) {
			
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
				logger.info("recipeList : {}", recipeList);
				model.addAttribute("recipeList", recipeList);
		}
		
		
		//최신글 이미지 설정
		if(newPostList != null) {
			
			String temp = "";
			String titleImg = "";
			for(int i = 0; i < newPostList.size(); i++) {
				temp = newPostList.get(i).getContent();
				titleImg = LookingImgSrc.getImgSrc(temp);
				//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
				if(titleImg == null || titleImg == "") {
					newPostList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
					continue;
				}
				//등록된 이미지가 있다면 그 이미지가 출력되게 설정
				newPostList.get(i).setTitleImg(titleImg);
			}
			//최신글 전용
			model.addAttribute("newPostList", newPostList);
		}
		return "recipe/recipeList";
	}

	//레시피 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(String searchword, Model model) {
		logger.info("search 검색 메소드(GET)");
		logger.info("searchword : {}", searchword);

		// 레시피 검색
		//검색결과 list에 저장
		ArrayList<RecipeVO> sRecipeList = service.searchRecipe(searchword, countPerPage);
		logger.info("검색 결과 : {}", sRecipeList);
		
		//최신글 전용
		ArrayList<RecipeVO> newPostList = service.getRecipeList(6);
		
		if(sRecipeList != null) {
			String temp = "";
			String titleImg = "";
			for(int i = 0; i < sRecipeList.size(); i++) {
				temp = sRecipeList.get(i).getContent();
				titleImg = LookingImgSrc.getImgSrc(temp);
				//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
				if(titleImg == null || titleImg == "") {
					sRecipeList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
					continue;
				}
				//등록된 이미지가 있다면 그 이미지가 출력되게 설정
				sRecipeList.get(i).setTitleImg(titleImg);
			}
		model.addAttribute("recipeList", sRecipeList);
		model.addAttribute("searchword", searchword);
		}
		
		//최신글 이미지 설정
		if(newPostList != null) {
			
			String temp = "";
			String titleImg = "";
			for(int i = 0; i < newPostList.size(); i++) {
				temp = newPostList.get(i).getContent();
				titleImg = LookingImgSrc.getImgSrc(temp);
				//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
				if(titleImg == null || titleImg == "") {
					newPostList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
					continue;
				}
				//등록된 이미지가 있다면 그 이미지가 출력되게 설정
				newPostList.get(i).setTitleImg(titleImg);
			}
			//최신글 전용
			model.addAttribute("newPostList", newPostList);
		}
		return "recipe/recipeList";
	}
	
	//더보기 페이징 - 검색 ver
	@RequestMapping(value = "/searchLoading", method = RequestMethod.GET)
	public String searchLoading(String startCount, String viewCount, String searchword, Model model) {
		logger.info("loading 더보기 페이징 검색ver 실행(GET)");
		logger.info("startCount:{}", startCount);
		logger.info("viewCount:{}", viewCount);
		logger.info("searchword : {}", searchword);
	
		int startNum = Integer.parseInt(startCount);
		int viewNum = Integer.parseInt(viewCount);
		
		int countPerPage = startNum + viewNum;
		
		//게시판 테이블의 등록된 게시글 수 확인
		int countColumn = service.countRecipeList(searchword);
		//총 게시글 수가 조회되어 있는 게시글 수보다 같거나,적을 경우 null을 보내므로서 ajax실패를 만듬
		if(countColumn <= startNum) {
			return null;
		//총 게시글 수가 조회되어 있는 게시글 수보다 많을 경우
		} else {
			//검색결과 list에 저장
			ArrayList<RecipeVO> sRecipeList = service.searchRecipe(searchword, countPerPage);
			
			if(sRecipeList != null) {
				
				String temp = "";
				String titleImg = "";
				for(int i = 0; i < sRecipeList.size(); i++) {
					temp = sRecipeList.get(i).getContent();
					titleImg = LookingImgSrc.getImgSrc(temp);
					//등록된 이미지가 없을 경우 기본 이미지가 나오게끔 설정
					if(titleImg == null || titleImg == "") {
						sRecipeList.get(i).setTitleImg("/resources/img/cooking_recipe.png");
						continue;
					}
					//등록된 이미지가 있다면 그 이미지가 출력되게 설정
					sRecipeList.get(i).setTitleImg(titleImg);
				}
			}
			
			logger.info("검색 결과 : {}", sRecipeList);
			model.addAttribute("recipeList", sRecipeList);
			model.addAttribute("searchword", searchword);
		}
		return "recipe/recipeListAjax";
	}
	
	//더보기 페이징 - 일반 ver
	@RequestMapping(value = "/loading", method = RequestMethod.GET)
	public String loading(String startCount, String viewCount, Model model) {
		logger.info("loading 더보기 페이징 일반ver 실행(GET)");
		logger.info("startCount:{}", startCount);
		logger.info("viewCount:{}", viewCount);
	
		int startNum = Integer.parseInt(startCount);
		int viewNum = Integer.parseInt(viewCount);
		
		int countPerPage = startNum + viewNum;
		String searchword = null;
		
		//게시판 테이블의 등록된 게시글 수 확인
		int countColumn = service.countRecipeList(searchword);
		//총 게시글 수가 조회되어 있는 게시글 수보다 같거나,적을 경우 null을 보내므로서 ajax실패를 만듬
		if(countColumn <= startNum) {
			return null;
		//총 게시글 수가 조회되어 있는 게시글 수보다 많을 경우
		} else {
			ArrayList<RecipeVO> recipeList = service.getRecipeList(countPerPage);
			
			if(recipeList != null) {
				
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
			}
			logger.info("recipeList:{}", recipeList);
			model.addAttribute("recipeList", recipeList);
		}
		return "recipe/recipeListAjax";
	}
	
	//게시글 보기 이동
	@RequestMapping(value = "/readRecipe", method = RequestMethod.GET)
	public String readRecipe(int recipeNum, HttpSession session, Model model) {
		logger.info("readRecipe 게시글(GET)");
		logger.info("recipeNum : {}", recipeNum);
		
		String userMail = (String)session.getAttribute("userMail");
		UserVO loginUser = uDao.getUser(userMail);

		userMail = userMail.substring(0, userMail.lastIndexOf("@"));
		model.addAttribute("userMail", userMail);
		model.addAttribute("loginNum", loginUser.getUserNum());
		
		//평가 했는지 안했는지 확인, 평균 점수 조회
		int scoreFlag = service.getScoreFlag(recipeNum, loginUser.getUserNum());
		logger.info("scoreFlag : {}",scoreFlag);
		model.addAttribute("scoreFlag", scoreFlag);
		// 게시글 번호가 있으면 실행
		if(recipeNum != 0) {
			
			// 상세 게시글 조회
			//게시글을 조회할때 dao에서 조회수도 1회 올라가게 하였음
			RecipeVO recipe = service.getRecipe(recipeNum);
			
			//게시글 태그 조회
			String str = recipe.getRecipeTag();
			if(str != null) {
				String[] arr = new String[10];
				arr = str.split(",");
				model.addAttribute("tagArr", arr);
			}

			model.addAttribute("recipe", recipe);

			logger.info("recipe : {} ", recipe);

			
			//댓글 조회
			ArrayList<ReplyVO> replyList = service.readReply(recipeNum);
			
			logger.info("replyList : {}", replyList);
			model.addAttribute("replyList", replyList);
			
			
			//이전글 번호, 다음글 번호를 변수에 저장
			int prev = recipe.getPrev();
			int next = recipe.getNext();

			String emptyMessage = null;
			
			//상세 게시글 조회
			// 이전글과 다음글이 존재한다면 조회하여 model에 저장
			if(prev != -1) {
				RecipeVO prevRecipe = service.getRecipe(prev);
				if(prevRecipe != null) {
					model.addAttribute("prev", prevRecipe);
				}
			} else {
				emptyMessage = "이전 글이 존재하지 않습니다.";
				model.addAttribute("emptyPrevMessage", emptyMessage);
			}
			if(next != -1) {
				//상세 게시글 조회
				RecipeVO nextRecipe = service.getRecipe(next);
				if(nextRecipe != null) {
					model.addAttribute("next", nextRecipe);
				}
			} else {
				emptyMessage = "다음 글이 존재하지 않습니다.";
				model.addAttribute("emptyNextMessage", emptyMessage);
			}
		}
		
		return "recipe/readRecipe";
	}

	// 레시피 수정 페이지 불러오기
	@RequestMapping(value="/updateRecipe", method = RequestMethod.GET)
	public String updateRecipe(int recipeNum, Model model) {
		logger.info("recipe 게시글 수정 페이지 이동(GET)");
		
		logger.info("게시글 번호 : {}", recipeNum);
		model.addAttribute("recipeNum", recipeNum);
		
		// 작성된 글의 제목과 내용을 불러오기
		RecipeVO recipe = service.getWriting(recipeNum);
		logger.info("recipe : {}", recipe);
		
		//게시글 태그 조회
		String str = recipe.getRecipeTag();

		if(str != null) {
			String[] arr = new String[10];
			arr = str.split(",");
			model.addAttribute("tagArr", arr);
		}

		model.addAttribute("recipe", recipe);
		logger.info("recipe:{}",recipe);
		
		return "recipe/update";
	}

	// 레시피 게시글 수정
	@RequestMapping(value="/updateRecipe", method = RequestMethod.POST)
	public String updateRecipe(int recipeNum, String subject, String editordata, String recipeTag) {
		logger.info("recipe 게시글 수정(POST)");
		logger.info("recipeTag : {}", recipeNum);
		
		// 게시판 글  수정
		boolean result = service.updateWriting(recipeNum, subject, editordata, recipeTag);
		
		if(result) {
			logger.info("게시글 수정 성공");
		} else {
			logger.info("게시글 수정 실패");
		}
		return "redirect:/recipe/recipeList";
	}
	
	//레시판 게시글 삭제
	@RequestMapping(value="/deleteRecipe", method = RequestMethod.GET)
	public String deleteRecipe(int recipeNum) {
		logger.info("recipe 게시글 삭제(GET)");
		logger.info("삭제할 게시글 번호 : {}", recipeNum);
		
		//레시피 게시글 삭제
		boolean result = service.deleteRecipe(recipeNum);
		if(result) {
			logger.info("게시글 삭제 성공");
		} else {
			logger.info("게시글 삭제 실패");
		}
		return "redirect:/recipe/recipeList";
	}
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value = "/insertReply", method = RequestMethod.POST)
	public String insertReply(ReplyVO reply, HttpSession session, Model model) {
		logger.info("inserReply 댓글 등록 (POST)");
		logger.info("reply : {}", reply);
		
		//로그인 한 아이디의 정보를 조회 후 reply에 번호만 넘겨줌
		String userMail = (String)session.getAttribute("userMail");
		UserVO loginUser = uDao.getUser(userMail);
		reply.setUserNum(loginUser.getUserNum());

		// 댓글 등록
		boolean result = service.insertReply(reply);
		
		if(result) {
			logger.info("댓글 등록 완료");
		} else {
			logger.info("댓글 등록 실패");
		}
		return null;
	}
	
	//댓글 조회(ajax용 댓글 작성후 1개씩 늘어나게 하기)
	@ResponseBody
	@RequestMapping(value = "/newReply", method = RequestMethod.GET)
	public ReplyVO newReply(int recipeNum, Model model) {
		logger.info("readReply 댓글 조회 (GET)");
		logger.info("recipeNum : {}", recipeNum);
		
		//댓글 작성 후 작성 된 댓글 업로드
		//추가하고 싶은 댓글 하나만을 조회
		ReplyVO reply = service.newReply(recipeNum);
		
		logger.info("reply : {}", reply);
		
		return reply;
	}
	
	//댓글 수정 후 조회
	@ResponseBody
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public ArrayList<ReplyVO> updateReply(int replyNum, String updateContent, int recipeNum) {
		logger.info("updateReply 댓글 수정(POST)");
		logger.info("replyNum : {}", replyNum);
		logger.info("updateContent : {}", updateContent);

		//받아온 정보를 ReplyVO에 저장
		ReplyVO updateReply = new ReplyVO();
		updateReply.setReplyNum(replyNum);
		updateReply.setReplyContent(updateContent);
		
		// 댓글 수정
		int result = service.updateReply(updateReply);
		if(result > 0) {
			//수정에 성공하면 댓글 조회
			ArrayList<ReplyVO> replyList = service.readReply(recipeNum);
			return replyList;
		}
		return null;
	}
	
	//댓글 삭제 후 조회 
	@ResponseBody
	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public ArrayList<ReplyVO> deleteReply(int replyNum, int recipeNum) {
		logger.info("deleteReply 댓글 삭제(POST)");
		logger.info("replyNum : {}", replyNum);
		
		// 댓글 삭제
		int result = service.deleteReply(replyNum);
		
		if(result > 0) { //삭제에 성공하면
			 
			// 댓글 조회
			ArrayList<ReplyVO> replyList = service.readReply(recipeNum);
			return replyList;
		}
		return null;
	}
	
	//점수 주기 RequestMapping뒤에 return값이 한글이라 UTF-8 설정
	@ResponseBody
	@RequestMapping(value = "/addScore" , method = RequestMethod.POST)
	public double addScore(ScoreVO ratingScore) {
		logger.info("addScore 점수 주기(POST)");
		logger.info("ScoreVO: {}", ratingScore);
		double score = 0;
		
		// 점수 주기
		// 평가한 점수를 DB에 저장하기
		boolean result = service.addScore(ratingScore);
		
		if(result) {
			//평가 평균 구하기
			//게시판 점수의 평균 값을 내서 DB에 저장
			score = service.avgScore(ratingScore.getRecipeNum());
			logger.info("score: {}", score);
		}
		
		return score;
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		logger.info("write 메서드 실행(GET)");
		
		return "/recipe/write";
	}

	// 게시글 작성 
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Authentication authentication, String subject, String editordata, String recipeTag) {
		logger.info("write 메서드 실행(POST)");
		
		String userMail = authentication.getName();
		logger.info("subject:{}",subject);
		logger.info("editordata:{}",editordata);
		logger.info("userMail:{}",userMail);
		logger.info("recipeTag: {}", recipeTag);
		
		// 게시판 글 작성
		boolean result = service.insertRecipe(subject, editordata, userMail, recipeTag);
		if(result) {
			logger.info("게시글 작성 성공");
		} else {
			logger.info("게시글 작성 실패");
		}
		
		return "redirect:/recipe/recipeList";
	}
	
	// 사진을 드래그 앤 드롭 시 파일명을 읽어 사진을 출력함.
	@RequestMapping(value="/uploadSummernoteImageFile", method= RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
//		  String fileRoot = "C:\\Upload Files\\springday"; // 외부경로로 저장을 희망할때.
		 
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/img/";
		
		logger.info("fileRoot:{}",fileRoot); // 파일 저장 주소
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		//ㅣ-> 오리지널 파일명과 확장자를 분리
		
		// UUID.randomUUID()를 통해 고유 이름으로 바꿔 저장.(중복 파일명 방지)
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			logger.info("try");
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			
			// 업로드 url을 리턴, 이미지 미리보기 실행
			jsonObject.addProperty("url", "/resources/img/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			logger.info("catch");
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString(); // Json 객체의 전체 파일을 String으로 변환 후 리턴 시작
		return a;
	}
}
