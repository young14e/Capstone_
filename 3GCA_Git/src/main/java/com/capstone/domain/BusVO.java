package com.capstone.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BusVO {
	
	private int bno;
	
	private String title;
	private String content;
	private String writer;
	private String departarea;
	private int recruitnum;
	private int maxrecruitnum; 
	private Date departdate;
	private Date startrecruit;
	private Date deadline;
	private String departlocation;
	private double depart_lat;
	private double depart_lng;
	private String arrivelocation;
	private double arrive_lat; 
	private double arrive_lng;
	private Date regdate;
	private Date updateDate;

}
