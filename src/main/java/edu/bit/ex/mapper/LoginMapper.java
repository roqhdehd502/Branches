package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.MemberVO;

@Mapper
public interface LoginMapper {
	// 더미 데이터 불러오기
	@Select("SELECT board_id FROM table1 where board_id = #{abcd1234}")
	public MemberVO read(String board_id);

	@Select("select board_id from table1 where board_id = 'abcd1234'")
	public String getId();

	@Select("select * from table1")
	public List<MemberVO> getList();
}