package com.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dto.BoardDto;
import com.project.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/board1")
	public ModelAndView board(HttpServletRequest request, @RequestParam(defaultValue="1") int b_group){
		ModelAndView mView = boardService.getList(request, b_group);
		mView.setViewName("board/board1");
		return mView;
	}
	@RequestMapping("/board/insertform")
	public ModelAndView insertForm(HttpServletRequest request, @RequestParam(defaultValue="1") int b_group){
		ModelAndView mView = new ModelAndView();
		System.out.println("insertform : " + b_group);
		mView.addObject("b_group", b_group);
		mView.setViewName("board/insertform");
		return mView;
	}
	
	@RequestMapping("/board/board_update")
	public ModelAndView update(HttpServletRequest request, @RequestParam int num){
		ModelAndView mView = boardService.updateForm(request, num);
		mView.setViewName("board/updateform");
		return mView;
	}
	@RequestMapping("/board/board_delete")
	public ModelAndView delete	(HttpServletRequest request, @RequestParam int b_group, @RequestParam(defaultValue="1") int num){
		boardService.delete(num);
		ModelAndView mView=boardService.getList(request, b_group);
		mView.addObject("b_group", b_group);
		mView.setViewName("board/board1");
		return mView;
	}
	@RequestMapping("/board/upload_comm")
	public String insert (HttpServletRequest request, @ModelAttribute BoardDto dto){
		String b_group = ""+dto.getB_group();
		System.out.println("b_group : " + b_group);
		dto.setWriter("DK");
		boardService.insert(request, dto);
		
		return "redirect:/board/board1.do?b_group="+b_group;
	}
}
