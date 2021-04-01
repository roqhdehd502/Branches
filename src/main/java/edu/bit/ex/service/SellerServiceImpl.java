package edu.bit.ex.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.mapper.SellerMapper;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class SellerServiceImpl implements SellerService {
	private SellerMapper sellerMapper;

	@Override
	public List<OrderDetailVO> getOrderDetail() {
		log.info("getOrderDetail......");
		return sellerMapper.getOrderDetail();
	}

	@Override
	public List<PrdctVO> getProduct() {
		log.info("getProduct......");
		return sellerMapper.getProduct();
	}

	@Override
	public List<PrdctOrderVO> getPrdOrder() {
		log.info("getPrdOrder......");
		return sellerMapper.getPrdOrder();
	}

	@Override
	public List<BoardVO> getBoard() {
		log.info("getBoard......");
		return sellerMapper.getBoard();
	}

	@Override
	public MbrVO getMemberInfo(String s_id) {
		// TODO Auto-generated method stub
		return sellerMapper.getMemberInfo(s_id);
	}

	@Override
	public ShippingVO getSellerAddress(String m_id) {
		// TODO Auto-generated method stub
		return sellerMapper.getSellerAddress(m_id);
	}

	@Override
	public void sellerInfoUpdate(MbrAddressVO mavo) {
		// TODO Auto-generated method stub
		log.info("sellerInfoUpdate()......");
		sellerMapper.sellerInfoUpdate(mavo);
		sellerMapper.sellerAddressUpdate(mavo);

	}

	@Override
	public void prdctUpdate(PrdctVO pvo) {
		log.info("prdctUpdate()......");
		sellerMapper.prdctUpdate(pvo);

	}

	@Override
	public void prdInsert(PrdctRegisterImageVO PrdctImageVO) {
		log.info("prdInsert()......");
		sellerMapper.prdInsert(PrdctImageVO);
	}

	@Override
	public List<PrdctDetailVO> getPrdctDetail() {
		log.info("getPrdctDetail()......");
		return sellerMapper.getPrdctDetail();
	}

	@Override
	public MbrVO getSellerInfo(String mbr_id) {
		log.info("getSellerInfo()......");
		return sellerMapper.getSellerInfo(mbr_id);
	}

	@Override
	public void prdctDelete(String prdct_id) {
		log.info("prdctDelete()......");
		sellerMapper.prdctDelete(prdct_id);

	}

	@Override
	public PrdctVO getOption(String getPrdct_id) {
		log.info("getOption()......");
		return sellerMapper.getOption(getPrdct_id);
	}

	@Override
	public PrdctDetailVO getPrd(String getPrdct_id) {
		log.info("getPrd()......");
		return sellerMapper.getPrd(getPrdct_id);
	}

	@Override
	public void setPrdctImage(MultipartFile file) {
		// 파일 이름 변경(중복방지)
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		log.info("image_name: ", saveName);

		// 저장할 File 객체를 생성(껍데기 파일)
		// 저장할 폴더 이름, 저장할 파일 이름
		File saveFile = new File("C:/tetleaf/Branches/src/main/resources/static/hs/", saveName);

		try {
			// 업로드 파일에 saveFile이라는 껍데기 입힘
			file.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		sellerMapper.setPrdctImage(saveName);

	}

	@Override
	public ShippingVO getAddress(String getMbr_id) {
		log.info("getAddress()......");
		return sellerMapper.getAddress(getMbr_id);
	}

	@Override
	public List<BoardVO> getBoardId(int board_id) {
		log.info("getBoardId()......");
		return sellerMapper.getBoardId(board_id);
	}

}