package com.project.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.project.board.dto.BoardDto;


public interface BoardService {
	
	// 글목록 리턴해주는 메소드
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	
	//이미지 리턴해주는 메소드
	public ModelAndView getTotal_image();

}
