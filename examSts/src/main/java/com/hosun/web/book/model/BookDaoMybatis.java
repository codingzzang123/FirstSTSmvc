package com.hosun.web.book.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosun.web.book.controller.PagingCommand;

@Service
public class BookDaoMybatis implements BookDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<BookVO> selectAll(PagingCommand command) {
		return sqlSessionTemplate.selectList("selectBookAll",command);
	}
	
	@Override
	public BookVO selectById(int no) {
		return sqlSessionTemplate.selectOne("selectById", no);
	}
	
	@Override
	public void insert(BookVO bookVO) {
		sqlSessionTemplate.insert("write", bookVO);
	}
	@Override
	public List<BookVO> searchByBookname(PagingCommand command) {
		return sqlSessionTemplate.selectList("searchByBookname", command);
	}
	@Override
	public List<BookVO> searchByWriter(PagingCommand command) {
		return sqlSessionTemplate.selectList("searchByWriter", command);
	}
	
	/* 페이징 */
	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("getCount");
	}
	@Override
	public int getTitleCount(String title) {
		int result = sqlSessionTemplate.selectOne("getTitleCount", title);
		return result;
	}
	@Override
	public int getWriterCount(String writer) {
		int result = sqlSessionTemplate.selectOne("getWriterCount", writer);
		return result;
	}
}
