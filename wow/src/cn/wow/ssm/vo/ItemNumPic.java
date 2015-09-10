package cn.wow.ssm.vo;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
/**
 * 在进行cookie操作时，为了将商品信息、商品的数量、商品的图片信息进行包装
 * @author lvlei
 *
 */
public class ItemNumPic {
	private Item item;
	private int num;
	private ItemPic itemPic;
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public ItemPic getItemPic() {
		return itemPic;
	}
	public void setItemPic(ItemPic itemPic) {
		this.itemPic = itemPic;
	}
	

}
