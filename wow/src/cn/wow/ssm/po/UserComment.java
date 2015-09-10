package cn.wow.ssm.po;

import java.util.Date;
/**
 * 用户评论Po
 * @author lvlei
 *
 */
public class UserComment {
	private Integer id;                     //自增id
	private Integer user_id;                //用户id
	private Integer item_id;                //商品id
	private String information;             //评论内容
	private String visible;                 //评论是否可见
	private Date time;                      //评论时间
	private String score;                   //用户评分
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
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	

}
