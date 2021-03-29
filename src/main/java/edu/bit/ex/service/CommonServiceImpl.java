package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.mapper.CommonMapper;
import edu.bit.ex.page.MagazineCommentCriteria;
import edu.bit.ex.page.MagazineCriteria;
import edu.bit.ex.page.NoticeCriteria;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CartVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctImageVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class CommonServiceImpl implements CommonService {
	private CommonMapper commonMapper;

	@Override
	public List<BoardVO> getNoticeList(NoticeCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNoticeTotal(NoticeCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getNoticeContent(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardPrdctImageVO> getMagazineList(MagazineCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMagazineTotal(MagazineCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO getMagazineContent(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctImageVO> getMagazineImage(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int magazineUpLike(int board_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardCommentVO getMagazineCommentCnt(String mbr_id, int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardBoardCommentVO> getMagazineComment(String mbr_id, int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMagazineCommentTotal(MagazineCommentCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> getCartList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PrdctVO getProductDetail(String prdct_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctDetailVO> getProductInfo(String p_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PrdctImageVO getprdDetailImage(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctVO> getProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MbrVO> getMember() {
		// TODO Auto-generated method stub
		return null;
	}

}