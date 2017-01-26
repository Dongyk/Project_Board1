package com.project.board.dao;

import java.util.List;

import com.project.board.dto.BoardDto;

public interface BoardDao {
	public List<BoardDto> getList(BoardDto dto);	
	// 전체 글 갯수 리턴해주는 메소드
	public int getCount();
	
}

















