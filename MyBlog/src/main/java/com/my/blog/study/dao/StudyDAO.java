package com.my.blog.study.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.my.blog.common.dto.PageDTO;
import com.my.blog.common.dto.SearchDTO;
import com.my.blog.study.dto.ScontentDTO;
import com.my.blog.study.dto.SimgDTO;
import com.my.blog.study.dto.StudyDTO;
 
public interface StudyDAO {
	public List<StudyDTO> studyListSelect(SearchDTO searchDTO) throws DataAccessException;
	public int studyWrite(StudyDTO studyDTO) throws DataAccessException;
	public void scontentWrite(List<ScontentDTO> scontentList, int study_no) throws DataAccessException;
	public void simgWrite(List<SimgDTO> simgList, List<MultipartFile> files, int study_no) throws DataAccessException;
	public StudyDTO studySelect(int study_no) throws DataAccessException;
	public List<ScontentDTO> scontentListSelect(int study_no) throws DataAccessException;
	public List<SimgDTO> simgListSelect(int study_no) throws DataAccessException;
	public int scontentMaxOrder(int study_no) throws DataAccessException;
	public int simgMaxOrder(int study_no) throws DataAccessException;
	public int studyModify(StudyDTO studyDTO) throws DataAccessException;
	public void scontentModify(List<ScontentDTO> scontentList,int study_no) throws DataAccessException;
	public void simgDelete(int[] deleteFile, int study_no) throws DataAccessException;
	public void simgModify(int[] modifyFile, int[] reposition, int[] repositionValue, List<SimgDTO> simgList,
			List<MultipartFile> files, int study_no) throws DataAccessException;
	public int firstSoNum(int i) throws DataAccessException;
	public PageDTO getStudyPage(SearchDTO searchDTO) throws DataAccessException;
	public SimgDTO simgThumb(Map<String, Integer> noMap) throws DataAccessException;
	public int simgMinOrder(int study_no) throws DataAccessException;
	public int selectNextVal() throws DataAccessException;
}
