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
		return sqlSessionTemplate.selectList("member.dtd.selectMemberAll");
	}
	
	@Override
	public int insert(MemberVO memberVO){
		return sqlSessionTemplate.insert("member.dtd.join",memberVO);
	}
	
	@Override
	public int idCheck(String id) {
		int cnt = sqlSessionTemplate.selectOne("member.dtd.idCheck", id);
		return cnt;
	}
}
