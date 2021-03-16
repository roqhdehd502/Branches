package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.LoginMapper;
import edu.bit.ex.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class LoginServiceImpl implements LoginService {
	private LoginMapper loginMapper;

	@Override
	public MemberVO getLogin(String board_id) {
		log.info("getLogin()");
		return loginMapper.read(board_id);
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		log.info("getList");
		return loginMapper.getId();
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return loginMapper.getList();
	}
}