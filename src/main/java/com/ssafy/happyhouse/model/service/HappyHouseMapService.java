package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.WordDto;

public interface HappyHouseMapService {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseInfoDto> getAptName(String aptNam, double lat, double lng) throws Exception;
	void insert(UserDto userDto) throws Exception;
	void wordInsert(String aptNam) throws Exception;
	void wordCount(String aptNam) throws Exception;
	List<WordDto> selectTop() throws Exception;
	List<HouseInfoDto> getAptName(String aptName) throws Exception;
}
