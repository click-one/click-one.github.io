package cn.wow.ssm.controller;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.wow.ssm.service.ItemDetailsService;
import cn.wow.ssm.vo.ItemDetailsRef;
import cn.wow.ssm.vo.PageBean;
import cn.wow.ssm.vo.UserAndComment;
@Controller//   itemDetails/itemDetails.action
@RequestMapping("/itemDetails")
public class ItemDetailsController {
	@Resource
	private ItemDetailsService itemDetailsService;
	@RequestMapping("/itemDetails")
    public String getItemDetailsRef(Integer id,Model model)
    {
		ItemDetailsRef itemDetailsRef = itemDetailsService.getItemDetaiisRef(id);
		model.addAttribute("itemDetailsRef", itemDetailsRef);
    	return "productDetail";
    }
	@RequestMapping("/userComment")
	public @ResponseBody PageBean<UserAndComment> userComment(Integer item_id,Integer pNum)
	{
		PageBean<UserAndComment>  pageBean = itemDetailsService.getUserComment(item_id, pNum);
		return pageBean;
	}   
	
}
