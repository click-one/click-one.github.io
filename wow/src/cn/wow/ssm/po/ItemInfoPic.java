package cn.wow.ssm.po;

import java.util.Date;

/**
 * 商品大图Po
 * @author lvlei
 *
 */
public class ItemInfoPic {
	private Integer id;             //自增id
	private Integer item_id;        //商品id
	private String url;             //图片地址
	private Date createTime;        //图片的上传时间，来选择罪行的几张图片
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer itemId) {
		item_id = itemId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	

}
