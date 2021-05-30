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
public class ScontentDTO {
	private int scontent_no; 
	private String scontent_content;
	private String scontent_color;
	private String scontent_size;
	private int scontent_weight;
	private int study_no;
	private int scontent_order_no;
	private List<ScontentDTO> scontentList;
	
}
