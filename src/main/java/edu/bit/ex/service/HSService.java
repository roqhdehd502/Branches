package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

public interface HSService {

	public List<PrdctVO> getProduct();

	public List<MbrVO> getMember();

	public List<BoardVO> getBoard();

	public List<OrderDetailVO> getOrder();

	public List<PrdctOrderVO> getPrdOrder();

	public List<MbrVO> getMemberList(SearchCriteria cri);

	public int getTotal(SearchCriteria cri);

}
