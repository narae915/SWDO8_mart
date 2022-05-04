package com.project.market.util;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.project.market.vo.FileListVO;
import com.project.market.vo.ItemVO;

/*
img태그를 찾는 메소드 클래스
*/
public class LookingImgSrc {
	
	
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
	
	// 정규식을 이용해 모든 img태그의 src를 리턴타입이 arraylist인 메소드 입니다
	public ArrayList<String> getImgListSrc(String str) {
  		Pattern nonValidPattern = Pattern
  				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
  		
  		ArrayList<String> result = new ArrayList<>();
  		Matcher matcher = nonValidPattern.matcher(str);
  		while (matcher.find()) {
  			result.add(matcher.group(1));
  		}
  		
  		return result;
  	} 

	//이미지 파일명을 itemList에 넣는 메소드
	public ArrayList<ItemVO> setFileImg(ArrayList<ItemVO> itemList, ArrayList<FileListVO> fileList) {
		
		String temp = null;
		int tempNum = 0;

		//itemList에 이미지 파일 넣기
		for(int i = 0; i < itemList.size(); i++) {
			//가상의 int에 아이템 번호 넣기
			tempNum = itemList.get(i).getItemNum();
			
			//파일리스트 크기만큼 반복
			for(int j = 0; j <= fileList.size(); j++) {
				
				if(itemList.get(i).getSavedFilename() == null) {
					//itemList의 아이템번호와 fileList의 아이템번호가 같을 때
					if(tempNum == fileList.get(j).getItemNum()) {
						//fileList의 제일 첫번째 올린 파일이름을 가상의 string에 저장
						temp = fileList.get(0).getSavedFilename();
						itemList.get(i).setSavedFilename("/uploadImg/" + temp);
					} else {
						//상품 사진이 없을 경우 기본 이미지로 설정
						itemList.get(i).setSavedFilename("/resources/img/itemDefault.png");
						break;
					}
				}
				//파일리스트 테이블에 같은 상품 번호가 없을 경우 기본 이미지로 설정
				if(itemList.get(i).getSavedFilename() == null) {
					itemList.get(i).setSavedFilename("/resources/img/itemDefault.png");
				}
			}
		}
		return itemList;
	}

}
