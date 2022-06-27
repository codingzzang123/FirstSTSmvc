package com.hosun.web.member.model;

import java.util.List;

public interface MemberDAO {
	public abstract List<MemberVO> list();
	
	public abstract int insert(MemberVO memberVO);
	
	public int idCheck(String id);
}
