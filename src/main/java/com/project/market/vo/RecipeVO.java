package com.project.market.vo;

import lombok.Data;

@Data
public class RecipeVO {

	private int recipeNum;	// 레시피 게시판 번호
	private int userNum;	// 회원 번호
	private String title;	// 게시글 제목
	private String content;	// 게시글 내용
	private int readCount;	// 게시글 조회수
	private int score;		// 게시글 평가
	private String indate;	// 게시글 작성 날짜
}
