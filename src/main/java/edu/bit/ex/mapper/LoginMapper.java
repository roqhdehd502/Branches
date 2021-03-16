package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.MemberVO;

@Mapper
public interface LoginMapper {
	// 더미 데이터 불러오기
	@Select("SELECT board_id FROM table1")
	public MemberVO read(String board_id);
}