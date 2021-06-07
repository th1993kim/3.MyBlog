package com.my.blog.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.blog.common.dto.SearchDTO;
import com.my.blog.study.dto.StudyDTO;
import com.my.blog.study.service.StudyService;

@Controller("mainViewControllerImpl")
public class MainViewControllerImpl implements MainViewController {

	@Autowired
	private StudyService studyService;
	
	@RequestMapping("/main")
	@Override
	public ModelAndView mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("/main");
		int num1 =studyService.firstSoNum(1);
		if(num1!=0) {
			int num2 = num1+5;
			while(num1<num2){
				SearchDTO study = new SearchDTO();
				study.setDae_no(1);
				study.setSo_no(num1);
				study.setEndNum(5);
				List<StudyDTO> studyList= studyService.studyList(study); 
				if(!studyList.isEmpty()) {
					mv.addObject(studyList.get(0).getSo_name()+"List",studyList);
				}
				num1++;
			}
		}
			SearchDTO project = new SearchDTO();
			project.setDae_no(2);
			project.setEndNum(5);
			List<StudyDTO> projectList = studyService.studyList(project);
			if(!projectList.isEmpty()) {
				mv.addObject("projectList",projectList);
			}
		return mv;
	}

}
