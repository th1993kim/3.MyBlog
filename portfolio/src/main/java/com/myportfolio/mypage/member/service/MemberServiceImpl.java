package com.myportfolio.mypage.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myportfolio.mypage.member.dao.MemberDAO;
import com.myportfolio.mypage.member.dto.MemberDTO;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO login(MemberDTO memberDto) throws Exception {
		MemberDTO loginMember = memberDAO.login(memberDto);
		return loginMember;
	}

}
