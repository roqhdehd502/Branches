package edu.bit.ex.service;

import javax.servlet.http.HttpServletResponse;

import edu.bit.ex.vo.MbrVO;

public interface SecurityService {

	public MbrVO getMbr(String mbr_id);

	// 일반 회원 회원가입
	public void addMbr(MbrVO mbr);

	// ID 중복 체크
	public boolean idChk(String mbr_id);

	public String findID(String name, int contact);

	public String findPW(MbrVO mbr);

	public void sendEmail(HttpServletResponse response, MbrVO mbr);
}