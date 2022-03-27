package com.project.market.vo;

import lombok.Data;

@Data
public class ItemVO {
	
	private int itemNum;
	private String itemName;
	private int price;
	private int itemAmount;
	private int categoryNum;
	
	//22-03-27 노채린
	private String categoryName;
}
