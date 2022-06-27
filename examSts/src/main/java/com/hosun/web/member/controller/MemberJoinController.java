package com.hosun.web.member.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hosun.web.member.model.MemberDuplicatedException;
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
	public String submit(MemberVO memberVO, Errors errors,Model model) {
		try {
			if (service.idCheck(memberVO.getId()) == 1) {
				throw new MemberDuplicatedException();
			}
			service.insert(memberVO);
			return "redirect:/member/view";
			
		} catch (MemberDuplicatedException e) {
			System.out.println("MemberDuplicatedException e!!");
			model.addAttribute(memberVO);
			return "member/join";
		} 
	}
	
	@RequestMapping(value="/member/view")
	public String list(Model model) {
		List<MemberVO> vo = service.list();
		System.out.println("vo:" + vo);
		model.addAttribute("vo",vo);
		return "member/view";
	}
}
