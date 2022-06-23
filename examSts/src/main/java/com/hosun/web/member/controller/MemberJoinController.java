package com.hosun.web.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hosun.web.member.model.MemberVO;
import com.hosun.web.member.service.MemberService;

@Controller
public class MemberJoinController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/join",method=RequestMethod.GET)
	public String form() {
		return "member/join";
	}
	
	@RequestMapping(value="/member/join",method=RequestMethod.POST)
	public String submit(MemberVO command) {
		service.insert(command);
		return "redirect:/member/view";
	}
	
	@RequestMapping(value="/member/view")
	public String list(Model model) {
		List<MemberVO> vo = service.list();
		System.out.println("vo:" + vo);
		model.addAttribute("vo",vo);
		return "member/view";
	}
}
