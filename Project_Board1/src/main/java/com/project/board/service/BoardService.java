package com.project.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int b_group);
}
