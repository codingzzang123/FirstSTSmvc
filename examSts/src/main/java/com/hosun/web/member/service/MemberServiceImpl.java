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
	/* 이렇게 쓰면 존나 잘됨 ㅋ */
//	@Override
//	public void insert(MemberVO memberVO) throws Exception {
//		dao.insert(memberVO);
//	}
	
	/* 이렇게 쓰면  안되는것 ..  */
	@Override
	public int insert(MemberVO memberVO) {

//		if (dao.insert(memberVO) != 1) {
//			System.out.println("여기를 봐죠 : dao.insert(memberVO) : " + dao.insert(memberVO));
//			throw new MemberDuplicatedException();
//		}
		return dao.insert(memberVO);
	}
	
	@Override
	public int idCheck(String id) {
		int cnt = dao.idCheck(id);
		return cnt;
	}
}
