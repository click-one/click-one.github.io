package cn.wow.ssm.utils;

import java.util.ArrayList;
import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.PromoteItem;


public class ItemSortUtils{
	public static PromoteItem getPromoteItem(List<ItemPicture> itemPictures)
	{
		PromoteItem promoteItem = new PromoteItem();
		List<ItemPicture> halfItems = new ArrayList<ItemPicture>();      //天天半价              数据库商品打折信息为半价的商品
		List<ItemPicture> dayRecommends = new ArrayList<ItemPicture>();  //每日推荐              根据数据库销量最高的商品
		List<ItemPicture> lowPrices = new ArrayList<ItemPicture>();       //天天秒杀               根据价格最低的商品
		
		 for(ItemPicture itemPicture:itemPictures)
		 {
			 
			 Item item = itemPicture.getItem();
			 if(item.getDiscount()==0.5&&halfItems.size()<3)  //获取天天半价的三个商品
			 {
				 halfItems.add(itemPicture);
				 continue;
			 }
			 /////////////////////////////////////////////取得最高销量的两个item
			 if(dayRecommends.size()<2)   //dayRecommend的个数小于2时
			 {
				 
				 if(dayRecommends.size()==1 //当集合的大小为1时，则比较插入的元素和原集合元素的大小
						 &&(dayRecommends.get(0).getItem().getSaleCount()<itemPicture.getItem().getSaleCount()))
				 {
					 ItemPicture itemP = dayRecommends.get(0);//如果插入的元素大于第一个元素，则交换位置
					 dayRecommends.set(0, itemPicture);
					 dayRecommends.set(1, itemP);
				 }
				 else
				 {
					 dayRecommends.add(itemPicture);
				 }
				  
				 
				  continue;
			 }
			 
			 else
			 {
				 if(itemPicture.getItem().getSaleCount()>dayRecommends.get(0).getItem().getSaleCount())
				 {
					 dayRecommends.set(1, dayRecommends.get(0));//如果插入的元素大于集合第一个元素，将元素的第二个元素赋值为第一个元素
					 dayRecommends.set(0, itemPicture);
					 continue;
					 
				 }
				 if(itemPicture.getItem().getSaleCount()<dayRecommends.get(0).getItem().getSaleCount()
						 &&itemPicture.getItem().getSaleCount()>dayRecommends.get(1).getItem().getSaleCount())
				 {//如果插入的元素大于第一个元素小于第二个元素则将其替换到第二个元素的位置
					 dayRecommends.set(1, itemPicture);
					 continue;
				 }
			 }
			 
			 ///////////////////////////////////////////取得最低价格的两个Item
			 
			 if(lowPrices.size()<2)
			 {
				 if(lowPrices.size()==1&&  //如果元素的大小为1，且插入的元素大于第一个元素
						 itemPicture.getItem().getPrice()<lowPrices.get(0).getItem().getPrice())
				 {
					 ItemPicture itemP = lowPrices.get(0);
					 lowPrices.set(0, itemPicture);
					 lowPrices.set(1, itemP);
					 
				 }
				 else
				 {
					 lowPrices.add(itemPicture);
				 }
			 }
			 
			 
			 else
			 {  
				 
				 if(itemPicture.getItem().getPrice()>lowPrices.get(0).getItem().getPrice()&&
						 itemPicture.getItem().getPrice()<lowPrices.get(1).getItem().getPrice())
				 {
					 lowPrices.set(1, itemPicture);
				 }
				 else{
				       //如果插入的元素小于第一个元素，则将元素进行调换位置
					 if(itemPicture.getItem().getPrice()<lowPrices.get(0).getItem().getPrice())
					 {
						 lowPrices.set(1, lowPrices.get(0));
						 lowPrices.set(0, itemPicture);
					 }
				}
				 
				 
				 
			 }
		 }
		promoteItem.setDayRecommends(dayRecommends);
		promoteItem.setHalfItems(halfItems);
		promoteItem.setLowPrice(lowPrices);
		
		return promoteItem;
	}
	
}
