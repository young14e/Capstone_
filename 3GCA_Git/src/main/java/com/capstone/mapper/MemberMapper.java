package com.capstone.mapper;

import com.capstone.domain.MemberVO;;

public interface MemberMapper {
	public void insert(MemberVO member);
	public String loginCheck(MemberVO vo);
	public MemberVO memberOne(MemberVO vo);
	public MemberVO getMemberOne(String userId);
	public int updateMember(MemberVO vo);
	public void deleteMember(String id);
}
