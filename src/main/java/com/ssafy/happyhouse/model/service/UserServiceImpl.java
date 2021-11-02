package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<UserDto> selectAll() {
		return sqlSession.getMapper(UserMapper.class).selectAll();
	}

	@Override
	public UserDto selectOne(String id) {
		return sqlSession.getMapper(UserMapper.class).selectOne(id);
	}

	@Override
	public int insert(UserDto c) {
		return sqlSession.getMapper(UserMapper.class).insert(c);
	}

	@Override
	public int delete(String id) {
		return sqlSession.getMapper(UserMapper.class).delete(id);
	}

	@Override
	public List<UserDto> findByAddress(String address) {
		return sqlSession.getMapper(UserMapper.class).findByAddress(address);
	}

	@Override
	public int update(UserDto c) {
		return sqlSession.getMapper(UserMapper.class).update(c);
	}

	@Override
	public int idCheck(String checkId) throws Exception {
		return sqlSession.getMapper(UserMapper.class).idCheck(checkId); // 0 or 1
	}

	@Override
	public UserDto login(Map<String, String> map) throws Exception {
		return sqlSession.getMapper(UserMapper.class).login(map);
	}

}
