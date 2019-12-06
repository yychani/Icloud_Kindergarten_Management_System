package com.oracle5.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class Oracle5FileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		long currentTime = System.currentTimeMillis();
		
		int randomNumber = (int) (Math.random() * 100000);
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//확장자명 가져오기
		String name = oldFile.getName();
		String body = "";
		String ext = ""; // 확장자를 저장할 변수
		int dot = name.lastIndexOf("."); // 점의 위치를 찾음
		
		if(dot != -1) { 
			body = name.substring(0, dot);
			ext = name.substring(dot);
		}else { // 확장자가 없는 경우 -1반환
			body = name;
		}
		
		String fileName = "5racle_" + ft.format(new Date(currentTime)) + randomNumber + ext;
		
		File newFile = new File(oldFile.getParent(), fileName); // 부모 경로에 대한 경로명을 문자열로 넘겨준다
		
		return newFile;
	}

}
