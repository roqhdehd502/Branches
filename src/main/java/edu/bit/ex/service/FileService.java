package edu.bit.ex.service;

import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.vo.BoardVO;

public interface FileService {
	// 보드 ID 가져오기
	public BoardVO getBoardID(int board_id);

	// 파일 업로드
	public void saveFile(MultipartFile file);
}