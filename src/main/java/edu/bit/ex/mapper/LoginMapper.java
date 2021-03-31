package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.MbrVO;

@Mapper
public interface LoginMapper {

	public MbrVO getMbr(String m_id);

	public void addMbr(MbrVO mbrvo);

}
