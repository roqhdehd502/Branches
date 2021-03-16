package edu.bit.ex.service;

import edu.bit.ex.vo.MemberVO;

public interface LoginService {

	public MemberVO getLogin(String board_id);
}