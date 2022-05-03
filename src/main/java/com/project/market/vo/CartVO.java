package com.project.market.vo;

import lombok.Data;

@Data
public class CartVO {

	private int cartNum;		// 장바구니 번호
	private int itemNum;		// 상품 번호
	private int cartAmount;		// 장바구니 상품 수량
	
	private int userNum;		// 회원번호
	private int price;			// 가격
	private String itemName;	// 상품명
	
	private String savedFilename; // 사진파일 이름
	private String savedFileNum; // 사진파일 번호
}
