package com.project.market.vo;

import lombok.Data;

@Data
public class FileListVO {

	private int fileNum;
	private int recipeNum;
	private int itemNum;
	private String originalFilename;
	private String savedFilename;
}
