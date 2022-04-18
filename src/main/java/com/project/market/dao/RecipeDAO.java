package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.RecipeVO;
import com.project.market.vo.ReplyVO;
import com.project.market.vo.ScoreVO;

@Repository
public class RecipeDAO {
	
	@Autowired
	private SqlSession session;

	//레시피 게시판 조회
	public ArrayList<RecipeVO> getRecipeList(int countPerPage) {
		ArrayList<RecipeVO> result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.getRecipeList(countPerPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//게시판 테이블의 등록된 게시글 수 확인
	public int countRecipeList(String searchword) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.countRecipeList(searchword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//레시피 검색
	public ArrayList<RecipeVO> searchRecipe(HashMap<String,Object> map) {
		ArrayList<RecipeVO> result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.searchRecipe(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//상세 게시글 조회
	public RecipeVO getRecipe(int recipeNum) {
		RecipeVO result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.getRecipe(recipeNum);
			//게시글 조회 후 조회수 업데이트
			mapper.updateReadCount(recipeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//레시피 게시글 삭제
	public int deleteRecipe(int recipeNum) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.deleteRecipe(recipeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//댓글 등록
	public int insertReply(ReplyVO reply) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//댓글 조회
	public ArrayList<ReplyVO> readReply(int recipeNum) {
		ArrayList<ReplyVO> result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.readReply(recipeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//댓글 작성 후 작성 된 댓글 업로드
	public ReplyVO newReply(int recipeNum) {
		ReplyVO result = null;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.newReply(recipeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//댓글 삭제
	public int deleteReply(int replyNum) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.deleteReply(replyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//댓글 수정
	public int updateReply(ReplyVO updateReply) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.updateReply(updateReply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//점수 주기
	public int addScore(ScoreVO score) {
		int result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.addScore(score);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//평가 했는지 안했는지 확인
	public int getScoreFlag(HashMap<String, Integer> map) {
		Integer resultValue = 0;
		int returnValue = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			resultValue = mapper.getScoreFlag(map);
			//결과값이 null이 나올 수 있기 때문에 Integer객체를 이용하여 null인지 확인하고, 리턴 값을 설정
			if(resultValue == null || resultValue == 0) {
				returnValue = 0;
			} else {
				returnValue = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnValue;
	}

	//평가 평균 구하기
	public double avgScore(int recipeNum) {
		double result = 0;
		RecipeMapper mapper = null;

		try {
			mapper = session.getMapper(RecipeMapper.class);
			result = mapper.avgScore(recipeNum);
			//평균을 구하고 테이블 수정
			HashMap<String, Object> map = new HashMap<>();
			map.put("score", result);
			map.put("recipeNum", recipeNum);
			mapper.updateAvgScore(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}//클래스 닫기
