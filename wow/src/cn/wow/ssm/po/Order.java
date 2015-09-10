package cn.wow.ssm.po;

import java.util.Date;
/**
 * 用户订单Po
 * @author lvlei
 *
 */
public class Order {

	private Integer id;                  //自增id
	private Integer user_id;             //用户id
	private Date createTime;             //下单时间
	private String note;                 //订单备注
	private double totalPrice;           //订单总价
	private String telphone;             //手机号码
	private String state;                //订单支付状态
	private Integer address_id;          //支付地址id
	private String consignee;            //收货人
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getAddress_id() {
		return address_id;
	}
	public void setAddress_id(Integer addressId) {
		address_id = addressId;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	
	
}
