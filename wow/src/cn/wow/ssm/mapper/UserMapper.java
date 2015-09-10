package cn.wow.ssm.mapper;

import cn.wow.ssm.po.User;

public interface UserMapper {
	
	public User findUserByCriteria(User user) throws Exception;
	public void insertUser(User user) throws Exception;
	public void activeUpdateUser(User user) throws Exception;
	public User selectPasswordByUsername(String username) throws Exception; 
	public void updatePassword(User user) throws Exception;

}
