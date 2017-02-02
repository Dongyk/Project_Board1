package com.project.board.dao;

import java.util.List;

import com.project.board.dto.BoardDto;

public interface BoardDao {
	public void insert(BoardDto dto);
	public void delete(int num);
	public void update(BoardDto dto);
	public BoardDto getData(int num);
	public List<BoardDto> getSelList(BoardDto dto);
	public List<BoardDto> getList(BoardDto dto);
	public int getCount(BoardDto dto);
	public int getSelect_list(int b_group);
	public List<BoardDto> getTotal_image();
	public int getCount1();
	public List<BoardDto> getList1(BoardDto dto);

}

















