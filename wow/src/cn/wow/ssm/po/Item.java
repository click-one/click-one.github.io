package cn.wow.ssm.po;

import java.util.Date;

/**
 * 商品Po
 * @author lvlei
 *
 */
public class Item {
	private Integer id;           //自增id
	private String name;          //商品名
	private double price;         //商品价格
	private String detail;        //商品描述
	private Date createTime;      //商品的上市日期
	private double discount;      //商品打折信息
	private String keyWords;      //关键字
	private String area;          //商品的产地
	private Integer saleCount;    //商品的销售量
	private Integer classify_id;     //商品的分类
	private Integer repertory;    //商品的库存
	private String recommend;      //是否推荐
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	
	public Integer getClassify_id() {
		return classify_id;
	}
	public void setClassify_id(Integer classifyId) {
		classify_id = classifyId;
	}
	public Integer getRepertory() {
		return repertory;
	}
	public void setRepertory(Integer repertory) {
		this.repertory = repertory;
	}
	

	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	@Override
	public String toString() {
		return "Item [area=" + area + ", classify_id=" + classify_id
				+ ", createTime=" + createTime + ", detail=" + detail
				+ ", discount=" + discount + ", id=" + id + ", keyWords="
				+ keyWords + ", name=" + name + ", price=" + price
				+ ", recommend=" + recommend + ", repertory=" + repertory
				+ ", saleCount=" + saleCount + "]";
	}
	

}
