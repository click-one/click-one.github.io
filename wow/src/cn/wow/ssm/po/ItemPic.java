package cn.wow.ssm.po;
/**
 * 商品小图Po
 * @author lvlei
 *
 */
public class ItemPic {
	private Integer id;                 //自增id
	private Integer item_id;            //商品id
	private String url;                 //图片地址
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
	@Override
	public String toString() {
		return "ItemPic [id=" + id + ", item_id=" + item_id + ", url=" + url
				+ "]";
	}
	

}
