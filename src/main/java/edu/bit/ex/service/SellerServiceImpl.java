package edu.bit.ex.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.mapper.SellerMapper;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
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
	public List<PrdctRegisterImageVO> getProduct() {
		log.info("getProduct......");
		return sellerMapper.getProduct();
	}

	@Override
	public List<PrdctOrderVO> getPrdOrder() {
		log.info("getPrdOrder......");
		return sellerMapper.getPrdOrder();
	}

	@Override
	public List<BoardVO> getBoard(SearchCriteria cri) {
		log.info("getBoard......");
		return sellerMapper.getBoard(cri);
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
	public void sellerInfoUpdate(MbrShippingVO mavo) {
		// TODO Auto-generated method stub
		log.info("sellerInfoUpdate()......");
		sellerMapper.sellerInfoUpdate(mavo);
		sellerMapper.sellerAddressUpdate(mavo);

	}

	@Override
	public void prdctUpdate(PrdctRegisterImageVO prvo) {
		log.info("prdctUpdate()......");
		sellerMapper.prdctUpdate(prvo);

	}

	@Override
	public void prdInsert(PrdctRegisterImageVO PrdctImageVO) {
		log.info("prdInsert()......");
		sellerMapper.prdInsert(PrdctImageVO);
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

	/*
	 * @Override public void setPrdctImage(MultipartFile file) { // 파일 이름 변경(중복방지) UUID uuid = UUID.randomUUID(); String saveName = uuid + "_" +
	 * file.getOriginalFilename(); log.info("image_name: ", saveName);
	 * 
	 * // 저장할 File 객체를 생성(껍데기 파일) // 저장할 폴더 이름, 저장할 파일 이름 File saveFile = new File("C:\\tetleaf\\Branches\\src\\main\\resources\\static\\hs",
	 * saveName);
	 * 
	 * try { // 업로드 파일에 saveFile이라는 껍데기 입힘 file.transferTo(saveFile); } catch (IOException e) { e.printStackTrace(); }
	 * 
	 * sellerMapper.setPrdctImage(saveName);
	 * 
	 * }
	 */

	@Override
	public ShippingVO getAddress(String getMbr_id) {
		log.info("getAddress()......");
		return sellerMapper.getAddress(getMbr_id);
	}

	@Override
	public List<BoardPrdctImageVO> getFileName(int getBoard_id) {
		log.info("getFileName()......");
		return sellerMapper.getFileName(getBoard_id);
	}

	@Override
	public List<CategoryVO> getCategory() {
		log.info("getCategory()......");
		return sellerMapper.getCategory();
	}

	@Override
	public BoardVO getContent(String getPrdct_id) {
		log.info("getContent()......");
		return sellerMapper.getContent(getPrdct_id);
	}

	@Override
	public void prdctContentUpdate(PrdctRegisterImageVO prvo) {
		log.info("prdctContentUpdate()......");
		sellerMapper.prdctContentUpdate(prvo);

	}

	@Override
	public List<BoardVO> getbNum(int board_id) {
		log.info("getbId()......");
		return sellerMapper.getbNum(board_id);
	}

	@Override
	public BoardVO getboardId(int board_id) {
		log.info("getboardId()......");
		return sellerMapper.getboardId(board_id);
	}

	@Override
	public int getTotal(SearchCriteria cri) {
		log.info("getTotal()......");
		return sellerMapper.getTotal(cri);
	}

	@Override
	public int getTotal1(SearchCriteria cri) {
		log.info("getTotal1()......");
		return sellerMapper.getTotal1(cri);
	}

}