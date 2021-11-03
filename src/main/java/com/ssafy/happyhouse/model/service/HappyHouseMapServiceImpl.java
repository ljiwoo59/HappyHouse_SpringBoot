package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.WordDto;
import com.ssafy.happyhouse.model.mapper.HouseMapMapper;
import com.ssafy.happyhouse.model.mapper.UserMapper;
import com.ssafy.happyhouse.model.mapper.WordMapper;

@Service
public class HappyHouseMapServiceImpl implements HappyHouseMapService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return sqlSession.getMapper(HouseMapMapper.class).getAptInDong(dong);
	}

	@Override
	public List<HouseInfoDto> getAptName(String aptName) throws Exception {
		List<HouseInfoDto> list = sqlSession.getMapper(HouseMapMapper.class).getAptName(aptName);
		if (!list.isEmpty()) {
			WordDto word = sqlSession.getMapper(WordMapper.class).selectOne(aptName);
			if (word == null) sqlSession.getMapper(WordMapper.class).wordInsert(aptName);
			else sqlSession.getMapper(WordMapper.class).wordCount(aptName);
		}

		return list;
	}

	@Override
	public void insert(UserDto userDto) throws Exception {
		sqlSession.getMapper(UserMapper.class).insert(userDto);
	}

	@Override
	public void wordInsert(String aptName) throws Exception {
		sqlSession.getMapper(WordMapper.class).wordInsert(aptName);
	}
	
	@Override
	public void wordCount(String aptName) throws Exception {
		sqlSession.getMapper(WordMapper.class).wordCount(aptName);
	}

	@Override
	public List<WordDto> selectTop() throws Exception {
		return sqlSession.getMapper(WordMapper.class).selectTop();
	}

}
