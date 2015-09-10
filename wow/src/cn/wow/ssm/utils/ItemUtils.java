package cn.wow.ssm.utils;

import java.util.ArrayList;
import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemClassify;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.vo.Classify;
import cn.wow.ssm.vo.ItemNumPic;
import cn.wow.ssm.vo.ItemPicture;

public class ItemUtils {
	/**
	 * 将num与item进行封装
	 * @param nums
	 * @param items
	 * @return
	 */
	public static List<ItemNumPic> NumMatchItems(Integer [] ids,Integer []nums,List<Item> items,List<ItemPic> itemPics)
	{
		List<ItemNumPic> itemNumPics= new ArrayList<ItemNumPic>();
//		Map<String,Item> map = new HashMap<String,Item>();
		for(Item item:items)
		{
			for(int i = 0;i<ids.length;i++)
			{
				for(ItemPic itemPic:itemPics)
				{
					if(item.getId().equals(ids[i])&&(itemPic.getItem_id().equals(item.getId())))
					{
						ItemNumPic itemNumPic = new ItemNumPic();
						itemNumPic.setItem(item);
						itemNumPic.setNum(nums[i]);
						itemNumPic.setItemPic(itemPic);
						itemNumPics.add(itemNumPic);
					}
				}
			}
		}
		return itemNumPics;
	}
	/**
	 * 
	 * @param firstClassify      一级分类
	 * @param secondClassify     二级分类
	 * @param itemPictures       商品和图片的信息
	 * @return
	 */
	public static List<Classify> classify1 (List<ItemClassify> firstClassify,List<ItemClassify> secondClassify,List<ItemPicture> itemPictures)
	{
		List<Classify> classifys = new ArrayList<Classify>();  //一个大的classify包装类的list
		for(ItemClassify first:firstClassify)                  //遍历一级分类
		{
			List<ItemClassify> value = new ArrayList<ItemClassify>(); //存储二级分类的List
			List<ItemPicture> itemPictures2 = new ArrayList<ItemPicture>();//一级分类下面的所有商品信息
			Classify classify = new Classify();  //一个classify对象
			for(ItemClassify second:secondClassify)    
			{
				if(first.getId()==second.getParent_id())
				{
					value.add(second);                    //将二级分类添加到集合中
				}
				for(ItemPicture itemPicture:itemPictures)
				{
					if(first.getId()==second.getParent_id()&&second.getId()==itemPicture.getParent_id())
					{                       //匹配所有一级分类下面的商品的信息
						itemPictures2.add(itemPicture);
						if(itemPicture.getItem().getRecommend().equals("yes"))  //数据库里推荐的商品字段为yes，则将其设置进去
						{
						  classify.setRecommendItem(itemPicture);
						}
					}
				}
			}
			classify.setFirstClassify(first);
			classify.setSecondClassify(value);
			classify.setItemPictures(itemPictures2);
			classifys.add(classify);    //将classify加到classify的集合中
		}
		System.out.println("商品的大小为"+classifys.get(0).getItemPictures().size());
		return classifys;
	}
	
	//将查出来的图片和商品的信息进行包装匹配
	public static List<ItemPicture> itemMacthPicture(List<Item> items,List<ItemPic> itemPics)
	{
		List<ItemPicture> itemPictures = new ArrayList<ItemPicture>();
		for(Item item:items)
		{
			ItemPicture itemPicture = new ItemPicture();
			for(ItemPic itemPic:itemPics)
			{
				if(item.getId()==itemPic.getItem_id())
				{
					itemPicture.setItem(item);
					itemPicture.setItemPic(itemPic);
					
				}
				
			}
			itemPictures.add(itemPicture);
		}
		
		
		return itemPictures;
	}
	
	

}


