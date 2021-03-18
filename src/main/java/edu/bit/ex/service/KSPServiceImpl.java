package edu.bit.ex.service;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.KSPMapper;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class KSPServiceImpl implements KSPService {
	private KSPMapper kspMapper;

	@Override
	public MbrVO getMemberInfo(String s_id) {
		// TODO Auto-generated method stub
		return kspMapper.getMemberInfo(s_id);
	}

}