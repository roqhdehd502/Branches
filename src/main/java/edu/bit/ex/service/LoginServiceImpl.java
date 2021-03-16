package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.LoginMapper;
import edu.bit.ex.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	private LoginMapper loginMapper;

	@Override
	public MemberVO getLogin(String board_id) {
		log.info("getLogin()");
		return loginMapper.read(board_id);
	}
}