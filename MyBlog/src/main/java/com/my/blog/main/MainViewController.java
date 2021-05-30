package com.my.blog.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MainViewController {
	public ModelAndView mainPage(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
