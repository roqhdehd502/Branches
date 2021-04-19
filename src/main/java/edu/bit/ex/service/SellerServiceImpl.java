package edu.bit.ex.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	// 매거진 썸네일 저장 경로
	private static final String PRDCT_THUMBNAIL_PATH = "C:/tetleaf/Branches/src/main/resources/static/hs";

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

	/*
	 * @Override public void prdInsert(PrdctRegisterImageVO PrdctImageVO) { log.info("prdInsert()......"); sellerMapper.prdInsert(PrdctImageVO); }
	 */

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

	// 상품 썸네일 등록
	@Override
	public void prdInsert(PrdctRegisterImageVO pvo) {
		// 파일 이름 변경(중복방지)
		MultipartFile[] uploadfiles = pvo.getUploadfiles();

		// 이미지 파일만 업로드 가능
		if (uploadfiles[0].getContentType().startsWith("image") == false) {
			log.warn("this file is not image type: " + uploadfiles[0]);
			return;
		}

		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + uploadfiles[0].getOriginalFilename();
		log.info("image_name: ", saveName);

		// 저장할 File 객체를 생성(껍데기 파일)
		// 저장할 폴더 이름, 저장할 파일 이름
		File saveFile = new File(PRDCT_THUMBNAIL_PATH, saveName);

		try {
			// 업로드 파일에 saveFile이라는 껍데기 입힘
			uploadfiles[0].transferTo(saveFile);
			pvo.setPrdct_thumbnail(saveName);
			log.info("board_thumbnail: " + pvo.getPrdct_thumbnail());
		} catch (IOException e) {
			e.printStackTrace();
		}

		sellerMapper.prdInsert(pvo);
		/* sellerMapper.prdInsert(pvo); */
	}

	@Override
	public ShippingVO getAddress(String getMbr_id) {
		log.info("getAddress()......");
		return sellerMapper.getAddress(getMbr_id);
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
	public List<PrdctRegisterImageVO> getbNumDesc(SearchCriteria cri) {
		log.info("getbId()......");
		return sellerMapper.getbNumDesc(cri);
	}

	@Override
	public int getTotal(SearchCriteria cri) {
		log.info("getTotal()......");
		return sellerMapper.getTotal(cri);
	}

	@Override
	public int getPrdTotal(SearchCriteria cri) {
		log.info("getPrdTotal()......");
		return sellerMapper.getPrdTotal(cri);
	}

	@Override
	public void sellerInfoUpdate(MbrShippingVO mavo) {
		log.info("sellerInfoUpdate()......");
		sellerMapper.sellerInfoUpdate(mavo);

	}

	@Override
	public PrdctVO getPrdctInfo(String prdct_id) {
		// TODO Auto-generated method stub
		return sellerMapper.getPrdctInfo(prdct_id);
	}

	@Override
	public void updatePrdctInfo(PrdctRegisterImageVO prvo) {
		// TODO Auto-generated method stub
		sellerMapper.updatePrdctInfo(prvo);
	}

	// 매거진 수정페이지 썸네일까지 변경
	@Override
	public void setMagazineModifyAddImg(PrdctRegisterImageVO prvo) {
		log.info("setMagazineModifyAddImg");

		MultipartFile[] uploadfiles = prvo.getUploadfiles();

		// 이미지 파일만 업로드 가능
		if (uploadfiles[0].getContentType().startsWith("image") == false) {
			log.warn("this file is not image type: " + uploadfiles[0]);
			return;
		}

		// 파일 이름 변경(중복방지)
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + uploadfiles[0].getOriginalFilename();
		log.info("image_name: " + saveName);

		// 저장할 File 객체를 생성(껍데기 파일)
		// 저장할 폴더 이름, 저장할 파일 이름
		File saveFile = new File(PRDCT_THUMBNAIL_PATH, saveName);

		try {
			// 업로드 파일에 saveFile 입힘
			uploadfiles[0].transferTo(saveFile);
			// 썸네일 파일명 지정
			prvo.setPrdct_thumbnail(saveName);
			log.info("prdct_thumbnail: " + prvo.getPrdct_thumbnail());
		} catch (IOException e) {
			e.printStackTrace();
		}

		sellerMapper.setMagazineModifyAddImg(prvo);
	}

	// 이미지만 삭제할 경우 진행한다
	@Override
	public void magazineImageOnlyRemove(PrdctRegisterImageVO prvo) {
		String image_name = prvo.getOnedeletefiles();
		log.info("image_name: " + image_name);

		// 삭제할 File 객체를 생성(껍데기 파일)
		// 삭제할 폴더 이름, 삭제할 파일 이름
		File deleteFile = new File(PRDCT_THUMBNAIL_PATH, image_name);

		// 해당 파일이 존재하면 삭제
		if (deleteFile.exists() == true) {
			deleteFile.delete();
		}
		sellerMapper.magazineImageOnlyRemove(prvo.getPrdct_id(), image_name);
	}
}