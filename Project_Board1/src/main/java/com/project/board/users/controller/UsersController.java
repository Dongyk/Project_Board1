package com.project.board.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.board.users.dto.UsersDto;
import com.project.board.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/idcheck")
	public String idcheck(@RequestParam String id,HttpServletRequest request){
		usersService.idCheck(id,request);
		
		return "users/idcheck";
	}
	
	@RequestMapping("/users/signupform")
	public String signupform(){
		return "users/signupform";
	}
	
	@RequestMapping("/users/signup")
	public String signup(@ModelAttribute UsersDto dto){
		usersService.insert(dto);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("/users/signin")
	public String signin(@ModelAttribute UsersDto dto,HttpSession session){
		if(session.getAttribute("id")!=null){
			session.invalidate();
		}
		boolean success = usersService.isValid(dto);
		if(success){
			session.setAttribute("id", dto.getId());
			return "redirect:/home.do";
		}else{
			return "users/signupform";
		}
	}
	
	@RequestMapping("/users/signout")
	public String signout(HttpSession session){
		session.invalidate();
		
		return "redirect:/home.do";
	}
}


















