package com.my.blog.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;
import com.my.blog.study.dao.StudyDAO;
import com.my.blog.study.dto.SimgDTO;

@Controller
public class FileUtilPro {
	
	private static final String RealPath="c:\\uploadFiles";
	private static final String DBPath="/imgfile/";
	
	
	@Autowired
	private StudyDAO studyDAO;
	
	public static void deleteFile(File delfile) {
		if(delfile.exists()) {
			try{
				delfile.delete();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void uploadFile() {
		
	}
	
	public static void makeFolder(File fileDir) {
		if(!fileDir.exists()) {
			try {
				fileDir.mkdirs(); //mkdir 상위폴더 없을 경우 생성 X mkdirs 상위폴더까지 생성
			}catch(Exception e) {
				e.getStackTrace();
			}		
		}
	}
	
	//브라우저로 전송할 때 썸네일 이미지로 만들어서 내보내는 요청
	@RequestMapping("/thumbnail")
	protected void thumbnails(@RequestParam(value="study_no",required=false)int study_no,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String realPath = "";
		realPath = getFirstFileRealPath(study_no);
		if(!realPath.equals("")) {
			File thumb = new File(realPath);
			if(thumb.exists()) {
				BufferedImage originalImage = ImageIO.read(thumb); //thumb파일을 buffered이미지로 타입변환
			      MultiStepRescaleOp rescale = new MultiStepRescaleOp(350, 350); //java-image-scaling 라이브러리로 사이즈 변환
			      rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft); //선명도 설정     
			      BufferedImage thumbImage = rescale.filter(originalImage, null); //오리지날 파일을 사이즈변환과 선명도 입혀서 버퍼이미지 생성
			      ImageIO.write(thumbImage,"png",out); //outputStream으로 전송
			}
		}
		out.close();
		
	}
	
	//실제 이미지의 경로를 가져와주는 메서드
	private String getFirstFileRealPath(int study_no) {
		List<SimgDTO> simgList = null;
		simgList = studyDAO.simgListSelect(study_no);
		
		String realPath="";
		if(simgList!=null) {
			SimgDTO simg = simgList.get(0);
			String dbPath = simg.getSimg_name();
			String[] dbPathSplit = dbPath.split("/"); //split에 뒤에 인자에 -1넣으면 공백도 인식
			realPath =RealPath +"\\"+dbPathSplit[2]+"\\"+dbPathSplit[3];
		}
		return realPath;
	}
}
