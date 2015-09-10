package cn.wow.ssm.vo;

import java.util.Arrays;

/**
 * 此包装类，在进行商品的排序查询时，为了封装商品的classify_ids和排序的条件（价格、上市时间、销量）,按照升序还是降序
 * 作为参数传入，设置一个包装类
 * @author lvlei
 *
 */
public class ItemSortName {
	private Integer[] ids;            //
	private Integer sortName;         //排序的条件（价格、上市时间、销量）
	private Integer sortId;           //按照升序还是降序
	private String fuzzyName;         //模糊查询的条件
	private Integer parent_id;
	private Integer id;
	private Integer pNum;
	private Integer start;
	private Integer pageSize = PageBean.PAGESIZE;
	private Integer item_id;
	public Integer[] getIds() {
		return ids;
	}
	public void setIds(Integer[] ids) {
		this.ids = ids;
	}
	public Integer getSortName() {
		return sortName;
	}
	public void setSortName(Integer sortName) {
		this.sortName = sortName;
	}
	public Integer getSortId() {
		return sortId;
	}
	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}
	public String getFuzzyName() {
		return fuzzyName.replace(" ", "");
	}
	public void setFuzzyName(String fuzzyName) {
		this.fuzzyName = fuzzyName;
	}
	
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parentId) {
		parent_id = parentId;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer itemId) {
		item_id = itemId;
	}
	@Override
	public String toString() {
		return "ItemSortName [fuzzyName=" + fuzzyName + ", ids="
				+ Arrays.toString(ids) + ", sortId=" + sortId + ", sortName="
				+ sortName + "]";
	}
	
	

}
