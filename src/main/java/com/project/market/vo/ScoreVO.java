package com.project.market.vo;

import lombok.Data;

//평점 주기 VO
@Data
public class ScoreVO {

	private int userNum; // 유저 번호
	private int recipeNum; // 레시피 번호
	private int rating; // 점수(사용자가 평가한 점수)
	private int scoreFlag; // 점수 매기기 
}
