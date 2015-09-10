package cn.wow.ssm.po;

import java.util.Date;

/**
 * 滚动图片Po
 * @author lvlei
 *
 */
public class RollPic {
	private Integer id;                 //自增id
	private String url;                 //图片地址
	private String link;                //图片超链接地址
	private Date createTime;                 //滚动图片的创建时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	

}
