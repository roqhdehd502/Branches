package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.BoardMapper;
import edu.bit.ex.vo.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;

	// 공지사항 게시판 리스트
	@Override
	public List<BoardVO> getNoticeList() {
		log.info("getNoticeList");
		return boardMapper.getNoticeList();
	}
}