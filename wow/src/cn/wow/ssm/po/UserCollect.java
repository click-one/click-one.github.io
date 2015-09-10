package cn.wow.ssm.po;

import java.util.Date;
/**
 * 用户收藏表
 * @author lvlei
 *
 */
public class UserCollect {
	private Integer id;                 //自增主键id
	private Integer user_id;            //用户的id
	private Integer item_id;            //用户收藏商品id
	private Date collectTime;           //收藏时间
	private double collectPrice;        //收藏时的商品价格
	
	public UserCollect() {
		super();
	}
	
	public UserCollect(Integer userId, Integer itemId) {
		super();
		user_id = userId;
		item_id = itemId;
	}

	public UserCollect(Integer userId, Integer itemId, Date collectTime) {
		super();
		user_id = userId;
		item_id = itemId;
		this.collectTime = collectTime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer userId) {
		user_id = userId;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer itemId) {
		item_id = itemId;
	}
	public Date getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
	
	public double getCollectPrice() {
		return collectPrice;
	}

	public void setCollectPrice(double collectPrice) {
		this.collectPrice = collectPrice;
	}

	@Override
	public String toString() {
		return "UserCollect [collectTime=" + collectTime + ", id=" + id
				+ ", item_id=" + item_id + ", user_id=" + user_id + "]";
	}
	

}
