package edu.bit.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.joinvo.BoardPrdctImageVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.service.SellerService;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.ShippingVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/seller/*")
public class SellerController {
	@Autowired
	private SellerService sellerService;

	@Autowired
	private SecurityService securityService;

	// CK 에디터 이미지 서버 전송 컨트롤러
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SellerController.class);

	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath = "C:\\tetleaf\\Branches\\src\\main\\resources\\static\\hs\\";
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버로 업로드
		out.write(bytes);
		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");

		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();

		String fileUrl = request.getContextPath() + "/hs/" + fileName;

		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>");
		printWriter.flush();
	}

	// 상품 등록페이지 seller
	@GetMapping("/mypage/prdct_register")
	public ModelAndView prdct_register(ModelAndView mav, MbrVO mbr, ShippingVO svo) {
		log.info("prdct_register...");
		mav.setViewName("seller/prdct_register");
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));
		mav.addObject("svo", sellerService.getAddress(svo.getMbr_id()));
		mav.addObject("cate", sellerService.getCategory());
		return mav;
	}

	// 상품 등록
	@Transactional
	@PostMapping("/mypage/prdct")
	public ResponseEntity<String> prdct_register(ModelAndView mav, MbrVO mbr, PrdctRegisterImageVO prdctIVO) {
		ResponseEntity<String> entity = null;
		log.info("prdct_register...");
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		MultipartFile[] uploadfiles = prdctIVO.getUploadfiles();

		try {
			sellerService.prdInsert(prdctIVO);
			; // 텍스트 등록(1). 우선 텍스트 부분을 선행으로 한다.

			for (MultipartFile f : uploadfiles) {

				sellerService.setPrdctImage(f); // 이미지 등록(N). 텍스트 부분이 선행되면 이미지를 올린다.
			}

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 판매자 상품 조회 seller
	// 수정 버튼 옮길것! => SellerProductModify
	@GetMapping("/mypage/prdct")
	public ModelAndView sellerProductCheck(ModelAndView mav, MbrVO mbr, BoardPrdctImageVO bpvo) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");
		mav.setViewName("seller/sellerProductCheck");
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));
		mav.addObject("filename", sellerService.getFileName(bpvo.getBoard_id()));

		return mav;
	}

	// 판매자 등록상품 수정페이지 seller // 이 페이지는 상세페이지가 곧 수정페이지입니다
	@GetMapping("/mypage/prdct/{prdct_id}/{board_id}")
	public ModelAndView sellerProductModify(@PathVariable("prdct_id") String prdct_id, @PathVariable("board_id") int board_id, ModelAndView mav,
			MbrVO mbr, ShippingVO svo, BoardPrdctImageVO bpvo) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");
		mav.setViewName("seller/sellerProductModify");
		mav.addObject("pvo", sellerService.getPrd(prdct_id));
		mav.addObject("pdvo", sellerService.getOption(prdct_id));
		mav.addObject("svo", sellerService.getAddress(svo.getMbr_id()));
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));
		mav.addObject("cate", sellerService.getCategory());
		mav.addObject("bvo", sellerService.getContent(bpvo.getBoard_id()));
		mav.addObject("filename", sellerService.getFileName(bpvo.getBoard_id()));

		return mav;
	}

	// 판매자 상품 수정 ajax
	@PutMapping(value = "/mypage/prdct/{prdct_id}/modify")
	public ResponseEntity<String> prdctUpdate(@RequestBody PrdctRegisterImageVO prvo) {
		ResponseEntity<String> entity = null;

		log.info("prdct_update..");
		try {

			sellerService.prdctUpdate(prvo);
			sellerService.prdctDetailUpdate(prvo);
			sellerService.prdctContentUpdate(prvo);
			log.info("update prdct info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 판매자 상품 삭제 ajax
	@DeleteMapping(value = "/mypage/prdct/{prdct_id}/delete")
	public ResponseEntity<String> prdctDelete(@PathVariable("prdct_id") String prdct_id) {
		ResponseEntity<String> entity = null;

		log.info("prdctDelete..");
		try {

			sellerService.prdctDelete(prdct_id);
			log.info("delete prdct info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 판매자 마이페이지...(seller)
	@GetMapping("/mypage")
	public ModelAndView sellerpage(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		mav.setViewName("seller/sellerpage");
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("pdd", sellerService.getPrdctDetail());
		mav.addObject("prdor", sellerService.getPrdOrder());

		return mav;
	}

	// 회원 정보수정폼 customer
	// 스프링 시큐리티 적용 중
	/*
	 * @RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET }) public ModelAndView
	 * login_member_info(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) { mav.setViewName("member/member_mypage_modify");
	 * mav.addObject("mbr", securityService.getMbr(memberDetails.getUserID())); return mav; }
	 */

	// 판매자 주문확인 페이지...(seller)
	@GetMapping("/mypage/order")
	public ModelAndView sellerorderCheck(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");

		mav.setViewName("seller/sellerorderCheck");
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("prdor", sellerService.getPrdOrder());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));
		return mav;
	}

	// 판매자 발송확인 페이지...(seller)
	@GetMapping("/mypage/release")
	public ModelAndView sellerdeleCheck(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		mav.setViewName("seller/sellerdeleCheck");
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("prdor", sellerService.getPrdOrder());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 취소 확인 페이지...(seller)
	@GetMapping("/mypage/cancel")
	public ModelAndView sellercancelCheck(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		mav.setViewName("seller/sellercancelCheck");
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 환불 확인 페이지...(seller)
	@GetMapping("/mypage/refund")
	public ModelAndView sellerRefund(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerRefund");
		log.info("sellerRefund");
		mav.setViewName("seller/sellerRefund");
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("prdor", sellerService.getPrdOrder());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 교환확인 페이지...(seller)
	@GetMapping("/mypage/exchange")
	public ModelAndView sellerchangeCheck(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		mav.setViewName("seller/sellerchangeCheck");
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("ord", sellerService.getOrderDetail());
		mav.addObject("prdor", sellerService.getPrdOrder());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 상품Q&A조회 페이지...(seller)
	@GetMapping("/mypage/prdctqna")
	public ModelAndView sellerQnA(ModelAndView mav, MbrVO mbr) throws Exception {
		log.info("sellerQnA");

		mav.setViewName("seller/sellerQnA");
		mav.addObject("board", sellerService.getBoard());
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 상품리뷰조회 페이지...(seller)
	@GetMapping("/mypage/review")
	public ModelAndView sellerReview(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");

		mav.setViewName("seller/sellerReview");
		mav.addObject("board", sellerService.getBoard());
		mav.addObject("prd", sellerService.getProduct());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 매출조회 페이지...(seller)
	@GetMapping("/mypage/sales")
	public ModelAndView sellerSales(ModelAndView mav, MbrVO mbr) throws Exception {
		log.debug("sellerSales");
		log.info("sellerSales");

		mav.setViewName("seller/sellerSales");
		mav.addObject("prdct", sellerService.getProduct());
		mav.addObject("prdOrder", sellerService.getPrdOrder());
		mav.addObject("mbr", sellerService.getSellerInfo(mbr.getMbr_id()));

		return mav;
	}

	// 판매자 정보수정폼 seller
	// 로그인이 되면 member_id 받아오기
	@RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView seller_info(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("seller/seller_mypage_modify");
		mav.addObject("mbr", sellerService.getMemberInfo(m_id));
		mav.addObject("adr", sellerService.getSellerAddress(m_id));
		return mav;
	}

	// 판매자 정보수정 ajax
	@PutMapping(value = "/mypage/myinfo")
	public ResponseEntity<String> seller_info_modify(@RequestBody MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			sellerService.sellerInfoUpdate(mavo);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}