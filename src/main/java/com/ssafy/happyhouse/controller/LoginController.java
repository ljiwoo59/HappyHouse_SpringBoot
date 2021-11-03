package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("user/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService service;
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) throws Exception {
		logger.debug("map : {}", map.get("id"));
		logger.debug("map : {}", map.get("password"));
		UserDto userDto = service.login(map);
		if (userDto != null) {
			session.setAttribute("userinfo", userDto);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
			return "user/login";
		}
	}
	@GetMapping("/register")
	public String register() {
		return "user/join";
	}
	
	@PostMapping("/register")
	public String register(UserDto userDto, Model model) throws Exception{
		logger.debug("id : {}" , userDto.getId());
		logger.debug("pwd : {}" , userDto.getPassword());
		logger.debug("name : {}" , userDto.getName());
		logger.debug("address : {}" , userDto.getAddress());
	
		service.insert(userDto);
		if(userDto.getId() != null) {
			return "redirect:/";
		}else {
			model.addAttribute("msg", "회원 가입에 실패하셨습니다.");
			return "user/register";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userinfo", null);
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String myPage() {
		return "userinfo";
	}
	
	@PostMapping("/update")
	public String update(UserDto userDto, HttpSession session) {		
		service.update(userDto);
		session.setAttribute("userinfo", userDto);
		return "redirect:/";
	}
	
	@PostMapping("/delete")
	public String delete(String id, HttpSession session) {
		service.delete(id);
		logout(session);
		return "redirect:/";
	}
	
	
}
