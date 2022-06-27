package com.hosun.web.member.service;

import java.util.List;

import com.hosun.web.member.model.MemberDuplicatedException;
import com.hosun.web.member.model.MemberVO;

public interface MemberService {
	public abstract List<MemberVO> list();
	
//	public abstract void insert(MemberVO memberVO)throws Exception;
	public abstract int insert(MemberVO memberVO) ;
	
	public abstract int idCheck(String id);
}
