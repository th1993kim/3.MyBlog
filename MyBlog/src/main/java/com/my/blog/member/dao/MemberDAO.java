package com.my.blog.member.dao;

import org.springframework.dao.DataAccessException;

import com.my.blog.member.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(MemberDTO memberDto) throws DataAccessException;
}
