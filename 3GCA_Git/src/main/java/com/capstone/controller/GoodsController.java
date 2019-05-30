package com.capstone.controller;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.capstone.domain.Criteria;
import com.capstone.domain.GoodsVO;
import com.capstone.domain.PageMaker;
import com.capstone.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/goods/*")
@AllArgsConstructor
public class GoodsController {
	
	private GoodsService service;

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

	@GetMapping("/register")
	public void register() {

	}
	
	@PostMapping("/register")
	public String register(
			@RequestParam("title") String title,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("sharedate") Date sharedate ,
			@RequestParam("goods") String goods,
			@RequestParam("sharelocation") String sharelocation,
			@RequestParam("content") String content,
			@RequestParam("writer") String writer,
			@RequestParam("lat") double lat,
			@RequestParam("lng") double lng,
			RedirectAttributes rttr) {
		
		GoodsVO GoodsVO = new GoodsVO();
		GoodsVO.setTitle(title);
		GoodsVO.setSharedate(sharedate);
		GoodsVO.setGoods(goods);
		GoodsVO.setSharelocation(sharelocation);
		GoodsVO.setContent(content);
		GoodsVO.setWriter(writer);
		GoodsVO.setLat(lat);
		GoodsVO.setLng(lng);
		
		log.info("register: " + GoodsVO);

		service.register(GoodsVO);

		rttr.addFlashAttribute("result", GoodsVO.getBno());

		return "redirect:/goods/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("goods", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(
			@RequestParam("bno") int bno,
			@RequestParam("title") String title,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("sharedate") Date sharedate ,
			@RequestParam("goods") String goods,
			@RequestParam("sharelocation") String sharelocation,
			@RequestParam("content") String content,
			@RequestParam("lat") double lat,
			@RequestParam("lng") double lng, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		GoodsVO GoodsVO = new GoodsVO();
		GoodsVO.setBno(bno);
		GoodsVO.setTitle(title);
		GoodsVO.setSharedate(sharedate);
		GoodsVO.setGoods(goods);
		GoodsVO.setSharelocation(sharelocation);
		GoodsVO.setContent(content);
		GoodsVO.setLat(lat);
		GoodsVO.setLng(lng);
		
		log.info("modify:" + GoodsVO);

		if (service.modify(GoodsVO)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPage());
		rttr.addAttribute("amount", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/goods/list";
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

		return "redirect:/goods/list";
	}
}
