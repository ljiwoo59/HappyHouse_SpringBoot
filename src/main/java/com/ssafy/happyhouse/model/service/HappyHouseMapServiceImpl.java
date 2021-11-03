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
	public List<HouseInfoDto> getAptName(String aptName, double lat, double lng) throws Exception {
		List<HouseInfoDto> list = sqlSession.getMapper(HouseMapMapper.class).getAptName(aptName);
		if (!list.isEmpty()) {
			
			// 퀵정렬
			for (HouseInfoDto h : list) {
				double hlat = Double.parseDouble(h.getLat());
				double hlng = Double.parseDouble(h.getLng());
				
				double length = Math.sqrt(Math.pow(lat - hlat, 2) + Math.pow(lng - hlng,2));
				h.setLength(length);
			}
			
			quick(list, 0, list.size()-1);
			
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
	
	private static void quick(List<HouseInfoDto> list, int lo, int hi) {
		if(lo >= hi)
			return;
		int pivot = partition(list, lo, hi);
		
		quick(list, lo, pivot);
		quick(list, pivot + 1, hi);
	}
	
	private static int partition(List<HouseInfoDto> list, int left, int right) {
		int lo = left - 1;
		int hi = right + 1;
		double pivot = list.get((left + right) / 2).getLength();
		while(true) {
			do {
				lo++;
			}while(list.get(lo).getLength() < pivot);
			
			do {
				hi--;
			}while(list.get(hi).getLength() > pivot && lo <= hi);
			if(lo >= hi) {
				return hi;
			}
			
			swap(list, lo, hi);
		}
		
	}
	
	private static void swap(List<HouseInfoDto> list, int a, int b) {
		HouseInfoDto temp = list.get(a);
		list.set(a, list.get(b));
		list.set(b, temp);
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

}
