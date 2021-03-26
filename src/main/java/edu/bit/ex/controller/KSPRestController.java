package edu.bit.ex.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.MemberCriteria;
import edu.bit.ex.page.MemberPageVO;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.KSPService;
import edu.bit.ex.vo.MbrAddressVO;
import edu.bit.ex.vo.MbrVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/rest_ksp/*")
public class KSPRestController {

	private KSPService kspService;

	// 전체 상품리스트
	@RequestMapping(value = "/prdct_list", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView prdct_list(ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/prdct_list");
		mav.addObject("prdct", kspService.getPrdctListWithCri(cri));
		int total = kspService.getTotalCount(cri);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 카테고리별 상품리스트
	@RequestMapping(value = "/category/{category_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView category_prdct_list(@PathVariable("category_id") int c_id, ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/category_prdct_list");
		mav.addObject("prdct", kspService.getCategoryPrdctListWithCri(cri, c_id));
		mav.addObject("category", kspService.getCategory(c_id));
		int total = kspService.getCategoryTotalCount(cri, c_id);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 브랜드별 상품리스트
	@RequestMapping(value = "/brand/{brand_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView brand_prdct_list(@PathVariable("brand_id") String b_id, ModelAndView mav, Criteria cri) {
		mav.setViewName("rest_ksp/brand_prdct_list");
		mav.addObject("mbr", kspService.getMemberInfo(b_id));
		mav.addObject("prdct", kspService.getBrandPrdctListWithCri(cri, b_id));
		int total = kspService.getBrandTotalCount(cri, b_id);
		mav.addObject("pageMaker", new PageVO(cri, total));
		log.info("total : " + total);
		return mav;
	}

	// 회원 정보수정폼
	@RequestMapping(value = "/member/{member_id}/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView member_info(@PathVariable("member_id") String m_id, ModelAndView mav) {
		mav.setViewName("rest_ksp/member_mypage_modify");
		mav.addObject("mbr", kspService.getMemberInfo(m_id));
		return mav;
	}

	@PutMapping(value = "/member/{member_id}/mypage/myinfo")
	public ResponseEntity<String> member_info_modify(@RequestBody MbrVO mbrvo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			kspService.memberInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 판매자 정보수정폼
	@RequestMapping(value = "/seller/{seller_id}/mypage/myinfo", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView seller_info(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("rest_ksp/seller_mypage_modify");
		mav.addObject("mbr", kspService.getMemberInfo(m_id));
		mav.addObject("adr", kspService.getSellerAddress(m_id));
		return mav;
	}

	@PutMapping(value = "/seller/{seller_id}/mypage/myinfo")
	public ResponseEntity<String> seller_info_modify(@RequestBody MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			kspService.sellerInfoUpdate(mavo);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	////////////////////////////////////////////////////

	// 관리자 판매자 리스트
	@RequestMapping(value = "/admin/mypage/seller", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_list(ModelAndView mav, MemberCriteria cri) {
		mav.setViewName("rest_ksp/admin_seller_list");
		mav.addObject("mbr", kspService.getMemberListWithPaging(2, cri));
		int total = kspService.getSellerTotalCount(2, cri);
		mav.addObject("pageMaker", new MemberPageVO(cri, total));
		return mav;
	}

	// 관리자 판매자 상세정보
	@RequestMapping(value = "/admin/mypage/seller/{seller_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_seller_detail(@PathVariable("seller_id") String m_id, ModelAndView mav) {
		mav.setViewName("rest_ksp/admin_seller");
		mav.addObject("mbr", kspService.getMemberInfo(m_id));
		mav.addObject("adr", kspService.getSellerAddress(m_id));
		return mav;
	}

	@PutMapping(value = "/admin/mypage/seller/{seller_id}")
	public ResponseEntity<String> admin_seller_update(@RequestBody MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			kspService.sellerInfoUpdate(mavo);
			log.info("update seller info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@DeleteMapping("/admin/mypage/seller/{seller_id}")
	public ResponseEntity<String> seller_delete(MbrAddressVO mavo) {
		ResponseEntity<String> entity = null;
		log.info("rest_delete..");
		try {
			kspService.deleteMbr(mavo);
			// 삭제가 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 삭제가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;

	}

	// 관리자 회원 리스트
	@RequestMapping(value = "/admin/mypage/member", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_member_list(ModelAndView mav) {
		mav.setViewName("rest_ksp/admin_member_list");
		mav.addObject("mbr", kspService.getMemberList(3));
		return mav;
	}

	// 관리자 회원 상세정보
	@RequestMapping(value = "/admin/mypage/member/{member_id}", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_member_detail(@PathVariable("member_id") String m_id, ModelAndView mav) {
		mav.setViewName("rest_ksp/admin_member");
		mav.addObject("mbr", kspService.getMemberInfo(m_id));
		return mav;
	}

	@PutMapping(value = "/admin/mypage/member/{member_id}")
	public ResponseEntity<String> admin_member_update(@RequestBody MbrVO mbrvo) {
		ResponseEntity<String> entity = null;

		log.info("rest_update..");
		try {

			kspService.memberInfoUpdate(mbrvo);
			log.info("update member info");
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@DeleteMapping("/admin/mypage/member/{member_id}")
	public ResponseEntity<String> member_delete(MbrVO mbrvo) {
		ResponseEntity<String> entity = null;
		log.info("rest_delete..");
		try {
			// kspService.deleteMbr(mbrvo);
			// 삭제가 성공하면 성공 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 삭제가 실패하면 실패 상태메시지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;

	}

}
