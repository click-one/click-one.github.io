package cn.wow.ssm.service;

import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.UserCollect;
import cn.wow.ssm.vo.ItemNumPic;

public interface CartService {
	public List<Item> selectItemById(Integer[] ids)throws Exception;
	public void insertUserCollect(UserCollect userCollect)throws Exception;
	public UserCollect selectUserCollect(UserCollect userCollect)throws Exception;
	public List<ItemPic> selectItemPic(Integer[] ids) throws Exception;
	public List<ItemNumPic> selectItemAndPic(Integer [] ids) throws Exception;

}
