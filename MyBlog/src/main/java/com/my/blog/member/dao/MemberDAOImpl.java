package com.my.blog.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.my.blog.member.dto.MemberDTO;

@Repository("memberDAOImpl")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO login(MemberDTO memberDto) throws DataAccessException {
		MemberDTO loginMember = sqlSession.selectOne("member.login", memberDto);
		return loginMember;
	}

}
