package com.project.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dto.BoardDto;
import com.project.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/board/total_board")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum){
		
		//글목록이 담겨 있는 ModelAndView 객체를 리턴 받는다.
		ModelAndView mView=boardService.getList(request, pageNum);
		//뷰페이지의 정보 설정하고
		mView.setViewName("board/total_board");
		//리턴해준다.
		return mView;
	}
	
	@RequestMapping("/board/gallery")
	public ModelAndView gallery(){
		
		ModelAndView mView=boardService.getTotal_image();
		
		mView.setViewName("board/gallery");
		
		return mView;
	}
	

	
	
	
}

















