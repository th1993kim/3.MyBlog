package com.myportfolio.mypage.common.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
 
@Getter
@Setter
@ToString 
@AllArgsConstructor
public class SearchDTO {
	private int currentPage; //현재페이지번호(요청한)
	private int dae_no; //대분류
	private int so_no; //소분류 
	private String search_title; //검색어(제목)
	private int seeCount; //불러올 글 갯수
	private int startNum; //시작번호
	private int endNum; //마지막번호

	public SearchDTO() {
		this.currentPage =1;
		this.dae_no=0;
		this.so_no=0;
		this.search_title="";
		this.seeCount=20;
	}

  
}
