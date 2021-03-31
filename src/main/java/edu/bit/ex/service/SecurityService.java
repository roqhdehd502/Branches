package edu.bit.ex.service;

import edu.bit.ex.vo.MbrVO;

public interface SecurityService {

	public MbrVO getMbr(String mbr_id);

	public void addMbr(MbrVO mbrvo);

}