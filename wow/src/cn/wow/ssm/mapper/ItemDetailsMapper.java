package cn.wow.ssm.mapper;

import java.util.List;

import cn.wow.ssm.po.ItemInfoPic;
import cn.wow.ssm.po.UserComment;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.ItemSortName;
import cn.wow.ssm.vo.UserAndComment;

public interface ItemDetailsMapper {
	public List<UserAndComment> selectUserComment(ItemSortName itemSortName);
	public List<ItemInfoPic> selectItemInfoPic(Integer item_id);
	public ItemPicture selectItemPic (Integer item_id);
	public Integer selectCountUserComment(Integer item_id);
	public void insertUserComment(UserComment userComment);
	public List<ItemPicture> selectHotSell();

}
