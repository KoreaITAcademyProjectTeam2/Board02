package com.thread.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thread.domain.SampleDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/test/*")
@AllArgsConstructor
public class TestController {
    
	
	@RequestMapping("/example")
    public String example(SampleDTO dto) {
    	log.info("" + dto);
    	
    	return "example";
    }
    /*이를 사용하면 쿼리스트링(검색창에서 물음표 뒤에 나오는 문장
     * http://localhost:8081/test/example?name=asd&age=10
     * 위에서 example?name=asd&age=10 asd, age 부분)
     * get매핑을 통해 사용.
     */
	
	@GetMapping("/example2")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		log.info(name);
		log.info(age);
		
		return "example2";
	}
}
