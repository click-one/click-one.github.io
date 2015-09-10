package cn.wow.ssm.utils;

import java.util.List;

import cn.wow.ssm.po.Item;

public class OrderUtils {
	public static double counttotalPrice(List<Item> items,Integer []item_ids,Integer []item_nums)
	{
		double totalPrice = 0;
		for(int i=0;i<item_ids.length;i++)
		{
			for(Item item:items)
			{
				if(item.getId()==item_ids[i])
				{
					totalPrice += item.getPrice()*item_nums[i];
					break;
				}
				
			}
		}
		return totalPrice ;
	}	

}
