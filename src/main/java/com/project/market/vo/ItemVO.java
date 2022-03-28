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
}
