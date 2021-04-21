package edu.bit.ex.page;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;

@Getter
public class SearchResultPageVO {
	private SearchResultCriteria cri;
	private int total; // 전체 데이터 수

	public SearchResultPageVO(SearchResultCriteria cri, int total) {
		this.cri = cri;
		this.total = total;
	}

	// 해당 페이지 뒤에 따라 검색 결과문(keyword)이 뜨게 한다
	public String makeQuery() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("");

		if (cri.getKeyword() != null) {
			builder.queryParam("keyword", cri.getKeyword());
		}

		return builder.toUriString();
	}

	// URI 뒤에 남길 키워드
	@Override
	public String toString() {
		return "keyword=" + cri.getKeyword();
	}
}