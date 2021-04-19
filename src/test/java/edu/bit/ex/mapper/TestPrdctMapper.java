package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.PrdctVO;

@Mapper
public interface TestPrdctMapper {
	// 상품 리스트
	@Select("SELECT * FROM prdct")
	public List<PrdctVO> getPrdctList();
}