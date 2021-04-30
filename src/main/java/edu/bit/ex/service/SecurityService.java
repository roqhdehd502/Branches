package edu.bit.ex.service;

import edu.bit.ex.vo.MbrVO;

public interface SecurityService {

	public MbrVO getMbr(String mbr_id);

	// 일반 회원 회원가입
	public void addMbr(MbrVO mbr);

	// ID 중복 체크
	public boolean idChk(String mbr_id);

	public String findID(String name, String contact);

	public MbrVO findPW(MbrVO mbr);

	public void setPW(MbrVO mbr);

}