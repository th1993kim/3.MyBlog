package com.myportfolio.mypage.member.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Component("memberDTO")
public class MemberDTO {
	private String member_id;
	private String member_pwd;
	
}
