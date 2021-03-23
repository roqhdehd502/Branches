package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.HSMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class HSServiceImpl implements HSService {

	private HSMapper mapper;

	@Override
	public List<PrdctVO> getProduct() {
		log.info("getProduct......");
		return mapper.getProduct();
	}

	@Override
	public List<MbrVO> getMember() {
		log.info("getMember......");
		return mapper.getMember();
	}

	@Override
	public List<BoardVO> getBoard() {
		log.info("getBoard......");
		return mapper.getBoard();
	}

	@Override
	public List<OrderDetailVO> getOrder() {
		log.info("getOrder......");
		return mapper.getOrder();
	}

	@Override
	public List<PrdctOrderVO> getPrdOrder() {
		log.info("getPrdOrder......");
		return mapper.getPrdOrder();
	}

}
