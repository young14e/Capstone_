package com.capstone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.capstone.domain.NoticeVO;
import com.capstone.domain.Criteria;
import com.capstone.domain.PageMaker;
import com.capstone.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;

	@GetMapping("/register")
	public void register() {

	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(total);

		model.addAttribute("pageMaker", pageMaker);

	}

	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {

		log.info("register: " + notice);

		service.register(notice);

		rttr.addFlashAttribute("result", notice.getBno());

		return "redirect:/notice/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("notice", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + notice);

		if (service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPage());
		rttr.addAttribute("amount", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/notice/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPage());
		rttr.addAttribute("amount", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/notice/list";
	}

}
