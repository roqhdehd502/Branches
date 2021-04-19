package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.MbrVO;

@Mapper
public interface TestAdminMapper {
	// 어드민 권한 가진 멤버 리스트 불러오기
	@Select("SELECT * FROM mbr WHERE authority_number = 1")
	public List<MbrVO> getAdminList();
}