package com.hosun.web.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hosun.web.member.model.MemberDAO;
import com.hosun.web.member.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO dao;
	
	@Override
	public List<MemberVO> list() {
		return dao.list();
	}
}
