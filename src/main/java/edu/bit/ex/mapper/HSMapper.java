package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface HSMapper {

	@Select("select * from prdct")
	public List<PrdctVO> getProduct();

	@Select("select * from mbr")
	public List<MbrVO> getMember();

	@Select("select * from board")
	public List<BoardVO> getBoard();

	@Select("select * from order_detail")
	public List<OrderDetailVO> getOrder();

	@Select("select * from prdct_order")
	public List<PrdctOrderVO> getPrdOrder();

	public int getTotal(SearchCriteria cri);

	public List<MbrVO> getMemberList(SearchCriteria cri);

}
