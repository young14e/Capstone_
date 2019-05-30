package com.capstone.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int totalCount;
	private Criteria cri;

	private int displayPageNum = 5;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		startPage = (endPage - displayPageNum) + 1;
		if(startPage <= 0) {
			startPage = 1;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}


}
