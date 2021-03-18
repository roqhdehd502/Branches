package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.BoardVO;

@Mapper
public interface BoardMapper {
	// 공지사항 게시판 리스트
	public List<BoardVO> getNoticeList();
}