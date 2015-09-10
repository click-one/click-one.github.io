package cn.wow.ssm.vo;

/**
 * 购物车详情Po
 * @author lvlei
 *
 */
public class CartDetails {
	private Integer id;               //自增id
	private Integer cart_id;          //购物车id;
	private Integer item_id;          //商品id
	private Integer item_num;         //商品的数量
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCart_id() {
		return cart_id;
	}
	public void setCart_id(Integer cartId) {
		cart_id = cartId;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer itemId) {
		item_id = itemId;
	}
	public Integer getItem_num() {
		return item_num;
	}
	public void setItem_num(Integer itemNum) {
		item_num = itemNum;
	}
	

}
