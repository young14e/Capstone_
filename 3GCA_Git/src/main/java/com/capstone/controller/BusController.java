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

import com.capstone.service.BusService;
import com.capstone.domain.ApplyListVO;
import com.capstone.domain.BusVO;
import com.capstone.domain.Criteria;
import com.capstone.domain.PageMaker;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/bus/*")
@AllArgsConstructor
public class BusController {
	
	private BusService service;
	
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
			@RequestParam("content") String content,
			@RequestParam("writer") String writer,
			@RequestParam("departarea") String departarea,
			@RequestParam("maxrecruitnum") int maxrecruitnum,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("departdate") Date departdate,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("startrecruit") Date startrecruit,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("deadline") Date deadline,
			@RequestParam("departlocation") String departlocation,
			@RequestParam("depart_lat") double depart_lat,
			@RequestParam("depart_lng") double depart_lng,
			@RequestParam("arrivelocation") String arrivelocation,
			@RequestParam("arrive_lat") double arrive_lat,
			@RequestParam("arrive_lng") double arrive_lng,
			RedirectAttributes rttr) {
		
		BusVO BusVO = new BusVO();
		BusVO.setTitle(title);
		BusVO.setContent(content);
		BusVO.setWriter(writer);
		BusVO.setDepartarea(departarea);
		BusVO.setMaxrecruitnum(maxrecruitnum);
		BusVO.setDepartdate(departdate);
		BusVO.setStartrecruit(startrecruit);
		BusVO.setDeadline(deadline);
		BusVO.setDepartlocation(departlocation);
		BusVO.setDepart_lat(depart_lat);
		BusVO.setDepart_lng(depart_lng);
		BusVO.setArrivelocation(arrivelocation);
		BusVO.setArrive_lat(arrive_lat);
		BusVO.setArrive_lng(arrive_lng);
		
		
		log.info("register: " + BusVO);

		service.register(BusVO);

		rttr.addFlashAttribute("result", BusVO.getBno());

		return "redirect:/bus/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("bus", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(
			@RequestParam("bno") int bno,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			@RequestParam("departarea") String departarea,
			@RequestParam("maxrecruitnum") int maxrecruitnum,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("departdate") Date departdate,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("startrecruit") Date startrecruit,
			@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) 
			@RequestParam("deadline") Date deadline,
			@RequestParam("departlocation") String departlocation,
			@RequestParam("depart_lat") double depart_lat,
			@RequestParam("depart_lng") double depart_lng,
			@RequestParam("arrivelocation") String arrivelocation,
			@RequestParam("arrive_lat") double arrive_lat,
			@RequestParam("arrive_lng") double arrive_lng,
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		BusVO BusVO = new BusVO();
		BusVO.setBno(bno);
		BusVO.setTitle(title);
		BusVO.setContent(content);
		BusVO.setDepartarea(departarea);
		BusVO.setMaxrecruitnum(maxrecruitnum);
		BusVO.setDepartdate(departdate);
		BusVO.setStartrecruit(startrecruit);
		BusVO.setDeadline(deadline);
		BusVO.setDepartlocation(departlocation);
		BusVO.setDepart_lat(depart_lat);
		BusVO.setDepart_lng(depart_lng);
		BusVO.setArrivelocation(arrivelocation);
		BusVO.setArrive_lat(arrive_lat);
		BusVO.setArrive_lng(arrive_lng);
		
		log.info("modify:" + BusVO);

		if (service.modify(BusVO)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPage());
		rttr.addAttribute("amount", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/bus/list";
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

		return "redirect:/bus/list";
	}
	
	@GetMapping("/apply")
	public String apply(@RequestParam("bno") int bno, @RequestParam("recruitnum") int recruitnum, @RequestParam("id") String userid, Criteria cri, RedirectAttributes rttr) {

		log.info("apply..." + bno);
		
		BusVO BusVO = new BusVO();
		BusVO.setBno(bno);
		BusVO.setRecruitnum(recruitnum);
		
		ApplyListVO ApplyListVO = new ApplyListVO();
		ApplyListVO.setBno(bno);
		ApplyListVO.setId(userid);
		
		System.out.println(recruitnum);
		System.out.println(userid);
		
		service.applyListRegister(ApplyListVO);
		
		if (service.apply(BusVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("bno", bno);
		rttr.addAttribute("pageNum", cri.getPage());
		rttr.addAttribute("amount", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/bus/get";
	}
}
