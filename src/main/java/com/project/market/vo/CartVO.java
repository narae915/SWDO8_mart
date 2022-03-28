package com.project.market.vo;

import lombok.Data;

@Data
public class CartVO {

	private int cartNum;		// 장바구니 번호
	private int itemNum;		// 상품 번호
	private int cartAmount;		// 장바구니 상품 수량
}
