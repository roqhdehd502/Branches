package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.BoardVO;

@Mapper
public interface TestBoardMapper {
	// 공지사항 게시판 리스트
	@Select("SELECT * FROM board WHERE board_type_number = 1 ORDER BY board_id DESC, board_date DESC")
	public List<BoardVO> getNoticeList();

	// 매거진 게시판 리스트
	@Select("SELECT * FROM board WHERE board_type_number = 2 ORDER BY board_id DESC, board_date DESC")
	public List<BoardVO> getMagazineList();
}