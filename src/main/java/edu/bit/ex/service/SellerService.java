package edu.bit.ex.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.CategoryVO;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.PrdctDetailVO;
import edu.bit.ex.vo.PrdctOrderVO;
import edu.bit.ex.vo.PrdctVO;
import edu.bit.ex.vo.ShippingVO;

public interface SellerService {

	public List<OrderDetailVO> getOrderDetail();

	public List<PrdctVO> getProduct();

	public List<PrdctOrderVO> getPrdOrder();

	public List<BoardVO> getBoard();

	public List<PrdctDetailVO> getPrdctDetail();

	public MbrVO getMemberInfo(String s_id);

	public ShippingVO getSellerAddress(String m_id);

	public void sellerInfoUpdate(MbrAddressVO mavo);

	public void prdctUpdate(PrdctRegisterImageVO prvo);

	public void prdctDetailUpdate(PrdctRegisterImageVO prvo);

	public MbrVO getSellerInfo(String mbr_id);

	public void prdctDelete(String prdct_id);

	public void prdInsert(PrdctRegisterImageVO PrdctImageVO);

	public PrdctVO getOption(String getPrdct_id);

	public PrdctDetailVO getPrd(String getPrdct_id);

	public void setPrdctImage(MultipartFile file);

	public ShippingVO getAddress(String getMbr_id);

	public List<BoardPrdctImageVO> getFileName(int getBoard_id);

	public List<CategoryVO> getCategory();

	public BoardPrdctImageVO getContent(int getBoard_id);

	public void prdctContentUpdate(PrdctRegisterImageVO prvo);

}