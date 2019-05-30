package com.capstone.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.capstone.domain.MemberVO;
public interface MemberService {
	
	public void register(MemberVO member);
	
	boolean loginCheck(MemberVO vo, HttpSession session);
	public MemberVO memberOne(MemberVO vo);
	void logout(HttpSession session);

	public void viewUser(HttpServletRequest request, String userId);

	public void modifyUser(MemberVO vo);

	public void deleteMember(String id);
	
}
