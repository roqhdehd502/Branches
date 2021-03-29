package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.AdminMapper;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
	private AdminMapper adminMapper;

	@Override
	public MbrVO getNoticeMember(String mbr_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setNoticeWrite(BoardVO boardVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int noticeRemove(int board_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void setNoticeModify(BoardVO boardVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public MbrVO getMagazineMember(String mbr_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setMagazineWrite(BoardVO boardVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void setMagazineModify(BoardVO boardVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public int getTotal(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}