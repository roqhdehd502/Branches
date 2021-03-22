package edu.bit.ex.service;

import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.vo.PrdctImageVO;

public interface FileService {
	// 파일 업로드
	public void saveFile(MultipartFile file);

	// 매거진 이미지 불러오기
	public PrdctImageVO getMagazineImage(int image_number);
}