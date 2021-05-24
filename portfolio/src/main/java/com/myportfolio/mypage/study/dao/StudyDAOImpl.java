package com.myportfolio.mypage.study.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.myportfolio.mypage.common.dto.SearchDTO;
import com.myportfolio.mypage.study.dto.ScontentDTO;
import com.myportfolio.mypage.study.dto.SimgDTO;
import com.myportfolio.mypage.study.dto.StudyDTO;

@Repository
public class StudyDAOImpl implements StudyDAO {
	
	private static final String RealPath="c:\\uploadFiles";
	private static final String DBPath="/imgfile/";
	@Autowired
	private SqlSession sqlSession;
	
	//study테이블 목록 조회
	@Override
	public List<StudyDTO> studyListSelect(SearchDTO searchDTO) throws DataAccessException {
		List<StudyDTO> studyListSelect = sqlSession.selectList("study.studyListSelect",searchDTO);
		return studyListSelect;
	}
	
	//글작성하기-제목
	@Override
	public int studyWrite(StudyDTO studyDTO) throws DataAccessException {
		return sqlSession.insert("study.studyWrite",studyDTO);
	}

	//글작성하기-내용
	@Override
	public void scontentWrite(List<ScontentDTO> scontentList) throws DataAccessException {
		for(ScontentDTO scontent :scontentList) {
			sqlSession.insert("study.scontentWrite",scontent);
		}
	}

	//글작성하기-이미지
	@Override
	public void simgWrite(List<SimgDTO> simgList, List<MultipartFile> files) throws DataAccessException {
		int study_no = (Integer)sqlSession.selectOne("study.study_no");
		String fileDirPath = RealPath+"\\"+study_no; //실제 저장 물리 경로 (study_no로 폴더 분류)
		
		File fileDir = new File(fileDirPath); //폴더 생성
		if(!fileDir.exists()) {
			try {
				fileDir.mkdirs(); //mkdir 상위폴더 없을 경우 생성 X mkdirs 상위폴더까지 생성
			}catch(Exception e) {
				e.getStackTrace();
			}		
		}
		int k=0;
		
		for(int i=0;i<files.size();i++) {
			MultipartFile file = files.get(i); //file과 simgDTO는 1:1 맵핑된다.
			SimgDTO simg=null;
			while(true) {
				if(simgList.get(k).getIs_upload()==1) {
					simg = simgList.get(k);
					k++;
					break;
				}
				k++;
			}
			
			if(!file.isEmpty()) {
				String imgSavingName = System.currentTimeMillis()+i+file.getOriginalFilename();
				String saveFile = fileDirPath+"\\"+imgSavingName;
				try {
					file.transferTo(new File(saveFile)); //파일 생성
					String simg_name = DBPath +study_no+"/"+imgSavingName; //파일 생성이 되었을시 DB저장명
					simg.setSimg_name(simg_name);
					simg.setStudy_no(study_no);
					sqlSession.insert("study.simgWrite",simg);
				}catch (Exception e) {
					e.printStackTrace();
				}				
			}
		}
		
		
	}

	//선택한 study 가져오기
	@Override
	public StudyDTO studySelect(int study_no) throws DataAccessException {
		return sqlSession.selectOne("study.studySelect", study_no);
	}

	//선택한 내용 리스트 가져오기
	@Override
	public List<ScontentDTO> scontentListSelect(int study_no) throws DataAccessException {
		return sqlSession.selectList("study.scontentListSelect",study_no);
	}
	
	//선택한 이미지 리스트 가져오기
	@Override
	public List<SimgDTO> simgListSelect(int study_no) throws DataAccessException {
		return sqlSession.selectList("study.simgListSelect",study_no);
	}

	//내용 순서번호 max값 가져오기
	@Override
	public int scontentMaxOrder(int study_no) throws DataAccessException {
		return sqlSession.selectOne("study.scontentMaxOrder",study_no);
	}

	//이미지 순서번호 max값 가져오기
	@Override
	public int simgMaxOrder(int study_no) throws DataAccessException {
		return sqlSession.selectOne("study.simgMaxOrder",study_no);
	}
	
	
	//study테이블만 수정
	@Override
	public int studyModify(StudyDTO studyDTO) throws DataAccessException {
		return sqlSession.update("study.studyModify",studyDTO);
	}
	
	//scontent 기존내용 삭제 후 다시 입력
	@Override
	public void scontentModify(List<ScontentDTO> scontentList,int study_no) throws DataAccessException {
		sqlSession.delete("study.scontentDelete",study_no);
		for(ScontentDTO scontent : scontentList) {
			scontent.setStudy_no(study_no);
			sqlSession.insert("study.scontentModify",scontent);
		}
		
	}
	
	
	//simg 삭제 (수정요청시)
	@Override
	public void simgDelete(int[] deleteFile,int study_no) throws DataAccessException {
		if(deleteFile!=null) {
			for(int deleteImg : deleteFile) {
				SimgDTO simg = (SimgDTO)sqlSession.selectOne("study.simgSelect",deleteImg);
				String dbPath = simg.getSimg_name();
				String[] dbPathSplit = dbPath.split("/"); //split에 뒤에 인자에 -1넣으면 공백도 인식
				String realPath =RealPath +"\\"+dbPathSplit[1]+"\\"+dbPathSplit[2];
				
				
				File delfile = new File(realPath);
				if(delfile.exists()) {
					try{
						delfile.delete();
						sqlSession.delete("study.simgDelete",simg);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		}
		
	}

	//이미지 수정, 그리고 추가까지
	@Override
	public void simgModify(int[] modifyFile, int[] reposition, int[] repositionValue, List<SimgDTO> simgList,
			List<MultipartFile> files ,int study_no) throws DataAccessException {
			
		//수정파일 일단 삭제
		if(modifyFile!=null) {
			for(int deleteImg :modifyFile) {
				SimgDTO simg = (SimgDTO)sqlSession.selectOne("study.simgSelect",deleteImg);
				String dbPath = simg.getSimg_name();
				String[] dbPathSplit = dbPath.split("/"); //split에 뒤에 인자에 -1넣으면 공백도 인식
				String realPath =RealPath +"\\"+dbPathSplit[2]+"\\"+dbPathSplit[3];
				File delfile = new File(realPath);
				if(delfile.exists()) {
					try{
						delfile.delete();
						sqlSession.delete("study.simgDelete",deleteImg);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		//기존 파일들 순서 다시 정해주기 삭제 후 남은 파일들 순서 재정리 해준다.
		//후에 새로운 파일들은 order_no에 따라 위치가 조정된다.
		if(reposition!=null) {	
			for(int i=0;i<repositionValue.length;i++) {
					Map<String,Object> orderFix = new HashMap<String,Object>();
					System.out.println("resposition["+i+"] = "+reposition[i] );
					System.out.println("repositionValue["+i+"] = "+repositionValue[i] );
					orderFix.put("simg_no",reposition[i]);
					orderFix.put("simg_order_no",repositionValue[i]);
					sqlSession.update("study.simgOrder",orderFix);
			}
		}
		
		//파일 새로이 저장
		String fileDirPath = RealPath+"\\"+study_no;
		File fileDir = new File(fileDirPath); 
		if(!fileDir.exists()) {
			try {
				fileDir.mkdirs(); //mkdir 상위폴더 없을 경우 생성 X mkdirs 상위폴더까지 생성
			}catch(Exception e) {
				e.getStackTrace();
			}		
		}
		
		int k=0;
		
		for(int i=0;i<files.size();i++) {
			MultipartFile file = files.get(i); //file과 simgDTO는 1:1 맵핑된다.
			SimgDTO simg=null;
			//파일이 비어있지 않을때
			if(!file.isEmpty()) {
				//simgList의 is_upload가 1인 simgDTO만 업로드 처리한다 (이 DTO는 수정된 파일도 포함되어있다.)
				while(true) {
					if(simgList.get(k).getIs_upload()==1) {
						simg = simgList.get(k);
						k++;
						break;
					}
					k++;
				}
				String imgSavingName = System.currentTimeMillis()+i+file.getOriginalFilename();
				String saveFile = fileDirPath+"\\"+imgSavingName;
				try {
					file.transferTo(new File(saveFile)); //파일 생성
					String simg_name = DBPath +study_no+"/"+imgSavingName; //파일 생성이 되었을시 DB저장명
					simg.setSimg_name(simg_name);
					simg.setStudy_no(study_no);
					sqlSession.insert("study.simgWrite",simg);
				}catch (Exception e) {
					e.printStackTrace();
				}				
			}
		}
		
		

		
		
	}

}
