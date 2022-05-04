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
	
	private String originalFilename; // 원래 파일이름
	private String savedFilename; // 저장한 파일 이름
}
