package com.capstone.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	private int bno;
	private String title;
	private Date sharedate; //나눔날짜
	private String goods; //나눔굿즈명
	private String sharelocation; //나눔장소명
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private double lat; //위도
	private double lng; //경도
}
