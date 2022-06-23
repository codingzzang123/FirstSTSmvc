package com.hosun.web.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hosun.web.book.model.BookVO;
import com.hosun.web.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService service;
	@Autowired
	private Paging p;
	
	private PagingCommand command;
	private static final DecimalFormat f = new DecimalFormat("###,###,###");
	
	@RequestMapping("/books/list") 
	public String form(HttpServletRequest request, Model model) {
		
		command = new PagingCommand();
		String pageNum = request.getParameter("pageNum");
		String search = request.getParameter("search"); // 책이름 or 저자
		String keyword = request.getParameter("keyword"); // input에 친 내용
		
		if(pageNum == null){
			pageNum = "1";
	    }
		int PageSize = 5;
	    int curPageNum = Integer.parseInt(pageNum);
	    int lastPageNum;
	    int start = (curPageNum-1) * PageSize + 1;
	    int end = curPageNum * PageSize;
	    
		List<BookVO> ls = new ArrayList<>();

		if(search==null||search.length()==0) {
			command.setStart(start); command.setEnd(end); 
			ls = service.list(command);
			p.makeLastPageNum();
		}
		else if(search.equals("title")) { //책 제목 검색
			command.setStart(start); command.setEnd(end); command.setBookname(keyword);
			ls = service.searchBookname(command);
			p.makeLastPageNumTitle(keyword);
		}
		else if(search.equals("writer")) { //글쓴이 검색
			command.setStart(start); command.setEnd(end); command.setWriter(keyword);
			ls = service.searchWriter(command);
			p.makeLastPageNumWriter(keyword);
		}
		
		lastPageNum = p.getLastPageNum();
		
		p.makeBlock(curPageNum);
	    Integer blockStartNum = p.getBlockStartNum();
	    
	    /* 페이징 attribute 추가 */
	    model.addAttribute("start",blockStartNum); //블럭 시작 넘버 ,
	    model.addAttribute("now",curPageNum); //현재 페이지 위치 
	    model.addAttribute("end",lastPageNum); //블럭 마지막 번호
	    model.addAttribute("search",search); 
	    model.addAttribute("keyword",keyword);
	    
		model.addAttribute("ls",ls);
		return "book/list";
	}
	
	@GetMapping(value="/books/add")
	public String form(WriteForm writeForm,Model model) {
		if(writeForm==null) {
			model.addAttribute("writeForm",new WriteForm());
		}
		return "book/write";
	}
	
	
	@PostMapping(value="/books/add")
	public String submit(@Valid WriteForm writeForm, BindingResult bindingResult,Model model,HttpServletRequest req) throws IllegalStateException, IOException{
		if(bindingResult.hasErrors()) {
			model.addAttribute("writeForm",writeForm);
			return "book/write";
		}
		MultipartFile uploadFile = writeForm.getImg();
		if(!uploadFile.isEmpty()) {
			
			uploadFile.transferTo(new File(req.getServletContext().getRealPath("/resources/bookImg")
					,uploadFile.getOriginalFilename()));
			
			
			int priceB = Integer.parseInt(writeForm.getPrice());
			BookVO vo = new BookVO(writeForm.getbookname(),writeForm.getWriter(),
					writeForm.getPublisher(),f.format(priceB),uploadFile.getOriginalFilename(),
					writeForm.getInfo(),Integer.parseInt(writeForm.getIsbn()));
			service.write(vo);
			
			return "redirect:/books/list";
		}else {
			model.addAttribute("writeForm",writeForm);
			return "book/write";
		}
	}
	
	
	@PostMapping("/books/makeIsbn")
	@ResponseBody
	public long idCheck() {
		return System.currentTimeMillis()/1000;
	}
	
	@RequestMapping("/books/detail/{no}")
	public String detail(@PathVariable("no")int bookId,Model model) {
		BookVO ls = service.listOne(bookId);
		model.addAttribute("ls",ls);
		return "book/detail";
	}
	
}
