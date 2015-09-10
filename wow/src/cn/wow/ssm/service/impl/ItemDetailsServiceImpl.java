package cn.wow.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wow.ssm.mapper.ItemDetailsMapper;
import cn.wow.ssm.service.ItemDetailsService;
import cn.wow.ssm.vo.ItemDetailsRef;
import cn.wow.ssm.vo.ItemSortName;
import cn.wow.ssm.vo.PageBean;
import cn.wow.ssm.vo.UserAndComment;
@Service
public class ItemDetailsServiceImpl implements ItemDetailsService{
	@Resource
	private ItemDetailsMapper itemDetailsMapper;

	@Override//商品详情的图片和详细信息
	public ItemDetailsRef getItemDetaiisRef(Integer item_id) {
		ItemDetailsRef itemDetailsRef = new ItemDetailsRef();
		itemDetailsRef.setItemInfoPics(itemDetailsMapper.selectItemInfoPic(item_id));
		itemDetailsRef.setItemPicture(itemDetailsMapper.selectItemPic(item_id));
		itemDetailsRef.setTotalComment(itemDetailsMapper.selectCountUserComment(item_id));
		itemDetailsRef.setHotSell(itemDetailsMapper.selectHotSell());//热销的商品
		return itemDetailsRef;
	}

	@Override//该商品的用户评论的相关信息
	public PageBean<UserAndComment> getUserComment(Integer item_id,Integer pNum) {
		PageBean<UserAndComment> pageBean = new PageBean<UserAndComment>();
		ItemSortName itemSortName = new ItemSortName();
		itemSortName.setItem_id(item_id);
		if(pNum==null)
		{
		  pNum =1;
		  itemSortName.setpNum(1);
		  itemSortName.setStart(0);
		}
		else
		{
			itemSortName.setpNum(pNum);
			Integer start = (pNum-1)*itemSortName.getPageSize();
			itemSortName.setStart(start);
		}
		List<UserAndComment> data = itemDetailsMapper.selectUserComment(itemSortName);
		pageBean.setData(data);
		pageBean.setpNum(pNum);
		pageBean.setTotalRecordNum(itemDetailsMapper.selectCountUserComment(item_id));
		return pageBean;
	}
	
	
	  
	
}
