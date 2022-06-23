package com.hosun.web.member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoMybatis implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MemberVO> list() {
		return sqlSessionTemplate.selectList("selectMemberAll");
	}
	
	@Override
	public void insert(MemberVO memberVO) {
		sqlSessionTemplate.insert("join",memberVO);
	}
	
	@Override
	public int idCheck(String id) {
		int cnt = sqlSessionTemplate.selectOne("idCheck", id);
		return cnt;
	}
}
