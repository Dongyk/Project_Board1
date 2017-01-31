package com.project.board.users.dao;

import java.util.List;

import com.project.board.users.dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public boolean idCheck(String id);
	public boolean isValid(UsersDto dto);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public List<UsersDto> getList();
	boolean isAdmin(UsersDto dto);
}
