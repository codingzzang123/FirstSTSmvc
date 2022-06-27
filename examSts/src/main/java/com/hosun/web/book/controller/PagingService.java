package com.hosun.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosun.web.book.model.BookDAO;
import com.hosun.web.book.model.BookVO;
import com.hosun.web.book.service.BookService;

@Service
public class PagingService {
	
	@Autowired
	private BookService service;
	
	@Autowired
	private BookDAO dao;
	private PagingCommand command;
	
	private static final int pageSize = 3; //한 페이지에 보여지는 게시물은 5개
	private final static int pageBlock = 5; //블럭 갯수는 5개
	private int curPage;
	private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int start;
    private int end;
    private List<BookVO> ls=null;
    private int total;
    
	public List<BookVO> getLs() {
		return ls;
	}


	public void setLs(List<BookVO> ls) {
		this.ls = ls;
	}


	public int getCurPage() {
		return curPage;
	}


	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}


	public int getBlockStartNum() {
		return blockStartNum;
	}


	public void setBlockStartNum(int blockStartNum) {
		this.blockStartNum = blockStartNum;
	}


	public int getBlockLastNum() {
		return blockLastNum;
	}


	public void setBlockLastNum(int blockLastNum) {
		this.blockLastNum = blockLastNum;
	}


	public int getLastPageNum() {
		return lastPageNum;
	}


	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	public void startPaging(String pageNum, String search, String keyword) {
		command = new PagingCommand();
		
    	if(pageNum==null)
    		this.curPage=1;
    	else
    		this.curPage=Integer.parseInt(pageNum);
    	
    	this.start = (curPage-1) * pageSize + 1; 
        this.end = curPage * pageSize; 
    	
        if(search==null||search.length()==0) { //검색하지 않았을때
        	command.setStart(start); command.setEnd(end); 
			ls = service.list(command);
			this.total = dao.getCount();
			
        }else if(search.equals("title")) { //책 제목 검색
        	command.setStart(start); command.setEnd(end); command.setBookname(keyword);
			ls = service.searchBookname(command);
			this.total = dao.getTitleCount(keyword);
			
        }else if(search.equals("writer")) { //글쓴이 검색
        	command.setStart(start); command.setEnd(end); command.setWriter(keyword);
			ls = service.searchWriter(command);
			this.total = dao.getWriterCount(keyword);
			
        }
        makeLastPageNum(total);
        makeBlock(curPage);
        
    }
	
	public void makeBlock(int curPage){
        int blockNum = 0;

        blockNum = (int)Math.floor((curPage-1)/ pageBlock);
        blockStartNum = (pageBlock * blockNum) + 1;
        
        blockLastNum = blockStartNum + (pageBlock-1);
        
        if(blockLastNum != 0 && lastPageNum !=0) {
	        if(blockLastNum / lastPageNum > 0)
	        	blockLastNum = lastPageNum;
        }
    }
	
	public void makeLastPageNum(int total) {
        if( total % pageSize == 0 ) {
            lastPageNum = (int)Math.floor(total/pageSize);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageSize) + 1;
        }
    }
}
