package com.myportfolio.mypage.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("mainViewControllerImpl")
public class MainViewControllerImpl implements MainViewController {

	@RequestMapping("/main")
	@Override
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/main");
		return mv;
	}

}
