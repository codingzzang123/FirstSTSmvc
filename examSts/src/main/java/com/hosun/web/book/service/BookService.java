package com.hosun.web.book.service;

import java.util.List;

import com.hosun.web.book.controller.PagingCommand;
import com.hosun.web.book.model.BookVO;

public interface BookService {
	public abstract List<BookVO> list(PagingCommand command);
	
	public abstract BookVO listOne(int no);
	
	public abstract void write(BookVO vo);
	
	public abstract List<BookVO> searchWriter(PagingCommand command);
	
	public abstract List<BookVO> searchBookname(PagingCommand command);
}
