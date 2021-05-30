package com.my.blog.study.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SimgDTO {
	private int simg_no; 
	private String simg_name;
	private String simg_width;
	private String simg_height;
	private int study_no;
	private int simg_order_no;
	private int is_upload=0;
	private List<SimgDTO> simgList;
	
}
