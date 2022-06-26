package com.hosun.web.book.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hosun.web.book.model.BookDAO;

@Component
public class Paging {
	
	@Autowired
	private BookDAO dao;
	
	private final static int pageBlock = 5; // (1~5) (6~10) 같이 블럭의 갯수.
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    
    public int getPageBlock() {
    	return pageBlock;
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
   
    // block을 생성, 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
//    public void makeBlock(int curPage){
//    	if(curPage-3 <= 0) {
//    		blockStartNum = 1;
//        	blockLastNum = (lastPageNum < 5 ? lastPageNum : 5);
//    	}else if(lastPageNum-curPage==1) {
//    		blockStartNum = curPage-3;
//    		blockLastNum = (curPage != lastPageNum? curPage+1 : curPage);
//    	}else if(lastPageNum-curPage==0) {
//    		blockStartNum = curPage-4;
//    		blockLastNum = lastPageNum;
//    	}else {
//    		blockStartNum = curPage-2;
//    		blockLastNum = (curPage != lastPageNum? curPage+2 : curPage);
//    	}
//    }
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

	// 총 페이지의 마지막 번호(검색 하지 않았을때 + 검색 했을 때)
    public void makeLastPageNum() {
    	int total = dao.getCount(); 

        if( total % pageBlock == 0 ) {
            lastPageNum = (int)Math.floor(total/5);
        }
        else {
            lastPageNum = (int)Math.floor(total/5) + 1;
        }
    }
    public void makeLastPageNumWriter(String ls) {
    	int total = dao.getWriterCount(ls); 
    	
    	if( total % pageBlock == 0 ) {
    		this.lastPageNum = (int)Math.floor(total/5);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/5) + 1;
    	}
    }
    
    
    public void makeLastPageNumTitle(String ls) {
    	int total = dao.getTitleCount(ls);
    	
    	if( total % pageBlock == 0 ) {
    		this.lastPageNum = (int)Math.floor(total/5);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/5) + 1;
    	}
    }
}
