package cn.wow.ssm.vo;

import java.util.Date;
/**
 * 购物车Po
 * @author lvlei
 *
 */
public class Cart {
	private Integer id;               //自增id
	private Integer user_id;          //用户id
	private Date dateTime;            //创建时间
	private double totalPrice;        //购物车的总价
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
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	

}
