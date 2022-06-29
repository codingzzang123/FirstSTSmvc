package com.hosun.web.movie.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hosun.web.movie.model.ContentsVO;
import com.hosun.web.movie.model.GetInfoUtil;

@Controller
public class MovieController {
	
	@RequestMapping("/movie/index")
	public ModelAndView indexForm() {
		GetInfoUtil util = new GetInfoUtil();
		List<ContentsVO> release_date = null;
		release_date = util.getInfoList();
		
		System.out.println("release_date = "+release_date);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("movie/index");
		mav.addObject("ls", release_date);
		return mav;
	}
	
	@RequestMapping("/movie/index2")
	public String indexForm2() {
		return "movie/index2";
	}
}
