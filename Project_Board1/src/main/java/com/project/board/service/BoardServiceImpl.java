package com.project.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dao.BoardDao;
import com.project.board.dto.BoardDto;

@Controller
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao boardDao;
	
	@Override
	public ModelAndView getList(HttpServletRequest request, int b_group) {
		final int PAGE_DISPLAY_COUNT=3;
				
		String endPageNum = request.getParameter("endPageNum");

		if(endPageNum == null){
			endPageNum = ""+PAGE_DISPLAY_COUNT;
		}
		//시작 row 번호와 끝 row 번호를 dto 에 담는다. 
		BoardDto dto=new BoardDto();
		dto.setStartRowNum(1);
		dto.setEndRowNum(Integer.parseInt(endPageNum));
		dto.setB_group(b_group);
		
		//1. BoardDao 객체를 이용해서 글목록을 얻어온다. 
		List<BoardDto> list=boardDao.getSelList(dto);
		
		String endRowNum =  "" + boardDao.getSelect_list(b_group);
		//2. 모델을 request 에 담는다.
		ModelAndView mView = new ModelAndView();
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("endRowNum", endRowNum);
		mView.addObject("list", list);
		
		mView.addObject("b_group", b_group);
		return mView;
	}

	@Override
	public void insert(BoardDto dto) {
		boardDao.insert(dto);
		
	}

	@Override
	public void update(BoardDto dto) {
		boardDao.update(dto);
		
	}

	@Override
	public void delelte(int num) {
		boardDao.delete(num);
		
	}

	@Override
	public ModelAndView updateForm(HttpServletRequest request, int num) {
		//수정할 글정보를 얻어온다. 
		BoardDto dto=boardDao.getData(num);
		//수정할 글정보를 ModelAndView 객체에 담고 
		ModelAndView mView=new ModelAndView();
		mView.addObject("dto", dto);
		//리턴해준다. 
		return mView;
	}

	@Override
	public ModelAndView insertForm(int b_group) {
		// TODO Auto-generated method stub
		return null;
	}

}
