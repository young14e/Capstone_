package com.capstone.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.capstone.domain.MemberVO;
import com.capstone.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;

	@Override
	public void register(MemberVO member) {

		log.info("register member.." + member);

		mapper.insert(member);
	}

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session){
		String result = mapper.loginCheck(vo);
		boolean check = false;
		if(result != null) { //로그인이 정상이면 세션에 등록			
			MemberVO mVo = mapper.memberOne(vo);
			session.setAttribute("userId", mVo.getId());
			session.setAttribute("userName", mVo.getName());
			session.setAttribute("userGrade", mVo.getClassType());
			check = true;
		}
		return check;
	}
	
	@Override
	public MemberVO memberOne(MemberVO vo) {
		return mapper.memberOne(vo);
	}
	
	@Override
	public void logout(HttpSession session) {
		//세션 정보 초기화
		session.invalidate();
	}

	@Override
	public void viewUser(HttpServletRequest request, String userId) {
		MemberVO mVo = mapper.getMemberOne(userId); //아이디로 멤버 정보 얻기
		
		request.setAttribute("userInfo", mVo); //request에   유저정보 저장
		
	}

	@Override
	public void modifyUser(MemberVO vo) {
		int result = -1;
		result = mapper.updateMember(vo);
		
	}

	@Override
	public void deleteMember(String id) {
		mapper.deleteMember(id); 
		
	}
	
}
