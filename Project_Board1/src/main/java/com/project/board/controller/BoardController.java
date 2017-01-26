package com.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/board1")
	public ModelAndView board(HttpServletRequest request, @RequestParam(defaultValue="1") int b_group){
		ModelAndView mView = boardService.getList(request, b_group);
		return mView;
	}
}
