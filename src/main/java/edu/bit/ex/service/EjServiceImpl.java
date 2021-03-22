package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.EjMapper;
import edu.bit.ex.vo.CartVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@AllArgsConstructor
@Service
public class EjServiceImpl implements EjService {
	private EjMapper ejMapper;

	// 장바구니
	@Override
	public List<CartVO> getCartList() {
		log.info("getCartList");
		return ejMapper.getCartList();
	}

}