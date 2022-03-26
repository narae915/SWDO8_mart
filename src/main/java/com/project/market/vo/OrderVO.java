package com.project.market.vo;

import lombok.Data;

@Data
public class OrderVO {

	private int orderNum;
	private int cartNum;
	private int userNum;
	private int itemNum;
	private String orderAddress;
	private String orderMail;
	private String orderCall;
	private int amount;
	private String indate;
	
// 22-03-24 노채린
	private String userMail;
	private String itemName;
	private int price;
}
