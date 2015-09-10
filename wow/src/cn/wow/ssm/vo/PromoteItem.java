package cn.wow.ssm.vo;

import java.util.List;

import cn.wow.ssm.po.RollPic;

/**
 * 首页促销的相关商品
 * @author lvlei
 *
 */
public class PromoteItem {
	private List<RollPic> rollPics;           //轮播图的信息
	private List<ItemPicture> halfItems;      //天天半价              数据库商品打折信息为半价的商品
	private List<ItemPicture> dayRecommends;  //每日推荐              根据数据库销量最高的商品
	private List<ItemPicture> lowPrice;       //天天秒杀               根据价格最低的商品
	public List<RollPic> getRollPics() {
		return rollPics;
	}
	public void setRollPics(List<RollPic> rollPics) {
		this.rollPics = rollPics;
	}
	public List<ItemPicture> getHalfItems() {
		return halfItems;
	}
	public void setHalfItems(List<ItemPicture> halfItems) {
		this.halfItems = halfItems;
	}
	public List<ItemPicture> getDayRecommends() {
		return dayRecommends;
	}
	public void setDayRecommends(List<ItemPicture> dayRecommends) {
		this.dayRecommends = dayRecommends;
	}
	public List<ItemPicture> getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(List<ItemPicture> lowPrice) {
		this.lowPrice = lowPrice;
	}
	

}
