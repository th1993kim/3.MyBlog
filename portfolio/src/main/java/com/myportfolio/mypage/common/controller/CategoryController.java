package com.myportfolio.mypage.common.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.myportfolio.mypage.common.dto.DaeDTO;
import com.myportfolio.mypage.common.dto.SoDTO;

//해당 클래스는 타일즈의 동적 카테고리 메뉴를 제공하기 위한 클래스이며 tiles의 ViewPreparer의 인터페이스를 구현하여야 한다.
public class CategoryController implements ViewPreparer {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) {
		List<SoDTO> soList =  sqlSession.selectList("category.so");
		List<DaeDTO> daeList = sqlSession.selectList("category.dae");
		
		attributeContext.putAttribute("daeList",new Attribute(daeList),true);
		attributeContext.putAttribute("soList", new Attribute(soList),true);
	}

}
