package com.project.market.vo;

import lombok.Data;

@Data
public class ItemVO {
	
	private int itemNum;		// 상품 번호
	private String itemName;	// 상품 이름
	private int price;			// 상품 가격
	private int itemAmount;		// 상품 재고수량
	private int categoryNum;	// 카테고리 번호
	
	//22-03-27 노채린
	private String categoryName; // 카테고리 이름
	
	//22-03-30 박나래
	private int cartNum; // 장바구니 번호
	private int cartAmount; // 장바구니 수량
	
	//22-04-11 박나래
	private int rownum; // 번호 매기기
	
	//22-04-30 노채린
	private String originalFilename; // 원본 파일 명
	private String savedFilename; // 저장된 파일 명
}
