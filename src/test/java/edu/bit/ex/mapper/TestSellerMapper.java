package edu.bit.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.bit.ex.joinvo.BoardBoardCommentVO;
import edu.bit.ex.joinvo.MbrShippingVO;
import edu.bit.ex.joinvo.PrdctOrderDetailVO;
import edu.bit.ex.joinvo.PrdctRegisterImageVO;
import edu.bit.ex.vo.MbrVO;

@Mapper
public interface TestSellerMapper {
	// 판매자 권한 가진 멤버 리스트 불러오기
	@Select("SELECT * FROM mbr WHERE authority_number = 2")
	public List<MbrVO> getSellerList();

	// 상품 qna 댓글등록 테스트
	@Insert("insert into board_comment (comment_id, board_id, mbr_id, comment_content)"
			+ "values (board_comment_seq.nextval, #{board_id}, #{mbr_id}, #{comment_content})")
	public void getQnaCommentTest(BoardBoardCommentVO comment);

	// 댓글 삭제 테스트
	@Delete("DELETE FROM board_comment WHERE comment_id = #{comment_id}")
	public void commentRemove(int i);

	// 상품등록 테스트
	@Insert("insert all into prdct (prdct_id, prdct_name, prdct_thumbnail, prdct_price, category_number, prdct_color, prdct_size, prdct_stock, mbr_id) values\r\n"
			+ "				(#{prdct_id}, #{prdct_name}, #{prdct_thumbnail}, #{prdct_price}, #{category_number},#{prdct_color},#{prdct_size},#{prdct_stock}, #{mbr_id}) \r\n"
			+ "					into board (board_id, board_name, board_content, board_type_number, prdct_id ,board_like, board_hit, mbr_id) \r\n"
			+ "						values(board_seq.nextval, 'TEST', #{board_content}, 6, #{prdct_id} ,0, 0, #{mbr_id})\r\n"
			+ "							select * from dual")
	public void prdctInfoInsertTest(PrdctRegisterImageVO pvo);

	// 상품 수정 테스트
	@Update("update prdct set prdct_name=#{prdct_name}, category_number=#{category_number}, prdct_color=#{prdct_color}, prdct_size = #{prdct_size}\r\n"
			+ "				,prdct_price=#{prdct_price}, prdct_stock=#{prdct_stock}  where prdct_id=#{prdct_id}")
	public void prdctInfoUpdateTest(PrdctRegisterImageVO pvo);

	// 상품 삭제 테스트
	@Delete("delete from prdct where prdct_id = #{prdct_id}")
	public void prdctRemove(String string);

	// 주문 정보 수정 테스트
	@Update("update prdct_order set order_state_number = #{order_state_number} where order_number = #{order_number}")
	public void orderInfoUpdateTest(PrdctOrderDetailVO pvo);

	// 판매자 정보 수정
	@Update("update mbr set mbr_name=#{mbr_name}, mbr_pw=#{mbr_pw}, mbr_email=#{mbr_email}, contact_number=#{contact_number}  where mbr_id=#{mbr_id}")
	public void sellerInfoUpdateTest(MbrShippingVO msVO);
}