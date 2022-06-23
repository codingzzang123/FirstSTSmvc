package com.hosun.web.book.model;

import java.util.List;

import com.hosun.web.book.controller.PagingCommand;

public interface BookDAO {
	public abstract List<BookVO> selectAll(PagingCommand command); // 

	public abstract BookVO selectById(int no); //primary key no -> 튜플 1개 반환 
	
	public abstract void insert(BookVO bookVO);
	
	public abstract List<BookVO> searchByWriter(PagingCommand command); //글쓴이로 찾기
	 
	public abstract List<BookVO> searchByBookname(PagingCommand command); //책 이름으로 찾기
	
	/* 페이징 */
	public abstract int getCount();
	
	public abstract int getWriterCount(String writer);
	
	public abstract int getTitleCount(String title);
}
