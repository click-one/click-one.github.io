package cn.wow.ssm.vo;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemClassify;
import cn.wow.ssm.po.ItemPic;
/**
 * 查询商品和图片的包装类
 * @author lvlei
 *
 */
public class ItemPicture {
	
	private Integer id;
	private Integer parent_id;
	private Item item;
	private ItemPic itemPic;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parentId) {
		parent_id = parentId;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public ItemPic getItemPic() {
		return itemPic;
	}
	public void setItemPic(ItemPic itemPic) {
		this.itemPic = itemPic;
	}
	
	

}
