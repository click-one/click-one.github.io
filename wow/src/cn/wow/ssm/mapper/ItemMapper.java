package cn.wow.ssm.mapper;

import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemClassify;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.RollPic;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.ItemSortName;

public interface ItemMapper {
	public void insertItem(Item item);
	public void insertItemPic(ItemPic itemPic);
	public List<ItemClassify> gainFirstClassify();
	public List<ItemClassify> gainSecondClassify();
	public Integer[] selectIdBySecondClassify(Integer id);
	public List<Item> selectItemByIds(Integer []ids);
	public List<ItemPic> selectItemPicByIds(Integer []ids);
	public Integer[] selectIdByFirstClassify(Integer id);
	public List<Item> ItemOrder(ItemSortName itemsortName);
	public List<Item> selectItemFuzzy(ItemSortName itemSortName);
	public Integer countItemOrder(ItemSortName itemSortName);
	public Integer CountSelectItemFuzzy(ItemSortName itemSortName);
	public List<ItemPicture> selectItemAndPic();
	public ItemPicture selectItemById(Integer id);
	public List<RollPic> selectRollPic();
	public void insertRollPic(RollPic rollPic);
}
