package com.project.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.dto.BoardDto;


@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public int getCount() {
		
		int count=session.selectOne("board.getCount");
	
		return count;

	}


	@Override
	public List<BoardDto> getList(BoardDto dto) {
		
		List<BoardDto> list=session.selectList("board.getList", dto);
		
		return list;
	}


	@Override
	public List<BoardDto> getTotal_image() {
		
		List<BoardDto> list = session.selectList("board.getTotal_image");
		
		return list;
	}

	
	
}




















