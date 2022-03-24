package com.project.market.vo;

import lombok.Data;

@Data
public class RecipeVO {

	private int recipeNum;
	private int userNum;
	private String title;
	private String content;
	private int readCount;
	private int score;
	private String indate;
}
