package com.project.market.vo;

import lombok.Data;

@Data
public class FileListVO {

	private int fileNum;				// 파일 번호
	private int recipeNum;				// 레시피 게시판 번호
	private int itemNum;				// 상품 번호
	private String originalFilename;	// 원본 사진
	private String savedFilename;		// 복사본 사진
	private String empImg;				// 사원 사진
}
