package com.myportfolio.mypage.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myportfolio.mypage.common.dto.SearchDTO;
import com.myportfolio.mypage.study.dto.ScontentDTO;
import com.myportfolio.mypage.study.dto.SimgDTO;
import com.myportfolio.mypage.study.dto.StudyDTO;

public interface StudyController {
	public ModelAndView studyList(@ModelAttribute(value="searchDTO")SearchDTO searchDTO, HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView studyWriteForm(@ModelAttribute(value="searchDTO")SearchDTO searchDTO,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView studyDetail(@RequestParam(value="study_no")int study_no,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity studyWrite(@ModelAttribute(value="StudyDTO")StudyDTO studyDTO,
														@ModelAttribute(value="ScontentDTO")ScontentDTO scontentDTO,
														@ModelAttribute(value="SimgDTO")SimgDTO simgDTO,
														MultipartHttpServletRequest request,HttpServletResponse response) throws Exception;
	public ModelAndView studyModifyForm(@RequestParam(value="stduy_no")int study_no,HttpServletRequest request,HttpServletResponse response) throws Exception;
	public ResponseEntity studyModify(@RequestParam(value="modifyFile",required=false) int[] modifyFile,
														@RequestParam(value="reposition",required=false) int[] reposition,
														@RequestParam(value="repositionValue",required=false) int[] repositionValue,
														@RequestParam(value="deleteFile",required=false) int[] deleteFile,
														@ModelAttribute(value="StudyDTO")StudyDTO studyDTO,
														@ModelAttribute(value="ScontentDTO")ScontentDTO scontentDTO,
														@ModelAttribute(value="SimgDTO")SimgDTO simgDTO,
														MultipartHttpServletRequest request,HttpServletResponse response) throws Exception;
}
