package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.WordDto;
import com.ssafy.happyhouse.model.service.HappyHouseMapService;

@RestController
@RequestMapping("/word")
public class WordController {

	@Autowired
	HappyHouseMapService service;
	
	@GetMapping
	public ResponseEntity<List<WordDto>> selectTop() throws Exception {
		return new ResponseEntity<List<WordDto>>(service.selectTop(), HttpStatus.OK);
	}
	
}
