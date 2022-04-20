package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.RecipeVO;
import com.project.market.vo.ReplyVO;
import com.project.market.vo.ScoreVO;

public interface RecipeMapper {

	//게시판 테이블 컬럼 개수 확인(페이징 용)
	int countRecipeList(String searchword);

	//레시피 게시판 조회
	ArrayList<RecipeVO> getRecipeList(int countPerPage);

	//레시피 검색
	ArrayList<RecipeVO> searchRecipe(HashMap<String,Object> map);

	//상세 게시글 조회
	RecipeVO getRecipe(int recipeNum);

	//조회수 올리기
	int updateReadCount(int recipeNum);

	//레시피 게시글 삭제
	int deleteRecipe(int recipeNum);
	
	//댓글 등록
	int insertReply(ReplyVO reply);

	//댓글 조회
	ArrayList<ReplyVO> readReply(int recipeNum);

	////댓글 작성 후 작성 된 댓글 업로드
	ReplyVO newReply(int recipeNum);

	//댓글 삭제
	int deleteReply(int replyNum);

	//댓글 수정
	int updateReply(ReplyVO updateReply);

	//점수 주기
	int addScore(ScoreVO score);

	//평가 했는지 안했는지 확인
	Integer getScoreFlag(HashMap<String, Integer> map);

	//평가 평균 구하기
	double avgScore(int recipeNum);

	//테이블 내 평균 점수 수정
	void updateAvgScore(HashMap<String, Object> map);

	//댓글의 개수 확인
	int countReply(int recipeNum);

}
