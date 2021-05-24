package com.myportfolio.mypage.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myportfolio.mypage.common.dto.SearchDTO;
import com.myportfolio.mypage.member.dto.MemberDTO;
import com.myportfolio.mypage.study.dto.ScontentDTO;
import com.myportfolio.mypage.study.dto.SimgDTO;
import com.myportfolio.mypage.study.dto.StudyDTO;
import com.myportfolio.mypage.study.service.StudyService;

@Controller
public class StudyControllerImpl implements StudyController {
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value ="/study/studyList",method=RequestMethod.GET)
	@Override
	public ModelAndView studyList(@ModelAttribute(value="searchDTO")SearchDTO searchDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		searchDTO.setStartNum((searchDTO.getCurrentPage()-1)*searchDTO.getSeeCount()+1);
		searchDTO.setEndNum(searchDTO.getStartNum()+searchDTO.getSeeCount()-1);
		List<StudyDTO> studyList = studyService.studyList(searchDTO);
		 
		ModelAndView mv = new ModelAndView("/study/studyList");
		mv.addObject("studyList",studyList);
		mv.addObject("search",searchDTO);
		return mv;
	}

	@RequestMapping(value="/study/studyWriteForm",method=RequestMethod.GET)
	@Override
	public ModelAndView studyWriteForm(SearchDTO searchDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mv = new ModelAndView("/study/studyWriteForm");
		mv.addObject("search",searchDTO);
		return mv;
	}

	@RequestMapping(value="/study/studyWrite",method=RequestMethod.POST)
	@Override
	public ResponseEntity studyWrite(@ModelAttribute(value="StudyDTO")StudyDTO studyDTO,
														@ModelAttribute(value="ScontentDTO")ScontentDTO scontentDTO,
														@ModelAttribute(value="SimgDTO")SimgDTO simgDTO,
														MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginMember");
		studyDTO.setMember_id(memberDTO.getMember_id());
		
		List<ScontentDTO> scontentList = scontentDTO.getScontentList();
		List<MultipartFile> multiFileList = request.getFiles("imgfiles");
		List<SimgDTO> simgList = simgDTO.getSimgList();
		
		int result = studyService.studyWrite(studyDTO,scontentList,simgList,multiFileList); //서비스 실행 (튜플)
		ResponseEntity rs = null;
		String message ="";
		HttpHeaders headers = new HttpHeaders();
		
		
		if(result>0) {
			message="<script>";
			message+="alert('작성에 성공하셨습니다.');";
			message+="location.href='"+request.getContextPath()+"/study/studyList?dae_no="+studyDTO.getDae_no()+"&so_no="+studyDTO.getSo_no()+"';";
			message+="</script>";
		}else {
			message="<script>";
			message+="alert('작성에 실패하셨습니다.');";
			message+="location.href='"+request.getContextPath()+"/study/studyList?dae_no="+studyDTO.getDae_no()+"&so_no="+studyDTO.getSo_no()+"';";
			message+="</script>";
		}
		headers.add("Content-Type","text/html; charset=utf-8");
		rs = new ResponseEntity(message, headers, HttpStatus.OK);	
		return rs;
	}

	//글 상세보기 
	@RequestMapping(value="/study/studyDetail",method=RequestMethod.GET)
	@Override
	public ModelAndView studyDetail(@RequestParam(value="study_no")int study_no,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String,Object> details = new HashMap<String,Object>();
		details = studyService.studyDetail(study_no);
		int max_order_length = 0;
		max_order_length = studyService.studyMaxOrder(study_no); //정렬 번호 max값 가져오기
		ModelAndView mv = new ModelAndView("/study/studyDetail");
		
		mv.addObject("study",details.get("study")); //글 제목
		mv.addObject("scontentList",details.get("scontentList")); //글 내용 리스트
		mv.addObject("simgList",details.get("simgList")); //글 이미지 리스트
		mv.addObject("max_order_length",max_order_length);
		
		return mv;
	}
	
	//수정하기 폼 들어가기 글 상세보기와 로직이 동일하다
	@RequestMapping(value="/study/studyModifyForm",method=RequestMethod.GET)
	@Override
	public ModelAndView studyModifyForm(int study_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String,Object> details = new HashMap<String,Object>();
		details = studyService.studyDetail(study_no);
		int max_order_length = 0;
		max_order_length = studyService.studyMaxOrder(study_no); //정렬 번호 max값 가져오기
		ModelAndView mv = new ModelAndView("/study/studyModifyForm");
		
		mv.addObject("study",details.get("study")); //글 제목
		mv.addObject("scontentList",details.get("scontentList")); //글 내용 리스트
		mv.addObject("simgList",details.get("simgList")); //글 이미지 리스트
		mv.addObject("max_order_length",max_order_length);
		
		return mv;
	}

	
	
	/*
	 	Requestparam을 배열로 받는 경우 
	 	Ajax를 통한 통신인 경우	 
		@RequestParam(value="arr[]" String[] arr)
		GET 혹은 POST인 경우
		@RequestParam(value="arr" String[] arr)
	 */
	//글 수정하기 
	@RequestMapping(value="/study/studyModify",method=RequestMethod.POST)
	@Override
	public ResponseEntity studyModify(@RequestParam(value="modifyFile",required=false) int[] modifyFile, //required=false 인풋 파라미터가 없을경우도 생각해야한다.
															@RequestParam(value="reposition",required=false) int[] reposition,
															@RequestParam(value="repositionValue",required=false) int[] repositionValue,
															@RequestParam(value="deleteFile",required=false) int[] deleteFile,
															@ModelAttribute(value="StudyDTO")StudyDTO studyDTO,
															@ModelAttribute(value="ScontentDTO")ScontentDTO scontentDTO,
															@ModelAttribute(value="SimgDTO")SimgDTO simgDTO,
															MultipartHttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<ScontentDTO> scontentList = scontentDTO.getScontentList();
		List<SimgDTO> simgList = simgDTO.getSimgList();
		List<MultipartFile> files = request.getFiles("imgfiles");
		
		int result = studyService.studyModify(modifyFile,reposition,repositionValue,deleteFile,studyDTO,scontentList,simgList,files);
		ResponseEntity rs =null;
		String message = "";
		HttpHeaders headers = new HttpHeaders();
		if(result>0) {
			message+="<script>";
			message+="alert('수정이완료되었습니다.');";
			message+="location.href='"+request.getContextPath()+"/study/studyDetail?study_no="+studyDTO.getStudy_no()+"';";
			message+="</script>";
		}else {
			message+="<script>";
			message+="alert('수정 실패하였습니다.');";
			message+="location.href='"+request.getContextPath()+"/study/studyDetail?study_no="+studyDTO.getStudy_no()+"';";
			message+="</script>";
		}
		headers.add("Content-Type","text/html; charset=utf-8");
		rs=new ResponseEntity(message,headers,HttpStatus.OK);
		return rs;
	}
	
	

}
