package cn.wow.ssm.po;
/**
 * 用户收货地址Po（一个用户可能有多个收货地址）
 * @author lvlei
 *
 */
public class UserAddress {
	private Integer id;                    //自增id
	private Integer user_id;               //用户id
	private String address;                //用户地址
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	

}
