package edu.bit.ex.joinvo;

import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MbrVO;
import edu.bit.ex.vo.PrdctImageVO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class BoardImageUploadVO { // 게시판 내용 및 사진업로드VO
	private BoardVO boardVO;
	private PrdctImageVO prdctImageVO;
	private MultipartFile[] uploadfiles;
	private String mbr_id;
}