package com.hosun.web.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.hosun.web.book.model.BookDAO;

@Component
public class Paging {
	
	@Autowired
	private BookDAO dao;
	
	
	private final static int pageBlock = 5;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int totalBlock;
    private int pageSize = 5;
    
    public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
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
    public void makeTotalBlock(int count) {
		if(count%pageSize==0) {
			totalBlock = count/pageSize;
		}else {
			totalBlock = count/pageSize+1;
		}
	}
    // block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(int curPage){
//        if(curPage==1) {
//            blockStartNum = 1; 
//            blockLastNum = curPage + 2; 
//        }else if(curPage == lastPageNum) {
//            blockStartNum = curPage-4; 
//            blockLastNum = curPage;
//    	}else {
//        	if(curPage-2 == 0) { //페이징블럭 2를 클릭했을때  
//        		blockStartNum = curPage-1; 
//            	blockLastNum = curPage + 2;
//        	}else if(lastPageNum-curPage==1) {
//        		blockStartNum = curPage-3; 
//    			blockLastNum = curPage + 1;
//        	}else{
//        		blockStartNum = curPage-2;
//        		blockLastNum = curPage + 2;
//        	}
//        }
    	blockStartNum = 1;
    }
    
    private int total;

	// 총 페이지의 마지막 번호
    public void makeLastPageNum() {
        total = dao.getCount(); 

        if( total % pageBlock == 0 ) {
            lastPageNum = (int)Math.floor(total/5);
        }
        else {
            lastPageNum = (int)Math.floor(total/5) + 1;
        }
    }
    public void makeLastPageNumWriter(String ls) {
    	total = dao.getWriterCount(ls); 
    	
    	if( total % pageBlock == 0 ) {
    		this.lastPageNum = (int)Math.floor(total/5);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/5) + 1;
    	}
    }
    
    
    public void makeLastPageNumTitle(String ls) {
    	total = dao.getTitleCount(ls);
    	
    	if( total % pageBlock == 0 ) {
    		this.lastPageNum = (int)Math.floor(total/5);
    	}
    	else {
    		lastPageNum = (int)Math.floor(total/5) + 1;
    	}
    }
}
