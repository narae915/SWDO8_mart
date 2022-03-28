package com.project.market.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private int replyNum;			// 댓글 번호
	private int recipeNum;			// 레시피 게시판 번호
	private int userNum;			// 회원 번호
	private String replyContent;	// 댓글 내용
	private String replyDate;		// 댓글 작성 날짜
}
