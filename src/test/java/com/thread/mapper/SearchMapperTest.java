package com.thread.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thread.domain.Criteria;
import com.thread.domain.PostVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SearchMapperTest {
	
	@Autowired
	private SearchMapper mapper;
	
	@Test
	public void getSearchListTest() {
		
		Criteria cri = new Criteria();
		// 테스트 키워드
		//cri.setKeyword("test");
		cri.setKeyword("테스트");
		System.out.println("cri : " + cri);
		
		List<PostVO> list = mapper.getSearchList(cri);
		System.out.println("list : " + list);
		
		System.out.println("==========");
		int searchTotal = mapper.searchGetTotal(cri);
		System.out.println("totla : " + searchTotal);
		
	}

}
