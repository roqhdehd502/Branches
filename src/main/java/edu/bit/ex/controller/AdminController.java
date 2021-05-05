package edu.bit.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.config.auth.MemberDetails;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.MemberPageVO;
import edu.bit.ex.page.PrdctListCriteria;
import edu.bit.ex.page.PrdctListPageVO;
import edu.bit.ex.page.UserQnACriteria;
import edu.bit.ex.page.UserQnAPageVO;
import edu.bit.ex.service.AdminService;
import edu.bit.ex.service.SecurityService;
import edu.bit.ex.vo.BoardCommentVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private SecurityService securityService;

	// 관리자 마이페이지...(admin)
	@GetMapping("/mypage")
	public ModelAndView adminpage(ModelAndView mav) throws Exception {
		log.debug("adminpage");
		log.info("adminpage");
		mav.setViewName("admin/adminpage");
		return mav;
	}

	// 관리자 판매자 등록
	@GetMapping("/mypage/regist/seller")
	public ModelAndView regist_Seller(ModelAndView mav) throws Exception {
		log.info("regist seller page........");

		mav.setViewName("admin/seller_register");

		return mav;
	}

	@GetMapping("/mypage/regist/seller/idCheck")
	public ResponseEntity<String> idCheck(@RequestParam("id") String id) {
		ResponseEntity<String> entity = null;

		if (securityService.idChk(id)) {
			entity = new ResponseEntity<String>("이미 존재하는 ID입니다", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("사용가능한 ID입니다", HttpStatus.OK);
		}

		return entity;
	}

	@PostMapping("/mypage/regist/seller")
	public ModelAndView registing_Seller(@ModelAttribute MbrShippingVO mbrShippingVO, ModelAndView mav) throws Exception {
		log.info("registing seller page........");

		ResponseEntity<String> entity = null;
		mbrShippingVO.setMbr_nickname(mbrShippingVO.getMbr_name());
		log.info("rest_update..");
		try {

			adminService.addSeller(mbrShippingVO);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			mav.setViewName("redirect:/admin/mypage/seller");

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return mav;

	}

	// 관리자 매출 조회 검색페이지 (보류)
	@GetMapping("/mypage/search")
	public ModelAndView adminSearchtotal(ModelAndView mav) throws Exception {
		log.debug("adminSearchtotal");
		log.info("adminSearchtotal");
		mav.setViewName("admin/adminSearchtotal");

		return mav;
	}

	// 관리자 판매자 리스트 admin
	@RequestMapping(value = "/mypage/seller", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_list(ModelAndView mav, MemberCriteria cri) {
		mav.setViewName("admin/admin_seller_list");
		mav.addObject("mbr", adminService.getSellerListWithCri(cri));
		int total = adminService.getSellerTotalCount(cri);
		mav.addObject("pageMaker", new MemberPageVO(cri, total));

		return mav;
	}

	// 관리자 판매자 상세정보 admin
	@RequestMapping(value = "/mypage/seller/{seller_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_detail(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("admin/admin_seller");
		mav.addObject("mbr", adminService.getMemberInfo(m_id));
		mav.addObject("adr", adminService.getSellerAddress(m_id));
		return mav;
	}

	// 관리자 회원정보수정 admin
	@PutMapping(value = "/mypage/seller/{member_id}")
	public ResponseEntity<String> admin_seller_update(@RequestBody MbrShippingVO mbrvo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			adminService.sellerInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 관리자 판매자 상품리스트 admin
	@RequestMapping(value = "/mypage/seller/{seller_id}/prdct", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_prdctlist(@PathVariable("seller_id") String m_id, PrdctListCriteria cri, ModelAndView mav) {
		mav.setViewName("admin/brand_prdct_list");
		mav.addObject("mbr", adminService.getMemberInfo(m_id));
		mav.addObject("prdct", adminService.getSellerPrdctListWithCri(cri, m_id));
		int total = adminService.getSellerPrdctTotalCount(cri, m_id);
		mav.addObject("pageMaker", new PrdctListPageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 관리자 판매자 상품 수정페이지 admin
	@RequestMapping(value = "/mypage/seller/{seller_id}/prdct/{prdct_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_prdct(@PathVariable("seller_id") String m_id, @PathVariable("prdct_id") String p_id, PrdctListCriteria cri,
			ModelAndView mav) {
		mav.setViewName("admin/seller_product_modify");
		mav.addObject("prdct", adminService.getPrdctInfo(p_id));
		mav.addObject("pBoard", adminService.getPrdctContent(p_id));
		// mav.addObject("pCategory", adminService.getCategory());
		return mav;
	}

	// 상품 수정
	@PostMapping("/mypage/seller/{seller_id}/prdct/{prdct_id}/modify")
	public ResponseEntity<String> admin_seller_prdct_modify(@RequestBody PrdctRegisterImageVO prvo) throws Exception {
		ResponseEntity<String> entity = null;

		log.info("======prdct updating======");

		try {
			// if (uploadfile != null) {
			// adminService.updatePrdctThumb(prvo); // 썸네일 이미지와 함께 update
			// } else {
			// adminService.updatePrdctInfo(prvo); // 썸네일 이미지없이 update
			// }
			adminService.updatePrdctThumb(prvo); // 썸네일 이미지와 함께 update
			log.info("======update prdct info success======");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/* 상품 content image 수정 */
	@RequestMapping(value = "/mypage/seller/{s_id}/prdct/{p_id}/modify/prdct_img", method = { RequestMethod.POST, RequestMethod.GET })
	public void prdct_img_update(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
		String uploadPath = "C:\\tetleaf\\Branches\\src\\main\\resources\\static\\prdct_img\\";
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

	// 관리자 판매자 삭제 admin

	// 관리자 회원 리스트 admin
	@RequestMapping(value = "/mypage/member", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_member_list(MemberCriteria cri, ModelAndView mav) {
		mav.setViewName("admin/admin_member_list");

		mav.addObject("mbr", adminService.getMemberListWithCri(cri));
		int total = adminService.getMemberTotalCount(cri);
		mav.addObject("pageMaker", new MemberPageVO(cri, total));
		return mav;
	}

	// 관리자 회원 상세정보 admin
	@RequestMapping(value = "/mypage/member/{member_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_member_detail(@PathVariable("member_id") String m_id, ModelAndView mav) {
		mav.setViewName("admin/admin_member");
		mav.addObject("mbr", adminService.getMemberInfo(m_id));
		return mav;
	}

	// 관리자 회원정보수정 admin
	@PutMapping(value = "/mypage/member/{member_id}")
	public ResponseEntity<String> admin_member_update(@RequestBody MbrVO mbrvo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			adminService.memberInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 관리자 회원 삭제 admin

	// 관리자 회원 주문내역 admin
	@RequestMapping(value = "/mypage/member/{member_id}/order", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_member_order_list(@PathVariable("member_id") String m_id, MemberCriteria cri, ModelAndView mav) {
		log.info("admin_member_order_list...");
		mav.addObject("mbr", adminService.getMemberInfo(m_id));

		if (adminService.getMemberOrderList(m_id, cri) != null) {
			mav.addObject("order", adminService.getMemberOrderList(m_id, cri));
			int total = adminService.getOrderTotalCount(m_id);
			mav.addObject("pageMaker", new MemberPageVO(cri, total));
			mav.setViewName("admin/admin_member_order_list");
		} else {
			mav.setViewName("admin/admin_member_order_list_null");
		}
		return mav;
	}

	// 관리자 회원 주문내역 admin
	@GetMapping("/mypage/member/{member_id}/order/{order_number}")
	public ModelAndView admin_member_order_detail(@PathVariable("member_id") String m_id, @PathVariable("order_number") String order_number,
			MemberCriteria cri, ModelAndView mav) {
		log.info("admin_member_order_list...");
		mav.setViewName("admin/admin_member_order_detail");
		mav.addObject("mbr", adminService.getMemberInfo(m_id));
		mav.addObject("order", adminService.getOrderDetail(order_number));
		return mav;
	}

	// 관리자 유저 Q&A 페이징리스트

	@GetMapping("/mypage/member/userQnA")
	public ModelAndView adminQnA_list(UserQnACriteria cri, ModelAndView mav) throws Exception {
		log.debug("userQnA_list");

		mav.setViewName("admin/userQnA_list");
		mav.addObject("board", adminService.getUserQnAListWithCri(cri));
		int total = adminService.getUserQnATotalCount(cri);
		mav.addObject("pageMaker", new UserQnAPageVO(cri, total));

		return mav;
	}

	@GetMapping("/mypage/member/userQnA/{board_id}")
	public ModelAndView adminQnA(@PathVariable("board_id") int b_id, ModelAndView mav) throws Exception {
		log.debug("userQnA");

		mav.setViewName("admin/userQnA");
		mav.addObject("board", adminService.getUserQnA(b_id));

		if (adminService.getQnAComment(b_id) != null) {
			mav.addObject("comment", adminService.getQnAComment(b_id));
		}
		return mav;
	}

	@PostMapping("/mypage/member/userQnA/{board_id}/comment")
	public ResponseEntity<String> adminQnA_comment(@RequestBody BoardCommentVO commentVO, @AuthenticationPrincipal MemberDetails memberDetails) {
		log.debug("userQnA_comment");

		ResponseEntity<String> entity = null;

		commentVO.setMbr_id(memberDetails.getUserID());

		try {
			adminService.userQnAComment(commentVO);
			log.info("comment complete");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// jsp 미완
	@GetMapping("/mypage/sales")
	public ModelAndView admin_sales_chart(ModelAndView mav) {
		log.debug("admin/admin_sales_chart");
		mav.setViewName("admin/admin_sales_chart");

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat("MM");
		SimpleDateFormat format3 = new SimpleDateFormat("dd");

		Date time = new Date();

		String year = format1.format(time);
		String month = format2.format(time);
		String day = format3.format(time);

		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);

		mav.addObject("dailySales", adminService.getDailySales(year, month));
		mav.addObject("monthlySales", adminService.getMonthlySales(year));

		return mav;
	}

}