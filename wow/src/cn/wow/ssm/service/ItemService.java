package cn.wow.ssm.service;

import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.RollPic;
import cn.wow.ssm.vo.Index;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.ItemSortName;
import cn.wow.ssm.vo.PageBean;

public interface ItemService {
	public void insertItem1(Item item,ItemPic itemPic);
	/**
	 * 取得所有的一级二级分类，并且将其一级分类作为其Map的key,二级是一个list作为Map的value,将其存放在一个list里面
	 * @return
	 */
	public Index getIndex();
	public PageBean<ItemPicture> ItemOrder(ItemSortName itemSortName);
	public PageBean<ItemPicture> selectItemFuzzy(ItemSortName itemSortName);
	public ItemPicture selectItemById(Integer id);
	public void insertRollPic(RollPic rollPic);
	public List<RollPic> getRollPic();
	

}
