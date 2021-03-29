package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.mapper.CustomerMapper;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class CustomerServiceImpl implements CustomerService {
	private CustomerMapper customerMapper;

	@Override
	public void setMagazineCommentWrite(BoardBoardCommentVO boardBoardCommentVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int magazineCommentRemove(int comment_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardVO> getPrdQnAList(PrdQnACriteria cri, String p_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPrdQnATotal(PrdQnACriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MbrVO> getMemberList(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

}