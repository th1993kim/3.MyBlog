package com.my.blog.member.service;

import com.my.blog.member.dto.MemberDTO;

public interface MemberService {
	public MemberDTO login(MemberDTO memberDto) throws Exception;
}
