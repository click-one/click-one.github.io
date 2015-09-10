package cn.wow.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wow.ssm.mapper.CartMapper;
import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.UserCollect;
import cn.wow.ssm.service.CartService;
import cn.wow.ssm.vo.ItemNumPic;
@Service
public class CartServiceImpl implements CartService{

	@Resource
	private CartMapper cartMapper;
	@Override
	public List<Item> selectItemById(Integer[] ids) throws Exception{
		
		return cartMapper.selectItemById(ids) ;
	}
	@Override
	public void insertUserCollect(UserCollect userCollect)throws Exception {

		cartMapper.insertUserCollect(userCollect);
	}
	@Override
	public UserCollect selectUserCollect(UserCollect userCollect)throws Exception {
		
		return cartMapper.selectUserCollect(userCollect);
	}
	@Override
	public List<ItemPic> selectItemPic(Integer[] ids) throws Exception {
		
		return cartMapper.selectItemPic(ids);
	}
	
	public List<ItemNumPic> selectItemAndPic(Integer []ids) throws Exception {
		System.out.println("--------------asdf-------------"+cartMapper.selectItemAndPic(ids).size());
		return cartMapper.selectItemAndPic(ids);
	}
	
	
	

	
}
