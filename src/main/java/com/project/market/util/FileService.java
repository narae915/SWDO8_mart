package com.project.market.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 관련 기능을 수행하는 클래스
 */
public class FileService {

	/**
	 * 사용자가 업로드한 파일을 저장하는 메소드
	 * @param mfile 업로드한 파일 객체
	 * @param path 저장할 경로
	 * @return 저장된 파일명
	 */
	public static String saveFile(MultipartFile mfile, String uploadPath) {
		// 업로드한 파일이 없거나 비어있으면 저장하지 않고 null을 리턴.
		if (mfile == null || mfile.isEmpty() || mfile.getSize() == 0) {
			//파일을 올리지 않거나, 파일의 내용이 없거나, 파일의 크기가 0이거나.
			return null;
		}
		
		// 파일을 저장할 경로가 존재하지 않으면 폴더를 생성.
		File path = new File(uploadPath); 
		if (!path.isDirectory()) { //폴더로 가는 경로가 없니?아니니? //zzzㅋㅋㅋ아니니? 누군가에게 물어보고있어
			path.mkdirs(); //그럼 폴더를(make directorys)만들어줘
		}
		
		// 업로드한 파일명을 가져옴.
		String originalFilename = mfile.getOriginalFilename();
		
		// 임의의 식별자를 생성하여 저장할 파일명을 작성.
		UUID uuid = UUID.randomUUID();
		String savedFilename = uuid.toString() + originalFilename;
		
		// 업로드한 파일을 저장할 때 사용하기 위한 File 객체 생성.
		File serverFile = new File(uploadPath + "/" + savedFilename);
		
		// 파일 저장 시도.
		try {
			mfile.transferTo(serverFile);
		} catch (Exception e) {
			e.printStackTrace();
			savedFilename = null; //저장에 실패하면 null을 출력
		}
		
		// 저장된 파일명을 리턴.
		return savedFilename;
	}
	
	/**
	 * 저장된 파일을 삭제하는 메소드
	 * @param fullpath 삭제할 파일이 존재하는 경로
	 * @return 삭제 성공/실패 여부
	 */
	public static boolean deleteFile(String fullpath) {
		//파일 삭제 성공/실패 여부를 리턴할 변수
		boolean result = false;
		
		//전달받은 경로를 이용해서 File 객체 생성
		File delFile = new File(fullpath);
		
		//해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}
		
		return result;
	}
}
