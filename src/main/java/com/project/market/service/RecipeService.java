package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.RecipeDAO;
import com.project.market.vo.RecipeVO;
import com.project.market.vo.ReplyVO;
import com.project.market.vo.ScoreVO;


@Service
public class RecipeService {
	
	@Autowired
	private RecipeDAO dao;

	//레시피 게시판 조회
	public ArrayList<RecipeVO> getRecipeList(int countPerPage) {
		return dao.getRecipeList(countPerPage);
	}
	
	//게시판 테이블의 등록된 게시글 수 확인
	public int countRecipeList(String searchword) {
		return dao.countRecipeList(searchword);
	}

	//레시피 검색
	public ArrayList<RecipeVO> searchRecipe(String searchword, int countPerPage) {
		HashMap <String, Object> map = new HashMap<>();
		map.put("searchword", searchword);
		map.put("countPerPage", countPerPage);
		
		return dao.searchRecipe(map);
	}

	//상세 게시글 조회
	public RecipeVO getRecipe(int recipeNum) {
		return dao.getRecipe(recipeNum);
	}

	//레시피 게시글 삭제
	public boolean deleteRecipe(int recipeNum) {
		return dao.deleteRecipe(recipeNum) > 0;
	}
	
	//댓글 등록
	public boolean insertReply(ReplyVO reply) {
		return dao.insertReply(reply) > 0;
	}

	//댓글 조회
	public ArrayList<ReplyVO> readReply(int recipeNum) {
		return dao.readReply(recipeNum);
	}

	//댓글 작성 후 작성 된 댓글 업로드
	public ReplyVO newReply(int recipeNum) {
		return dao.newReply(recipeNum);
	}

	//댓글 삭제
	public int deleteReply(int replyNum) {
		return dao.deleteReply(replyNum);
	}

	//댓글 수정
	public int updateReply(ReplyVO updateReply) {
		return dao.updateReply(updateReply);
	}

	//점수 주기
	public boolean addScore(ScoreVO score) {
		return dao.addScore(score) > 0;
	}

	//평가 했는지 안했는지 확인
	public int getScoreFlag(int recipeNum, int userNum) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("recipeNum", recipeNum);
		map.put("userNum", userNum);
		return dao.getScoreFlag(map);
	}

	//평가의 평균 점수 구하기
	public double avgScore(int recipeNum) {
		return dao.avgScore(recipeNum);
	}

	// 게시판 글 작성
	public boolean insertRecipe(String subject, String editordata, String userMail, String recipeTag) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("subject", subject);
		map.put("editordata", editordata);
		map.put("userMail", userMail);
		map.put("recipeTag", recipeTag);
		
		return dao.insertRecipe(map) > 0;
	}

	// 작성된 글의 제목과 내용을 불러오기
	public RecipeVO getWriting(int recipeNum) {

		return dao.getWriting(recipeNum);
	}

	// 게시판 글  수정
	public boolean updateWriting(int recipeNum, String subject, String editordata, String recipeTag) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("recipeNum", recipeNum);
		map.put("subject", subject);
		map.put("editordata", editordata);
		map.put("recipeTag", recipeTag);

		return dao.updateWriting(map) > 0;
	}
	
	//댓글의 갯수 확인
	public int countReply(int recipeNum) {
		return dao.countReply(recipeNum);
	}

}
