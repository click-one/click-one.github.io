package cn.wow.ssm.vo;

import java.util.List;

import cn.wow.ssm.po.ItemInfoPic;

public class ItemDetailsRef {
	private ItemPicture itemPicture;         //商品的详细信息和图片
	private List<ItemInfoPic> itemInfoPics;  //五张详细的图片
	private Integer totalComment;            //当前总的评价数
	private List<ItemPicture> hotSell;       //商品的推荐信息
	public ItemPicture getItemPicture() {
		return itemPicture;
	}
	public void setItemPicture(ItemPicture itemPicture) {
		this.itemPicture = itemPicture;
	}
	public List<ItemInfoPic> getItemInfoPics() {
		return itemInfoPics;
	}
	public void setItemInfoPics(List<ItemInfoPic> itemInfoPics) {
		this.itemInfoPics = itemInfoPics;
	}
	public Integer getTotalComment() {
		return totalComment;
	}
	public void setTotalComment(Integer totalComment) {
		this.totalComment = totalComment;
	}
	public List<ItemPicture> getHotSell() {
		return hotSell;
	}
	public void setHotSell(List<ItemPicture> hotSell) {
		this.hotSell = hotSell;
	}
	
	

}
