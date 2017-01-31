package com.project.board.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert", dto);
		
	}

	@Override
	public void delete(int num) {
		session.delete("board.delete", num);
		
	}

	@Override
	public void update(BoardDto dto) {
		session.update("board.update", dto);
		
	}

	@Override
	public BoardDto getData(int num) {
		BoardDto dto=session.selectOne("board.getData", num);
		return dto;
	}

	@Override
	public List<BoardDto> getSelList(BoardDto dto) {
		List<BoardDto> list=session.selectList("board.getSelList", dto);
		return list;
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		List<BoardDto> list=session.selectList("board.getList", dto);
		return list;
	}

	@Override
	public int getCount(BoardDto dto) {
		int result=session.selectOne("board.getCount", dto);
		return result;
	}

	@Override
	public int getSelect_list(int b_group) {
		int result=session.selectOne("board.getSelect_list", b_group);
		return result;
	}

	@Override
	public List<BoardDto> getTotal_image() {
		List<BoardDto> list=session.selectList("board.getTotal_image");
		return list;
	}
	
	@Override
	public int getCount1() {		
		int count=session.selectOne("board.getCount1");
		return count;
	}
	@Override
	public List<BoardDto> getList1(BoardDto dto) {		
		List<BoardDto> list=session.selectList("board.getList1", dto);		
		return list;
	}

}




















