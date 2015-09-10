package cn.wow.ssm.service;

import cn.wow.ssm.vo.ItemDetailsRef;
import cn.wow.ssm.vo.PageBean;
import cn.wow.ssm.vo.UserAndComment;

public interface ItemDetailsService {
	public ItemDetailsRef getItemDetaiisRef(Integer item_id);
	public PageBean<UserAndComment> getUserComment(Integer item_id,Integer pNum);

}
