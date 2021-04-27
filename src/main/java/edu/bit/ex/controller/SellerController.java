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
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
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

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.SearchCriteria;
import edu.bit.ex.page.SearchPageVO;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.service.SellerService;
import edu.bit.ex.vo.BoardVO;
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

	@RequestMapping(value = "imageUpload.do", method = { RequestMethod.POST, RequestMethod.GET })
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
	public ModelAndView prdct_register(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, ShippingVO svo,
			PrdctOrderDetailVO povo) {
		log.info("prdct_register...");
		mav.setViewName("seller/prdct_register");
		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 판매자 주소 불러오기
		mav.addObject("svo", sellerService.getAddress(svo.getMbr_id()));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 상품 등록
	@Transactional
	@PostMapping("/mypage/prdct")
	public ResponseEntity<String> prdct_register(PrdctRegisterImageVO prdctIVO, ModelAndView mav, MbrVO mbr) {
		ResponseEntity<String> entity = null;
		log.info("prdct_register...");
		MultipartFile[] uploadfiles = prdctIVO.getUploadfiles(); // 썸네일 파일 가져오기
		try {
			/* sellerService.prdInsert(prdctIVO); */
			sellerService.prdInsert(prdctIVO);
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
	public ModelAndView sellerProductCheck(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerProductCheck");
		log.info("sellerProductCheck..");
		mav.setViewName("seller/sellerProductCheck");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 상품 조회
		mav.addObject("bId", sellerService.getSellerPrdct(cri));

		int total = sellerService.getPrdTotal(cri);
		log.info("getTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 등록상품 수정페이지 seller // 이 페이지는 상세페이지가 곧 수정페이지입니다
	@GetMapping("/mypage/prdct/{prdct_id}")
	public ModelAndView sellerProductModify(@AuthenticationPrincipal MemberDetails memberDetails, @PathVariable("prdct_id") String prdct_id,
			ModelAndView mav, MbrVO mbr, ShippingVO svo, PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerProductModify");
		log.info("sellerProductModify..");
		mav.setViewName("seller/sellerProductModify");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 상품 정보 불러오기
		mav.addObject("pdvo", sellerService.getPrdctInfo(prdct_id));
		// 판매자 주소 불러오기
		mav.addObject("svo", sellerService.getAddress(svo.getMbr_id()));
		// 상품 내용 불러오기
		mav.addObject("bContent", sellerService.getContent(prdct_id));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 상품 수정 ajax
	/*
	 * @Transactional
	 * 
	 * @PutMapping(value = "/mypage/prdct/{prdct_id}/modify") public ResponseEntity<String> prdctUpdate(PrdctRegisterImageVO prvo) {
	 * ResponseEntity<String> entity = null;
	 * 
	 * log.info("prdct_update.."); MultipartFile[] uploadfiles = prvo.getUploadfiles(); // 썸네일 파일 가져오기
	 * 
	 * try { sellerService.updatePrdctInfo(prvo); sellerService.prdctContentUpdate(prvo); log.info("update prdct info"); entity = new
	 * ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	 * 
	 * return entity; }
	 */

	// 판매자 상품 수정 ajax
	@Transactional
	@PostMapping(value = "/mypage/prdct/modify/{prdct_id}")
	public ResponseEntity<String> prdctUpdate(PrdctRegisterImageVO prvo) {
		ResponseEntity<String> entity = null;

		log.info("prdct_update..");
		MultipartFile[] uploadfiles = prvo.getUploadfiles(); // 썸네일 파일 가져오기
		String onedeletefiles = prvo.getOnedeletefiles(); // 이미지만 삭제

		try {

			if (uploadfiles != null && onedeletefiles == null) {
				// 수정페이지에서 사진을 새로 추가할 경우 진행한다
				sellerService.setModifyAddImg(prvo);
			} else {
				// 사진을 새로 추가하지 않고 내용만 변경된 경우 진행한다
				sellerService.updatePrdctInfo(prvo);
				sellerService.prdctContentUpdate(prvo);
			}
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
	public ModelAndView sellerpage(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerpage");
		log.info("sellerpage");
		mav.setViewName("seller/sellerpage");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		mav.addObject("prdct", sellerService.getProduct());

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

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
	public ModelAndView sellerorderCheck(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerorderCheck");
		log.info("sellerorderCheck");

		mav.setViewName("seller/sellerorderCheck");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		mav.addObject("orderCheck", sellerService.OrderCheck(cri));

		int total = sellerService.OrderCheckTotal(cri);
		log.info("OrderCheckTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));
		return mav;
	}

	// 주문상세정보 수정페이지
	@GetMapping("/mypage/order/{order_number}")
	public ModelAndView orderStateModify(@AuthenticationPrincipal MemberDetails memberDetails, @PathVariable("order_number") String order_number,
			ModelAndView mav, ShippingVO svo, PrdctOrderDetailVO povo, BoardVO bvo) throws Exception {
		log.debug("orderStateModify");
		log.info("orderStateModify..");
		mav.setViewName("seller/sellerOrderModify");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 주문 정보 불러오기
		mav.addObject("info", sellerService.orderInfo(order_number));
		// 주문 상세정보 불러오기
		mav.addObject("inop", sellerService.orderOption(order_number));
		// 판매자 주소 불러오기
		mav.addObject("svo", sellerService.getAddress(svo.getMbr_id()));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 주문 상태 수정 ajax
	@Transactional
	@PutMapping(value = "/mypage/order/{order_number}/modify")
	public ResponseEntity<String> stateUpdate(@RequestBody PrdctOrderDetailVO povo) {
		ResponseEntity<String> entity = null;

		log.info("stateUpdate..");

		try {
			sellerService.updateState(povo);
			log.info("update prdct info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 판매자 발송확인 페이지...(seller)
	@GetMapping("/mypage/release")
	public ModelAndView sellerdeleCheck(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerdeleCheck");
		log.info("sellerdeleCheck");
		mav.setViewName("seller/sellerShipCheck");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// order_state_number 3,4,5처리된 정보 불러오기
		mav.addObject("shipping", sellerService.shipping(cri));

		int total = sellerService.deliveryTotal(cri);
		log.info("OrderCheckTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));
		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 취소 확인 페이지...(seller)
	@GetMapping("/mypage/cancel")
	public ModelAndView sellercancel(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellercancelCheck");
		log.info("sellercancelCheck");
		mav.setViewName("seller/sellercancelCheck");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 주문취소 정보 불러오기
		mav.addObject("cancel", sellerService.getCancel(cri));

		int total = sellerService.cancelTotal(cri);
		log.info("OrderCheckTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 환불 확인 페이지...(seller)
	@GetMapping("/mypage/refund")
	public ModelAndView sellerRefund(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerRefund");
		log.info("sellerRefund");
		mav.setViewName("seller/sellerRefund");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 환불요청 정보 불러오기
		mav.addObject("refund", sellerService.getRefund(cri));

		int total = sellerService.refundTotal(cri);
		log.info("OrderCheckTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 교환확인 페이지...(seller)
	@GetMapping("/mypage/exchange")
	public ModelAndView sellerchangeCheck(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.debug("sellerchangeCheck");
		log.info("sellerchangeCheck");
		mav.setViewName("seller/sellerchangeCheck");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 교환요청 정보 불러오기
		mav.addObject("exchange", sellerService.exchange(cri));
		// 교환 요청 사유 확인하기
		/* mav.addObject("exDetail", sellerService.exDetail()); */

		int total = sellerService.exchangeTotal(cri);
		log.info("OrderCheckTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 상품Q&A조회 페이지...(seller)
	@GetMapping("/mypage/prdctqna")
	public ModelAndView sellerQnA(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, MbrVO mbr, SearchCriteria cri,
			PrdctOrderDetailVO povo) throws Exception {
		log.info("sellerQnA");

		mav.setViewName("seller/sellerQnA");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		mav.addObject("board", sellerService.getBoard(cri));
		mav.addObject("prd", sellerService.getProduct());

		int total = sellerService.getTotal(cri);
		log.info("getTotal");
		mav.addObject("pageMaker", new SearchPageVO(cri, total));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 상품리뷰조회 페이지...(seller)
	@GetMapping("/mypage/review")
	public ModelAndView sellerReview(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, MbrVO mbr, PrdctOrderDetailVO povo)
			throws Exception {
		log.debug("sellerReview");
		log.info("sellerReview");

		mav.setViewName("seller/sellerReview");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// mav.addObject("board", sellerService.getBoard());
		mav.addObject("prd", sellerService.getProduct());

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		return mav;
	}

	// 판매자 매출조회 페이지...(seller)
	@GetMapping("/mypage/sales")
	public ModelAndView sellerSales(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, MbrVO mbr, PrdctOrderDetailVO povo)
			throws Exception {
		log.debug("sellerSales");
		log.info("sellerSales");

		mav.setViewName("seller/sellerSales");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));

		mav.addObject("week", sellerService.weekChart());
		mav.addObject("month", sellerService.monthChart());
		mav.addObject("year", sellerService.yearChart());

		return mav;
	}

	// 판매자 정보수정폼 seller
	// 로그인이 되면 member_id 받아오기
	@RequestMapping(value = "/mypage/myinfo/{mbr_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView seller_info(@PathVariable("mbr_id") String mbr_id, ModelAndView mav, PrdctOrderDetailVO povo) {
		mav.setViewName("seller/seller_mypage_modify");
		mav.addObject("mbr", sellerService.getMemberInfo(mbr_id));
		mav.addObject("adr", sellerService.getAddress(mbr_id));

		// 새주문 요청 알림
		mav.addObject("orderCount", sellerService.orderCount(povo));
		// 주문취소 알림
		mav.addObject("cancelCount", sellerService.cancelCount(povo));
		// 교환 알림
		mav.addObject("exchangeCount", sellerService.exchangeCount(povo));
		// 환불 알림
		mav.addObject("refundCount", sellerService.refundCount(povo));
		return mav;
	}

	// 판매자 정보수정 ajax
	@PutMapping(value = "/mypage/myinfo")
	public ResponseEntity<String> seller_info_modify(@RequestBody MbrShippingVO mavo) {
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