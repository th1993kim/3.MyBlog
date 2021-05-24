package com.myportfolio.mypage.study.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myportfolio.mypage.common.dto.SearchDTO;
import com.myportfolio.mypage.study.dto.ScontentDTO;
import com.myportfolio.mypage.study.dto.SimgDTO;
import com.myportfolio.mypage.study.dto.StudyDTO;

public interface StudyService {
	public List<StudyDTO> studyList(SearchDTO searchDTO) throws Exception;
	public int studyWrite(StudyDTO studyDTO, List<ScontentDTO> scontentList, List<SimgDTO> simgList, List<MultipartFile> multiFileList) throws Exception;
	public Map<String,Object> studyDetail(int study_no) throws Exception;
	public int studyMaxOrder(int study_no) throws Exception;
	public int studyModify(int[] modifyFile, int[] reposition, int[] repositionValue, int[] deleteFile, StudyDTO studyDTO,
										List<ScontentDTO> scontentList, List<SimgDTO> simgList, List<MultipartFile> files) throws Exception;
}
