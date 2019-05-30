package com.capstone.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	int no;
	String id;
	String pw;
	String nick;
	String name;
	Date birthDate;
	String phone;
	int classType; // db에서는 class

}
