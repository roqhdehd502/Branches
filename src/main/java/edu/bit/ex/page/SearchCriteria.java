package edu.bit.ex.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class SearchCriteria {
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 몇 개의 데이터를 보여줄것인가?
	// 검색기능 변수 2개 지정
	private String type;
	private String keyword;

	public SearchCriteria() {
		this(1, 10); // 기본 값 1페이지를 10개로 지정한다
	}

	public SearchCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	// 검색조건이 각 글자(T:제목, C:내용 , W: 작성지)로 구성되어 있으므로 검색 조건을 배열로 만들어 한번에 처리하기 위함.
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}