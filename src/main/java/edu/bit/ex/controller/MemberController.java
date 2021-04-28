package edu.bit.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.controller.validator.MemberValidator;
import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.InquiryBoardVO;
import edu.bit.ex.page.MemberOrderCriteria;
import edu.bit.ex.page.MemberOrderPageVO;
import edu.bit.ex.page.MemberRecentlyCriteria;
import edu.bit.ex.page.MemberRecentlyPageVO;
import edu.bit.ex.page.MyqnaCriteria;
import edu.bit.ex.page.MyqnaPageVO;
import edu.bit.ex.page.PrdQnACriteria;
import edu.bit.ex.page.PrdQnAPageVO;
import edu.bit.ex.service.MemberService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.InquiryVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	// private CustomerService customerService;

	private SecurityService securityService;

	private MemberValidator memberValidator;

	private MemberService memberService;

	// CK 에디터 이미지 서버 전송 컨트롤러
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/member")
	public ModelAndView signUpForm(ModelAndView mav) {
		mav.setViewName("login/login");

		return mav;
	}

	// 상품 Q&A 등록 페이지
	@GetMapping("/prdct/{prdct_id}/qna/write")
	public ModelAndView productQnARegister(@PathVariable("prdct_id") String prdct_id, @AuthenticationPrincipal MemberDetails memberDetails,
			ModelAndView mav) throws Exception {
		log.info("productQnARegister..");
		mav.setViewName("member/productQnARegister");
		// 상품 Q&A 등록 페이지 회원id정보
		mav.addObject("prdctQnaInfo", securityService.getMbr(memberDetails.getUserID()));
		mav.addObject("prdctInfo", memberService.prdctInfo(prdct_id));

		return mav;
	}

	// 상품 Q&A 작성
	@Transactional(rollbackFor = Exception.class)
	@RequestMapping(value = "prdct/{prdct_id}/qna/writing", method = { RequestMethod.GET, RequestMethod.POST })
	public RedirectView prdctQnaWriting(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("prdctQnaWriting");
		log.info("prdctQnaWriting..");

		// 리뷰 등록
		memberService.setPrdctQnaWrite(boardVO);

		return new RedirectView("/member/mypage/prdctq/list");
	}

	/* 상품 Qna image 등록 */
	@PostMapping("/prdct/qna/prdct_img")
	public void prdctQnaImgUpdate(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath = "C:\\Users\\eunji\\Desktop\\branches\\Branches\\src\\main\\resources\\static\\prdct_img\\";
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버로 업로드
		out.write(bytes);
		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");

		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();

		String fileUrl = request.getContextPath() + "/prdct_img/" + fileName;

		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>");
		printWriter.flush();
	}

	// 페이징을 이용한 상품 Q&A 마이페이지 리스트 - 누르면 member_myprdctq 연결
	@GetMapping("/mypage/prdctq/list")
	public ModelAndView prdctQnAList(@AuthenticationPrincipal MemberDetails memberDetails, PrdQnACriteria cri, BoardBoardCommentVO bCommentVO,
			ModelAndView mav, InquiryBoardVO iBoardVO) throws Exception {
		log.debug("prdctQnAList");
		log.info("prdctQnAList..");
		mav.setViewName("member/member_myprdctq_list");

		// 인증된 회원 정보 받아오기
		String member_id = memberDetails.getUserID();
		mav.addObject("mbr", securityService.getMbr(member_id));
		// 작성한 상품 QNA 리스트 받아오기
		mav.addObject("prdctq_my_list", memberService.getPrdctqMyList(cri, member_id));
		// 작성한 상품 Q&A 응답여부 받아오기
		mav.addObject("prdctq_cmnt_stat", memberService.getPrdctqCmntStat(bCommentVO.getBoard_id()));
		// 답변한 댓글 불러오기
		mav.addObject("comment", memberService.getMyqComment(iBoardVO.getBoard_id()));

		int total = memberService.getPrdctqTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PrdQnAPageVO(cri, total));

		return mav;
	}

	// 회원 마이페이지...(custom)
	@GetMapping("/mypage")
	public ModelAndView mypage(@AuthenticationPrincipal MemberDetails memberDetails, HttpServletRequest request, HttpSession session,
			ModelAndView mav, MbrVO mbrVO) throws Exception {
		log.info("mypage.......");
		mav.setViewName("member/mypage");
		// mav.addObject("member", hsService.getMember());

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 주문내역 리스트 가져오기
		mav.addObject("order_list", memberService.getOrderMyList(getMbr.getMbr_id()));

		// 최근 본 상품 리스트 가져오기
		mav.addObject("view_list", memberService.getPrdctViewList(getMbr.getMbr_id()));

		// 찜했던 상품 리스트 받아오기
		mav.addObject("like_prdct_list", memberService.getLikePrdctList(getMbr.getMbr_id()));

		return mav;
	}

	// 페이징을 이용한 고객 QnA 마이페이지 리스트
	@GetMapping("/mypage/myqna/list")
	public ModelAndView myqnaList(@AuthenticationPrincipal MemberDetails memberDetails, MyqnaCriteria cri, BoardBoardCommentVO bCommentVO,
			ModelAndView mav) {
		log.info("myqnaList...");
		mav.setViewName("member/member_myq_list");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 작성한 고객 Q&A 리스트 받아오기
		mav.addObject("myq_list", memberService.getMyqList(cri, memberDetails.getUserID()));
		// 작성한 고객 Q&A 응답여부 받아오기
		mav.addObject("myq_cmnt_stat", memberService.getMyqCmntStat(bCommentVO.getBoard_id()));

		int total = memberService.getMyqnaTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MyqnaPageVO(cri, total));

		return mav;
	}

	// 고객 QnA 작성페이지
	@GetMapping("/mypage/myqna/write")
	public ModelAndView myqnaWriteView(@AuthenticationPrincipal MemberDetails memberDetails, InquiryVO inquiryVO, ModelAndView mav) {
		log.info("myqnaWriteView...");

		mav.setViewName("member/member_question");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 문의 유형 받아오기
		mav.addObject("inquiry", memberService.getMyqInquiry());

		return mav;
	}

	// 고객 QnA 작성
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mypage/myqna/write")
	public ResponseEntity<String> myqnaWriting(@RequestBody BoardVO boardVO) {
		ResponseEntity<String> entity = null;

		log.info("myqnaWriting...");
		try {
			memberService.setmyqnaWriting(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 고객 QnA 상세페이지
	@GetMapping("/mypage/myqna/{board_id}")
	public ModelAndView myqnaContentView(@AuthenticationPrincipal MemberDetails memberDetails, InquiryBoardVO iBoardVO, ModelAndView mav) {
		log.info("myqnaContentView...");
		mav.setViewName("member/member_myq");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 문의 유형 및 게시글 정보 받아오기
		mav.addObject("iBoard", memberService.getMyqContent(iBoardVO.getBoard_id()));
		// 관리자가 작성한 댓글 리스트 받아오기
		mav.addObject("comment", memberService.getMyqComment(iBoardVO.getBoard_id()));

		return mav;
	}

	// 고객 QnA 수정페이지
	@GetMapping("/mypage/myqna/modify/{board_id}")
	public ModelAndView myqnaModifyView(@AuthenticationPrincipal MemberDetails memberDetails, InquiryBoardVO iBoardVO, ModelAndView mav) {
		log.info("myqnaModifyView...");
		mav.setViewName("member/member_myq_modify");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 문의 유형 및 게시글 정보 받아오기
		mav.addObject("iBoard", memberService.getMyqContent(iBoardVO.getBoard_id()));

		return mav;
	}

	// 고객 QnA 수정
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mypage/myqna/modify/{board_id}")
	public ResponseEntity<String> myqnaModify(@RequestBody BoardVO boardVO) {
		ResponseEntity<String> entity = null;

		log.info("myqnaModify...");
		try {
			memberService.setmyqnaModify(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 고객 QnA 삭제
	@Transactional(rollbackFor = Exception.class)
	@DeleteMapping("/mypage/myqna/modify/{board_id}")
	public ResponseEntity<String> myqnaDelete(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		log.info("myqnaDelete...");

		try {
			memberService.myqnaRemove(boardVO.getBoard_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 찜하기 목록 페이지
	@GetMapping("/mypage/like")
	public ModelAndView likeProduct(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("like");
		log.info("like..");
		// mav.setViewName("customer/likeProduct");
		mav.setViewName("member/likeProduct");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);
		// 찜했던 상품 리스트 받아오기
		mav.addObject("like_prdct_list", memberService.getLikePrdctList(getMbr.getMbr_id()));
		return mav;
	}

	// 최근본상품
	@GetMapping("/mypage/recently")
	public ModelAndView recentlyProduct(@AuthenticationPrincipal MemberDetails memberDetails, MemberRecentlyCriteria cri, ModelAndView mav)
			throws Exception {
		log.debug("recently");
		log.info("recently..");
		mav.setViewName("member/recentlyProduct");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 최근 본 상품 리스트 가져오기
		// mav.addObject("view_list", memberService.getPrdctViewList(getMbr.getMbr_id()));
		mav.addObject("view_list", memberService.getPrdctViewList(getMbr.getMbr_id(), cri));

		int total = memberService.getPrdctViewTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MemberRecentlyPageVO(cri, total));

		return mav;
	}

	// 상품 리뷰 등록 페이지
	@GetMapping("/mypage/review/{prdct_id}/write")
	public ModelAndView reviewRegister(@PathVariable("prdct_id") String prdct_id, @AuthenticationPrincipal MemberDetails memberDetails,
			ModelAndView mav) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		mav.setViewName("member/reviewRegister");
		// 리뷰 등록페이지 회원id정보
		mav.addObject("customerInfo", securityService.getMbr(memberDetails.getUserID()));
		mav.addObject("prdctInfo", memberService.prdctInfo(prdct_id));

		return mav;
	}

	// 상품 리뷰 작성
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mypage/review/{prdct_id}/writing")
	public RedirectView reviewWriting(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav, BoardVO boardVO) throws Exception {
		log.debug("reviewRegister");
		log.info("reviewRegister..");

		// 리뷰 등록
		memberService.setReviewWrite(boardVO);

		return new RedirectView("/member/mypage/review/list");
	}

	/* 상품 리뷰 image 등록 */
	@PostMapping("/mypage/review/writing/prdct_img")
	public void reviewImgUpdate(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath = "C:\\Users\\eunji\\Desktop\\branches\\Branches\\src\\main\\resources\\static\\prdct_img\\";
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버로 업로드
		out.write(bytes);
		// 클라이언트에 결과 표시
		String callback = request.getParameter("CKEditorFuncNum");

		// 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
		PrintWriter printWriter = response.getWriter();

		String fileUrl = request.getContextPath() + "/prdct_img/" + fileName;

		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>");
		printWriter.flush();
	}

	// 상품 리뷰 마이페이지 리스트 -누르면 member_myreview 연결
	@GetMapping("/mypage/review/list")
	public ModelAndView reviewList(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) throws Exception {
		log.debug("reviewList");
		log.info("reviewList..");

		String member_id = memberDetails.getUserID();
		mav.setViewName("member/member_myreview_list");
		mav.addObject("mbr", securityService.getMbr(member_id));
		mav.addObject("reviewMyList", memberService.getReviewMyList(member_id));

		return mav;
	}

	// 회원 주문내역 조회페이지...(custom)
	@GetMapping("/mypage/order")
	public ModelAndView myOrderList(@AuthenticationPrincipal MemberDetails memberDetails, MemberOrderCriteria cri, ModelAndView mav)
			throws Exception {
		log.debug("myOrderList");
		log.info("myOrderList");
		mav.setViewName("member/myOrderList");

		// 인증 회원 정보
		MbrVO getMbr = securityService.getMbr(memberDetails.getUserID());
		// 회원 정보 받아오기
		mav.addObject("mbr", getMbr);

		// 주문내역 리스트 가져오기
		/* mav.addObject("order_list", memberService.getOrderMyList(getMbr.getMbr_id())); */
		mav.addObject("order_list", memberService.getOrderMyList(getMbr.getMbr_id(), cri));

		int total = memberService.getOrderMyTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new MemberOrderPageVO(cri, total));

		return mav;
	}
	// 회원 브랜드 조회페이지...(custom)
	/*
	 * @GetMapping("/brandList") public String brandList(Model model, SearchCriteria cri) throws Exception { log.debug("brandList");
	 * log.info("brandList"); model.addAttribute("mem", customerService.getMemberList(cri));
	 * 
	 * int total = customerService.getTotal(cri); log.info("total.........."); model.addAttribute("pageMaker", new SearchPageVO(cri, total));
	 * 
	 * return "brandList"; }
	 */

	// 회원 정보수정폼 customer
	// 스프링 시큐리티때 member_id 가져오기
	// @RequestMapping(value = "/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	// public ModelAndView member_info(@PathVariable("member_id") String m_id, ModelAndView mav) {
	// mav.setViewName("customer/member_mypage_modify");
	// // mav.addObject("mbr", customerService.getMemberInfo(m_id));
	// return mav;
	// }

	// 회원 정보수정폼 customer
	// 스프링 시큐리티 적용 중
	@GetMapping("/mypage/myinfo")
	public ModelAndView login_member_info(@AuthenticationPrincipal MemberDetails memberDetails, ModelAndView mav) {
		mav.setViewName("member/member_mypage_modify");
		mav.addObject("mbr", securityService.getMbr(memberDetails.getUserID()));

		return mav;
	}

	// 회원정보수정 ajax customer
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mypage/myinfo")
	public ResponseEntity<String> member_info_modify(@RequestBody MbrVO mbrvo) {
		ResponseEntity<String> entity = null;
		log.info("rest_update..");
		try {
			memberService.memberInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}