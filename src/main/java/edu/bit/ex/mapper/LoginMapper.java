package edu.bit.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import edu.bit.ex.vo.MbrVO;

@Mapper
public interface LoginMapper {

	public MbrVO getMbr(String m_id);

	// 일반 회원 회원가입
	public void addMbr(MbrVO mbr);

	// 소셜 회원 회원가입
	public void addSocialMbr(MbrVO mbr);

	// ID 중복 체크
	public int idChk(String mbr_id);

	public String findID(String name, int contact);

	public MbrVO findPW(MbrVO mbr);

	public void setPW(MbrVO mbr);

}
