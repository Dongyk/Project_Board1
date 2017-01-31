package com.project.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//test
	@RequestMapping("/home")
	public String home() {

		
		return "/home";
	}
	
}








