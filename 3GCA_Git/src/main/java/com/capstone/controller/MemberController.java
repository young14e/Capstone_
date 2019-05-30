package com.capstone.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.domain.MemberVO;
import com.capstone.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	private MemberService service;

	@GetMapping("/login")
	public void login() {

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/login")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = service.loginCheck(vo, session); // 아이디,비밀번호로 체크함
		ModelAndView mav = new ModelAndView();
		if (result) { // 로그인 성공
			mav.setViewName("redirect:/");// home.jsp 이동
			mav.addObject("msg", "success");

		} else { // 로그인 실패
			mav.setViewName("redirect:/member/login"); // 로그인화면 다시
			mav.addObject("msg", "failure");
		}
		return mav;
	}

	@PostMapping("/register")
	public String register(@RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("nick") String nick, @RequestParam("name") String name,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam("birthDate") Date birthDate,
			@RequestParam("phone") String phone, @RequestParam("classType") String classType) {

		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		memberVO.setNick(nick);
		memberVO.setName(name);
		memberVO.setBirthDate(birthDate);
		memberVO.setPhone(phone);
		memberVO.setClassType(Integer.parseInt(classType));

		log.info("member register : " + memberVO);
		service.register(memberVO);
		return "redirect:/";
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		mav.addObject("msg", "logout");
		return mav;
	}

	@GetMapping("/update")
	public void update(HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("userId");
		service.viewUser(request, userId); // 유저정보 리퀘스트에 저장
	}

	@PostMapping("/update")
	public String update(@ModelAttribute MemberVO vo) {
		service.modifyUser(vo);
		return "redirect:/";
	}

	// 회원 탈퇴(id로 삭제)

	@PostMapping("/deleteMember")
	public String deleteMember(@RequestParam("id") String id, HttpSession session) {
		service.logout(session);
		System.out.print(id);
		// 로그아웃, 세션 invalidate 
		service.deleteMember(id);

		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public void mypage(HttpSession session, HttpServletRequest request, Model model) {
		String userId = (String) session.getAttribute("userId");
		service.viewUser(request, userId); // 유저정보 리퀘스트에 저장
	}
}
