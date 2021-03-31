package edu.bit.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.LoginMapper;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	private LoginMapper loginMapper;

	@Autowired
	PasswordEncoder passEncoder;

	@Override
	public MbrVO getMbr(String mbr_id) {
		// TODO Auto-generated method stub
		MbrVO memberVO = loginMapper.getMbr(mbr_id);
		String password = memberVO.getMbr_pw();
		String encode = passEncoder.encode(password);
		log.info("encoding password : " + encode);

		memberVO.setMbr_pw(encode);

		return memberVO;

	}

	@Override
	public void addMbr(MbrVO mbrvo) {
		// TODO Auto-generated method stub
		loginMapper.addMbr(mbrvo);
	}

}