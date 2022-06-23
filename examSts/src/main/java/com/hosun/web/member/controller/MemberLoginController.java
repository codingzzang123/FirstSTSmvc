package com.hosun.web.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberLoginController {
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String form() {
		return "member/login";
	}
	
}
