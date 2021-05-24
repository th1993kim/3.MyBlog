package com.myportfolio.mypage.member.dao;

import org.springframework.dao.DataAccessException;

import com.myportfolio.mypage.member.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(MemberDTO memberDto) throws DataAccessException;
}
