package com.project.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.project.board.dto.BoardDto;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int b_group);
	
	public ModelAndView insertForm(int b_group);
	public void insert(HttpServletRequest reqeuest, BoardDto dto);
	
	public ModelAndView updateForm(HttpServletRequest request, int num);
	public void update(BoardDto dto);
	
	public void delete(int num);
}