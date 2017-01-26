package com.project.board.users.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.board.users.dao.UsersDao;
import com.project.board.users.dto.UsersDto;

@Component
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public void insert(UsersDto dto) {
		usersDao.insert(dto);
		
	}

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isValid(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UsersDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}