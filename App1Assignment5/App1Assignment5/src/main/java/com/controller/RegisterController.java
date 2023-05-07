package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Users;
import com.service.BookService;
import com.service.LoginService;

@Controller
public class RegisterController {

	@Autowired
	Users user;
	@Autowired
	BookService displayBooks;
	@Autowired
	LoginService loginService;
	
  
	
    @RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerUser() {

        return "redirect:register.jsp";
	}
	
	@PostMapping("/register") // for post method mapping
	public String regUser(HttpServletRequest request, HttpServletResponse response) {


		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");

		user.setUname(uname);
		user.setPass(pass);

		System.out.println(user);
		loginService.saveUser(user, "POST");

		return "redirect:login.jsp";
	}

}
