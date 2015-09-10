package cn.wow.ssm.po;

import java.util.Date;
/**
 * 用户信息Po
 * @author lvlei
 *
 */
public class User {
	private Integer id;                    //自增id
	private String username;               //用户名
	private String password;               //密码
	private String email;                  //电子邮箱
	private String gender;                 //性别
	private String telphone;               //电话号码
	private Date activeTime;               //用户激活时间
	private String userType;               //用户类型（区分管理员、普通用户）
	private String activeState;            //用户是否激活
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public Date getActiveTime() {
		return activeTime;
	}
	public void setActiveTime(Date activeTime) {
		this.activeTime = activeTime;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getActiveState() {
		return activeState;
	}
	public void setActiveState(String activeState) {
		this.activeState = activeState;
	}
	@Override
	public String toString() {
		return "User [activeState=" + activeState + ", activeTime="
				+ activeTime + ", email=" + email + ", gender=" + gender
				+ ", id=" + id + ", password=" + password + ", telphone="
				+ telphone + ", userType=" + userType + ", username="
				+ username + "]";
	}
	
	

}
