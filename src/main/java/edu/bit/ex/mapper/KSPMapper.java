package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.bit.ex.vo.MbrVO;

@Mapper
public interface KSPMapper {

	@Select("select * from mbr where mbr_id=#{m_id}")
	public MbrVO getMemberInfo(String s_id);
}