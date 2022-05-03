package com.project.market.vo;

import lombok.Data;

@Data
public class OrderVO {

	private int orderNum;			// 주문 번호
	private int cartNum;			// 장바구니 번호
	private int userNum;			// 회원 번호
	private int itemNum;			// 상품 번호
	private String orderAddress;	// 주문 주소
	private String orderMail;		// 주문 메일 (ID)
	private String orderCall;		// 주문 연락처
	private int amount;				// 상품 수량
	private String indate;			// 주문 날짜
	
// 22-03-24 노채린
	private String userMail;		// 유저 메일 (ID)
	private String itemName;		// 상품 이름
	private int price;				// 가격
	
// 22-05-03 노채린
	private String savedFilename;	// 주문 상품 사진명
	private String savedFileNum;	// 주문 상품 사진 번호
}
