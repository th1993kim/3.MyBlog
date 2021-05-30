package com.my.blog.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.my.blog.member.dto.MemberDTO;
import com.my.blog.member.service.MemberService;

@Controller("memberControllerImpl")
public class MemberControllerImpl implements MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/member/loginForm" ,method=RequestMethod.GET)
	@Override
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/member/loginForm");
		return mv;
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	@Override
	public ResponseEntity login(@ModelAttribute MemberDTO memberDto, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//입력한 값으로 로그인 객체 가져옴
		MemberDTO loginMember = memberService.login(memberDto);
		
		//ResponseEntity를 위한 초기값 설정
		String message="";
		ResponseEntity re = null;
		HttpHeaders headers = new HttpHeaders();
		
		HttpSession session = request.getSession();
		//if문은 입력한 아이디 , 패스워드로 조회가 되었는지 (일치여부) 확인
		if(loginMember!=null) {
				session.setAttribute("loginMember", loginMember);
				message="<script>";
				message +="alert('로그인에 성공하셨습니다.');";
				message +="location.href='"+request.getContextPath()+"/main';";
				message +="</script>";
		}else {
			message="<script>";
			message+="alert('로그인에 실패하셨습니다.');";
			message+="location.href='"+request.getContextPath()+"/member/loginForm';";
			message+="</script>";
		}
		
		//헤더정보  추가 jsp파일의 스크립트릿 선언 정보
		headers.add("Content-Type", "text/html; charset=utf-8");
		re= new ResponseEntity(message, headers, HttpStatus.OK);
		return re;
	}

	@RequestMapping("/member/logout")
	@Override
	public ResponseEntity logout(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		ResponseEntity rs = null;
		String message = "";
		HttpHeaders headers = new HttpHeaders();
		message = "<script>";
		message +="alert('로그아웃 되었습니다.');";
		message +="location.href='"+request.getContextPath()+"/main';";
		message +="</script>";
		headers.add("Content-Type", "text/html; charset=utf-8");
		rs = new ResponseEntity(message, headers, HttpStatus.OK);
		return rs;
	}
	
	
	
}