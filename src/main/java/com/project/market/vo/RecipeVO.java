package com.project.market.vo;

import lombok.Data;

@Data
public class RecipeVO {

	private int recipeNum;	// 레시피 게시판 번호
	private int userNum;	// 회원 번호
	private String title;	// 게시글 제목
	private String content;	// 게시글 내용
	private int readCount;	// 게시글 조회수
	private double score;	// 게시글 평가
	private String indate;	// 게시글 작성 날짜

	// 박나래
	private int rownum; //번호 매기기
	private int prev; // 이전글 번호를 조회
	private int next; // 다음글 번호를 조회
	private String titleImg; // 게시글 리스트 페이지에서 보여주는 이미지
	private String recipeTag; // 태그 모음
}
