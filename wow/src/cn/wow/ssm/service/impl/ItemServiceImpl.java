package cn.wow.ssm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wow.ssm.mapper.ItemMapper;
import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemClassify;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.RollPic;
import cn.wow.ssm.service.ItemService;
import cn.wow.ssm.test.ListToXml;
import cn.wow.ssm.utils.ItemSortUtils;
import cn.wow.ssm.utils.ItemUtils;
import cn.wow.ssm.vo.Classify;
import cn.wow.ssm.vo.Index;
import cn.wow.ssm.vo.ItemPicture;
import cn.wow.ssm.vo.ItemSortName;
import cn.wow.ssm.vo.PageBean;
import cn.wow.ssm.vo.PromoteItem;
/**
 * 此server层有太多重复代码，需要重新构思
 * @author lvlei
 *
 */
@Service
public class ItemServiceImpl implements ItemService{
	@Resource
	private ItemMapper itemMapper;
	@Override
	public void insertItem1(Item item, ItemPic itemPic) {
		itemMapper.insertItem(item);                //添加了事物，如果商品图片插入失败，则事物会进行回滚
		itemPic.setItem_id(item.getId());           //要插入图片，要先获得该商品的id，建立商品与商品图片之间的关系
		itemMapper.insertItemPic(itemPic);          //插入商品的图片
	  }
	/**
	 * 获取全部的一级分类和二级分类，并将其一级分类和二级分类相对应
	 */
	@Override 
	public Index getIndex() {  
		
		List<ItemClassify> firstClassify = itemMapper.gainFirstClassify();
		List<ItemClassify> secondClassify = itemMapper.gainSecondClassify();
		List<ItemPicture> itemPictures = itemMapper.selectItemAndPic();
		List<RollPic> rollPics = itemMapper.selectRollPic();
		PromoteItem promoteItem = ItemSortUtils.getPromoteItem(itemPictures); //获取主页面的所有促销商品的信息
		List<Classify> classifys = ItemUtils.classify1(firstClassify, secondClassify,itemPictures);
		ListToXml.parseNodeToXML(classifys);
		promoteItem.setRollPics(rollPics);
		Index index = new Index();
		index.setClassifys(classifys);
		index.setPromoteItem(promoteItem);
		
		return index;
	}
	
	@Override  //通过模糊查询商品的信息
	public PageBean<ItemPicture> selectItemFuzzy(ItemSortName itemSortName) {
		PageBean<ItemPicture> pageBean = new PageBean<ItemPicture>();
        Integer start;    
		if(itemSortName.getpNum()==null||itemSortName.getpNum()==1)   
		{//如果pNum为空或者是1时，则说明说明是第一次访问页面，则将pNum的初始值设为1，则起始分页的位置为0
		  start = 0;
		  itemSortName.setpNum(1);
		  itemSortName.setStart(start);
		}
		else
		{//访问的不是第一页，则计算它的分页的起始位置
			 start = (itemSortName.getpNum()-1)*PageBean.PAGESIZE;
			 itemSortName.setStart(start);
		}
		
		List<ItemPicture> itemPictures = new ArrayList<ItemPicture>();
		List<Item> items = itemMapper.selectItemFuzzy(itemSortName);  //根据模糊匹配来查询商品的信息
		if(items.size()!=0)   //如果商品的列表不为空
		{
			Integer []ids;
			ids = new Integer[items.size()];
			for(int i = 0;i<items.size();i++)
			{
				ids[i] = items.get(i).getId();
			}
			List<ItemPic> itemPics = itemMapper.selectItemPicByIds(ids);
			itemPictures = ItemUtils.itemMacthPicture(items, itemPics);//将商品和图片进行匹配
			Integer totalRecordNum = itemMapper.CountSelectItemFuzzy(itemSortName);//计算总的记录条数
			pageBean.setTotalRecordNum(totalRecordNum);//将pageBean的信息进行封装
			pageBean.setpNum(itemSortName.getpNum());
			pageBean.setItemSortName(itemSortName);
			pageBean.setData(itemPictures);
		}
		return pageBean;
	}

	@Override //根据分类查询的排序以及分页
	public PageBean<ItemPicture> ItemOrder(ItemSortName itemSortName) {
		PageBean<ItemPicture> pageBean = new PageBean<ItemPicture>();        //分页的实体Bean
		Integer start;
		
		if(itemSortName.getpNum()==null||itemSortName.getpNum()==1)
		{ //如果pNum为空或者是1时，则说明说明是第一次访问页面，则将pNum的初始值设为1，则起始分页的位置为0
		  start = 0;
		  itemSortName.setpNum(1);
		  itemSortName.setStart(start);
		}
		else
		{   //根据页码计算分页的起始位置
			start = (itemSortName.getpNum()-1)*PageBean.PAGESIZE;
			 itemSortName.setStart(start);
		}
		List<ItemPicture> itemPictures = new ArrayList<ItemPicture>();
		Integer[] ids ;
		if(itemSortName.getParent_id()!=0)              //判断是一级分类还是二级分类，调用不同的Mapper接口
		{
			ids = itemMapper.selectIdBySecondClassify(itemSortName.getId());     //查询二级分类下面的商品
			itemSortName.setIds(ids);
		}
		else
		{
			ids = itemMapper.selectIdByFirstClassify(itemSortName.getId());      //查询一级分类下面的商品
			itemSortName.setIds(ids);
		}
		
		if(ids.length!=0) //如果该类下面的商品信息不为空，则进将商品的信息查询出来，并进行分页
		{
			List<Item> items = itemMapper.ItemOrder(itemSortName);
			Integer [] itemsId = new Integer[items.size()];
			for(int i =0;i<items.size();i++)
			{
				itemsId[i] = items.get(i).getId();
			}
			List<ItemPic> itemPics = itemMapper.selectItemPicByIds(itemsId);
			itemPictures = ItemUtils.itemMacthPicture(items, itemPics);//图片和商品相匹配
			Integer totalRecordNum = itemMapper.countItemOrder(itemSortName);
			pageBean.setTotalRecordNum(totalRecordNum);
		}
		pageBean.setpNum(itemSortName.getpNum());  //封装pageBean中的相关信息
		
		pageBean.setpNum(itemSortName.getpNum());
		pageBean.setData(itemPictures);
		pageBean.setItemSortName(itemSortName);
		return pageBean;
	}
	public ItemPicture selectItemById(Integer id)
	{
		return itemMapper.selectItemById(id);
	}
	@Override
	public void insertRollPic(RollPic rollPic) {
		itemMapper.insertRollPic(rollPic);
		
	}
	@Override
	public List<RollPic> getRollPic() {
		
		return itemMapper.selectRollPic();
	}
}

	
	


