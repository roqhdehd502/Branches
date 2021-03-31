package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;

@Mapper
public interface FileMapper {
	// 보드 ID 가져오기
	public BoardVO getBoardID(int board_id);

	// 파일 저장
	public void saveFile(String saveName);
}