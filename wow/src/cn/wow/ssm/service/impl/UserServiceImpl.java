package cn.wow.ssm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wow.ssm.mapper.UserMapper;
import cn.wow.ssm.po.User;
import cn.wow.ssm.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;
	
	public User findUserByCriteria(User user) throws Exception {
		
		return userMapper.findUserByCriteria(user);
	}

	public void insertUser(User user) throws Exception {
		userMapper.insertUser(user);
		
	}

	public void activeUpdateUser(User user) throws Exception {
		userMapper.activeUpdateUser(user);
		
	}

	@Override
	public User selectPasswordByUsername(String username) throws Exception {
		
		return userMapper.selectPasswordByUsername(username);
	}

	@Override
	public void updatePassword(User user) throws Exception {
		userMapper.updatePassword(user);
		
	}
	
	
	


	
	

}
