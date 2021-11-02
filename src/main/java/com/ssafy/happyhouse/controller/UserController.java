package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.service.UserService;

@RestController
@RequestMapping("/mypage")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@GetMapping(value="/{id}")
	public UserDto selectOne(@PathVariable String id) {
		return service.selectOne(id);
	}
	
	@PutMapping
	public Map<String, String> update(@RequestBody UserDto c) { //@RequestBody: json -> java
		service.update(c);
		
		Map<String, String> map = new HashMap<>();
		map.put("result", "수정 성공!");
		return map;
	}
	
	@DeleteMapping(value="{id}")
	public Map<String, String> delete(@PathVariable String id) {
		service.delete(id);
		
		Map<String, String> map = new HashMap<>();
		map.put("result", "삭제 성공!");
		return map;
	}
}
