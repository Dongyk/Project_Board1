package com.project.board.users.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public void idCheck(String id,HttpServletRequest request) {
		boolean canUse = usersDao.idCheck(id);
		
		request.setAttribute("canUse", canUse);
	}

	@Override
	public boolean isValid(UsersDto dto) {
		boolean success =usersDao.isValid(dto);
		
		return success;
	}
	
	@Override
	public boolean isAdmin(UsersDto dto) {
		boolean success =usersDao.isAdmin(dto);
		return success;
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto =usersDao.getData(id);
		
		return dto;
	}

	@Override
	public void update(UsersDto dto) {
		usersDao.update(dto);
		
	}

	@Override
	public List<UsersDto> getList() {
		return usersDao.getList();
	}
	
}