package cn.wow.ssm.vo;

public class OrderDetailsPic {

	private Integer id;                //自增id
	private Integer order_id;          //订单id
	private Integer item_id;           //商品id
	private Integer item_num;          //商品数量
	private String url;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer orderId) {
		order_id = orderId;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
