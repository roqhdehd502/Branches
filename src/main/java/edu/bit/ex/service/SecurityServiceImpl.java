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

		return loginMapper.getMbr(mbr_id);

	}

	@Override
	public void addMbr(MbrVO mbr) {
		// TODO Auto-generated method stub
		String pw = passEncoder.encode(mbr.getMbr_pw());
		log.info("encoded password >>>>>> " + pw);
		mbr.setMbr_pw(pw);

		loginMapper.addMbr(mbr);
	}

	@Override
	public boolean idChk(String mbr_id) {
		int cnt = loginMapper.idChk(mbr_id);
		if (cnt == 0) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String findID(String name, String contact) {
		// TODO Auto-generated method stub
		return loginMapper.findID(name, contact);
	}

	@Override
	public MbrVO findPW(MbrVO mbr) {
		// TODO Auto-generated method stub
		return loginMapper.findPW(mbr);
	}

	@Override
	public void setPW(MbrVO mbr) {
		// TODO Auto-generated method stub
		mbr.setMbr_pw("00000000");
		String pw = passEncoder.encode(mbr.getMbr_pw());
		mbr.setMbr_pw(pw);
		loginMapper.setPW(mbr);
	}

}