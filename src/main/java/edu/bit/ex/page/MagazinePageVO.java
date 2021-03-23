package edu.bit.ex.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MagazinePageVO {
	private int startPage; // 화면에 보여지는 시작번호
	private int endPage; // 화면에 보여지는 마지막번호
	private boolean prev, next; // 이전과 다음으로 이동가능한 링크 표시

	private int total; // 전체 데이터 수
	private MagazineCriteria cri;

	public MagazinePageVO(MagazineCriteria cri, int total) {
		this.cri = cri;
		this.total = total;

		// 최대 10페이지 단위로 보여주어 페이징을 처리한다.(90개 기준)
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		// 만약 전체 게시글 수가 90개 미만이면 해당 페이지까지만 보여준다.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		// 시작번호가 1보다 큰 경우 활성화시킨다.
		this.prev = this.startPage > 1;
		// realEnd가 끝 번호 보다 큰 경우 활성화시킨다.
		this.next = this.endPage < realEnd;
	}

	// 해당 페이지 번호에 따라 URL 뒤에 붙게한다.
	public String makeQuery(int page) {
		UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("pageNum", page).queryParam("amount", cri.getAmount())
				.build();
		return uriComponentsBuilder.toUriString();
	}
}