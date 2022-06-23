package com.hosun.web.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosun.web.book.controller.PagingCommand;
import com.hosun.web.book.model.BookDAO;
import com.hosun.web.book.model.BookVO;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDAO dao;
	
	@Override
	public void write(BookVO vo) {
		dao.insert(vo);
	}
	@Override
	public BookVO listOne(int no) {
		return dao.selectById(no);
	}
	@Override
	public List<BookVO> list(PagingCommand command) {
		return dao.selectAll(command);
	}
	@Override
	public List<BookVO> searchBookname(PagingCommand command) {
		return dao.searchByBookname(command);
	}
	@Override
	public List<BookVO> searchWriter(PagingCommand command) {
		return dao.searchByWriter(command);
	}
	
}
