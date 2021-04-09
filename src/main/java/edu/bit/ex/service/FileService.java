package edu.bit.ex.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	// 파일 업로드
	public void saveFile(MultipartFile file);
}