package com.my.blog.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.my.blog.common.dto.PageDTO;
import com.my.blog.common.dto.SearchDTO;
import com.my.blog.study.dao.StudyDAO;
import com.my.blog.study.dto.ScontentDTO;
import com.my.blog.study.dto.SimgDTO;
import com.my.blog.study.dto.StudyDTO;

@Service
public class StudyServiceImpl implements StudyService {


	
	@Autowired
	private StudyDAO studyDAO;
	
	//글목록 조회
	@Override
	public List<StudyDTO> studyList(SearchDTO searchDTO) throws Exception {
		List<StudyDTO> studyList = studyDAO.studyListSelect(searchDTO);
		return studyList;
	}

	//study 테이블 작성
	@Override
	public int studyWrite(StudyDTO studyDTO, List<ScontentDTO> scontentList, List<SimgDTO> simgList,
			List<MultipartFile> files) throws Exception {
			int result =0;
			result =studyDAO.studyWrite(studyDTO);
			if(result>0) {
				studyDAO.scontentWrite(scontentList);
				studyDAO.simgWrite(simgList,files);
			}
		return result;
	}

	//글 상세보기
	@Override
	public Map<String,Object> studyDetail(int study_no) throws Exception {
		Map<String,Object> details = new HashMap<String,Object>();
		details.put("study",studyDAO.studySelect(study_no));
		details.put("scontentList",studyDAO.scontentListSelect(study_no));
		details.put("simgList",studyDAO.simgListSelect(study_no));
		return details;
	}
	
	//글 상세보기시 순서 Max값 구하기
	@Override
	public int studyMaxOrder(int study_no) throws Exception {
		int max_order_length =0;
		int scontent_max_order=0;
		int img_max_order =0;
		scontent_max_order = studyDAO.scontentMaxOrder(study_no);
		img_max_order = studyDAO.simgMaxOrder(study_no);
		if(img_max_order==0) max_order_length=scontent_max_order;
		else {
			if(scontent_max_order>img_max_order) max_order_length=scontent_max_order;
			else max_order_length=img_max_order;
		}
		return max_order_length;
	}
	
	//글수정하기
	@Override
	public int studyModify(int[] modifyFile, int[] reposition, int[] repositionValue, int[] deleteFile, StudyDTO studyDTO,
										List<ScontentDTO> scontentList, List<SimgDTO> simgList, List<MultipartFile> files) throws Exception {
		
		int result=0;
		result = studyDAO.studyModify(studyDTO);
		int study_no = studyDTO.getStudy_no();
		studyDAO.scontentModify(scontentList,study_no);
		studyDAO.simgDelete(deleteFile,study_no);
		studyDAO.simgModify(modifyFile,reposition,repositionValue,simgList,files,study_no);
		return result;
	}

	@Override
	public int firstSoNum(int i) throws Exception {
		return studyDAO.firstSoNum(i);
	}

	@Override
	public PageDTO getStudyPage(SearchDTO searchDTO) throws Exception {
		return studyDAO.getStudyPage(searchDTO); 
	}

	
	
	


}
