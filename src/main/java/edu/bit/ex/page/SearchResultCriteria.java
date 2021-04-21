package edu.bit.ex.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class SearchResultCriteria {
	private String keyword; // 검색할 키워드

	public SearchResultCriteria() {
		this.keyword = null;
	}
}