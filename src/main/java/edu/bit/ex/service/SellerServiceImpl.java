package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.SellerMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class SellerServiceImpl implements SellerService {
	private SellerMapper sellerMapper;

	@Override
	public List<BoardVO> getBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailVO> getOrder() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PrdctOrderVO> getPrdOrder() {
		// TODO Auto-generated method stub
		return null;
	}

}