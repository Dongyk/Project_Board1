package com.project.board.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.users.dto.UsersDto;
import com.project.board.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/signupform")
	public String signupform(){
		return "users/signupform";
	}
	
	@RequestMapping("/users/signup")
	public String signup(@ModelAttribute UsersDto dto){
		usersService.insert(dto);
		
		return "redirect:/home.do";
	}
}


















