package com.project.market.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
img태그를 찾는 메소드 클래스
*/
public class lookingImgSrc {
	
	//img태그 찾는 메소드
	public static String getImgSrc(String str) {
		Pattern nonValidPattern = Pattern
			.compile("(?i)< *[IMG][^\\>]*[src] *= *[\"\']{0,1}([^\"\'\\ >]*)");
			int imgCnt = 0;
			String content = "";
			Matcher matcher = nonValidPattern.matcher(str);
			while (matcher.find()) {
				content = matcher.group(1);
				imgCnt++;
				if(imgCnt == 1){
					break;                                  
				}
			}
		return content;
	}

}
