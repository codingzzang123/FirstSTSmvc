package com.hosun.web.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hosun.web.member.model.MemberVO;
import com.hosun.web.member.service.MemberService;
import com.hosun.web.member.service.MemberServiceImpl;

@Controller
public class MemberJoinController {
	@Autowired
	private MemberService service;
	
//	@RequestMapping(value="member/view")
//	@ResponseBody
//	public String list() {
//		return service.list().toString();
//	}
	
	@RequestMapping(value="/member/join",method=RequestMethod.GET)
	public String form() {
		return "member/join";
	}
	
	@RequestMapping(value="/member/join",method=RequestMethod.POST)
	public String submit() {
		return "member/join2";
	}
	
	@RequestMapping(value="/member/view")
	public String list(Model model) {
		List<MemberVO> vo = service.list();
		System.out.println("vo:" + vo);
		model.addAttribute("vo",vo);
		return "member/view";
	}
	
	
}
