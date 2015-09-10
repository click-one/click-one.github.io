package cn.wow.ssm.vo;

import java.util.List;

public class PageBean<T> {
	public static final Integer PAGESIZE = 8;          //每页显示多少数据
	private Integer totalRecordNum;                      //一共的记录条数
	private Integer pNum;                                //当前处于第几页
	private Integer totalPageNum;                        //一共的页数
	//private List<T> itemPictures;               //查询出来的记录
	private List<T> data;                          //查询出来的记录
	private String url;
	private ItemSortName itemSortName;                   //分页查询的条件
	
	
	public Integer getTotalRecordNum() {
		return totalRecordNum;
	}
	public void setTotalRecordNum(Integer totalRecordNum) {
		this.totalRecordNum = totalRecordNum;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public Integer getTotalPageNum() {
		return (totalRecordNum+PAGESIZE-1)/PAGESIZE;
	}
	
	public ItemSortName getItemSortName() {
		return itemSortName;
	}
	public void setItemSortName(ItemSortName itemSortName) {
		this.itemSortName = itemSortName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	

}
