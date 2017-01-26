package com.project.board.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.board.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert",dto);
		
	}

	@Override
	public boolean idCheck(String id) {
		String resultId =session.selectOne("users.existId", id);
		if(resultId==null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean isValid(UsersDto dto) {
		String validId = session.selectOne("users.isValid",dto);
		if(validId==null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto = session.selectOne("users.getData",id);
		
		return dto;
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
		
	}

	@Override
	public List<UsersDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
