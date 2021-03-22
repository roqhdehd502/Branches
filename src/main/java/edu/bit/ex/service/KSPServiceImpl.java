package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.mapper.KSPMapper;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctVO;
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

	@Override
	public MbrVO getMemberInfoByName(String search) {
		// TODO Auto-generated method stub
		return kspMapper.getMemberInfoByName(search);
	}

	@Override
	public List<InquiryVO> getInquiry() {
		// TODO Auto-generated method stub
		return kspMapper.getInquiry();
	}

	@Override
	public List<PrdctVO> getPrdctList(String b_id) {
		// TODO Auto-generated method stub
		return kspMapper.getPrdctList(b_id);
	}

	@Override
	public List<PrdctVO> getSearchResult(String search) {
		// TODO Auto-generated method stub
		return kspMapper.getSearchResult(search);
	}

	@Override
	public List<MbrVO> getMemberList(int auth) {
		// TODO Auto-generated method stub
		return kspMapper.getMemberList(auth);
	}

}