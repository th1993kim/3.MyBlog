package com.myportfolio.mypage.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myportfolio.mypage.member.dto.MemberDTO;

public interface MemberController {
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity login(@ModelAttribute MemberDTO memberDto,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
