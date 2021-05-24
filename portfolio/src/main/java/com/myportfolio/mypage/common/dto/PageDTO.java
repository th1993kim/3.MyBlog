package com.myportfolio.mypage.common.dto;

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
public class PageDTO {
	private int total;
	private int count;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	
	
	public PageDTO(int currentPage,int total){
		if(total==0) {
			this.currentPage=0;
			this.startPage=0;
			this.endPage=0;
			this.totalPage=0;
		}
	}
	
	
}
