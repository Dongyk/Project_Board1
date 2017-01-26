package com.project.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface BoardService {
	
	// 글목록 리턴해주는 메소드
	public ModelAndView getList(HttpServletRequest request, int pageNum);

}
