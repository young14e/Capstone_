package com.capstone.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지당 보여줄 게시글 갯수

	private String type;
	private String keyword;

	public int getPageStart() { // 특정페이지의 게시글 시작 번호, 게시글 시작 행 번호
		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}
}
