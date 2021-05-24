package com.myportfolio.mypage.study.dto;

import java.util.Date;

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
public class StudyDTO {
	private int study_no;
	private String study_title;
	private String member_id;
	private Date study_date;
	private int study_delete;
	private int so_no;
	private int dae_no;
	
}
