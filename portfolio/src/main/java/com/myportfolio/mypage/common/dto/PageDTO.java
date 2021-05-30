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
	
	
	public PageDTO(int currentPage,int total,int count){
		if(total==0) {
			this.currentPage=0;
			this.startPage=0;
			this.endPage=0;
			this.totalPage=0;			
		}else {
			this.count=count;
			this.total=total;
			this.currentPage=currentPage;
			this.totalPage=total/count;
			if(total%count>0)  totalPage++; //나머지가 0이상일때 전체페이지 1추가
			int mod=this.currentPage%10; //현재 페이지가  10 단위인걸 파악하기 위한 식
			this.startPage=(this.currentPage/10)*10+1; //현재 페이지를 10으로 나누면 정수단위로만 나온다 여기서 다시 10을 곱해주고 +1을 해주면 시작페이지
			if(mod==0) 	this.startPage-=10; //나머지가 0 (현재페이지가 10 20 단위일경우 첫페이지는 1, 11이다 )
			this.endPage=this.startPage+9; //시작페이지 1 , 11 -> 끝페이지 10,20
			if(this.endPage>this.totalPage) this.endPage=this.totalPage;  // 총페이지가 끝페이지보다 작을때 끝페이지가 총페이지로 되게 한다.
			}
		}
}
