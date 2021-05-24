package com.myportfolio.mypage.member.service;

import com.myportfolio.mypage.member.dto.MemberDTO;

public interface MemberService {
	public MemberDTO login(MemberDTO memberDto) throws Exception;
}
