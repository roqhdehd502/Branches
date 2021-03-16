package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.vo.MemberVO;

public interface LoginService {

	public MemberVO getLogin(String board_id);

	public String getId();

	public List<MemberVO> getList();
}