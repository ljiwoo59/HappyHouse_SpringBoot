package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.WordDto;

public interface WordMapper {
	void wordInsert(String word);
	void wordCount(String word);
	List<WordDto> selectTop();
	WordDto selectOne(String word);
}
