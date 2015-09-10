package cn.wow.ssm.vo;

import java.util.List;

import cn.wow.ssm.po.ItemClassify;

public class Classify {
	private ItemClassify firstClassify;                         //一级分类
	private List<ItemClassify> secondClassify;                  //二级分类
	private List<ItemPicture> itemPictures;                     //商品和图片的信息
	private ItemPicture recommendItem;                          //每个分类下面的商品
	public ItemClassify getFirstClassify() {
		return firstClassify;
	}
	public void setFirstClassify(ItemClassify firstClassify) {
		this.firstClassify = firstClassify;
	}
	public List<ItemClassify> getSecondClassify() {
		return secondClassify;
	}
	public void setSecondClassify(List<ItemClassify> secondClassify) {
		this.secondClassify = secondClassify;
	}
	public List<ItemPicture> getItemPictures() {
		return itemPictures;
	}
	public void setItemPictures(List<ItemPicture> itemPictures) {
		this.itemPictures = itemPictures;
	}
	public ItemPicture getRecommendItem() {
		return recommendItem;
	}
	public void setRecommendItem(ItemPicture recommendItem) {
		this.recommendItem = recommendItem;
	}
	
	

	
	

}
