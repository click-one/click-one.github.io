package cn.wow.ssm.controller;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.ItemPic;
import cn.wow.ssm.po.User;
import cn.wow.ssm.po.UserCollect;
import cn.wow.ssm.service.CartService;
import cn.wow.ssm.utils.CookieUtils;
import cn.wow.ssm.utils.ItemUtils;
import cn.wow.ssm.vo.ItemNumPic;
@Controller
@RequestMapping("/cart")
public class CartController {

	private final static String NAME = "customer";  
	@Resource
	private CartService cartService;
    @RequestMapping("/addItemToCart")   //添加商品到购物车
	public void addItemToCart(String item_id,Integer num,HttpServletRequest request,HttpSession session,HttpServletResponse response)
	{
    	User user = (User)session.getAttribute("user");
    	String  cookieName ;
    	if(user==null)
    	{
    		cookieName=NAME;
    	}
    	else
    	{
    		cookieName = user.getUsername(); 
    	}
    	
        System.out.println("============================"+cookieName); 
    	  //cookie的名就是用户名
    	Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
    	if(cookie == null)                   //不存在此用户的cookie
    	{
    	   cookie = new Cookie(cookieName,(item_id+"="+num).trim());//"a=1,b=2,c=3"
    	   System.out.println("第一次获取用户的cookie"+(item_id+"="+num).trim());
    	   cookie.setMaxAge(60*60*24*30);
    	   cookie.setPath("/wow");
    	   response.addCookie(cookie);       //写回客户端到cookie
    	}
    	else
    	{
    		String cookieValue = cookie.getValue();
    		System.out.println("cookieValue的值为："+cookieValue);
    		Map<String,Integer[]>  hashMap= CookieUtils.splitCookie(cookieValue);   //将客户端的cookie里的产品id和nums全部取出来，
    		Integer ids[] = hashMap.get("ids");
    		
    		String renewCookieValue=null;
    		for(Integer exit_id:ids)
    		{
    			if(exit_id.toString().equals(item_id))         //如果在cookie已经存在，则此时应将其产品的数量进行加
    			{
    				            
    				renewCookieValue=CookieUtils.repalceString(exit_id+"",cookieValue,num);
    				cookie.setValue(renewCookieValue);  //将购物车的加入到cookie的id数组中
    				break;
    			}
    			else
    			{
    				cookie.setValue(cookieValue+","+item_id+"="+num);
    			}
    		}
    	   System.out.println("cookie中的值为："+cookie.getValue()+"!!!");
    	   cookie.setMaxAge(60*60*24*30);
    	   cookie.setPath("/wow");
     	   response.addCookie(cookie); 
    	}
    	
	}
    
    @RequestMapping("/showCart")   //展示用户的购物车信息
    public ModelAndView showCart(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception
	{
    	User user = (User)session.getAttribute("user");
    	String  cookieName;
    	if(user==null)
    	{
    		cookieName=NAME;
    	}
    	else
    	{
    		cookieName = user.getUsername(); 
    	}   //cookie的名就是用户名
    	Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
    	
    	if(cookie==null)
    	{
    		
    		response.getWriter().write("亲，购物车为空，<a href='../jsp/cart/itemDetails.jsp'>去购物</a>");
    		
    		return null;
    	}
    	
    	
    	Map<String,Integer[]>  hashMap= CookieUtils.splitCookie(cookie.getValue());   //将客户端的cookie里的产品id和nums全部取出来，
		
    	Integer ids[] = hashMap.get("ids");
    	System.out.println("---------------------"+Arrays.toString(ids));
		Integer nums[] = hashMap.get("nums");
		System.out.println("---------------------"+Arrays.toString(nums));
		if(ids!=null)
		{
			
			List<Item> items = cartService.selectItemById(ids);
			List<ItemPic> itemPics = cartService.selectItemPic(ids);
			List<ItemNumPic> itemNumPics= ItemUtils.NumMatchItems(ids,nums, items,itemPics);
			ModelAndView mad = new ModelAndView();
			mad.addObject("itemNumPics",itemNumPics);
			mad.setViewName("/cart/showCart");
			return mad;
			
		}
		return null;
	}
    @RequestMapping("/deleteCartItem")  //删除购物车里面的商品
    public String deleteCartItem(HttpSession session,HttpServletResponse response,HttpServletRequest request,
    		int id,int num)
    {
    	User user = (User)session.getAttribute("user");
    	String cookieName;
    	if(user==null)
    	{
    		cookieName=NAME;
    	}
    	else
    	{
    		cookieName = user.getUsername(); 
    	}
    	Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
    	if(cookie!=null);
    	{
    	  String cookieValue = cookie.getValue();
    	  cookieValue  = cookieValue.replaceFirst(id+"="+num, "");
    	  cookieValue = cookieValue.replaceFirst(",,", ",");//在第一次替换之后可能会出现两个连续的“,,”要进行二次替换
    	  if(cookieValue.indexOf(",")==0)
    	  {
    		  cookieValue = cookieValue.replaceFirst(",", "");
    		 
    	  }
    	  cookie.setValue(cookieValue);
		  cookie.setMaxAge(60*60*24*30); 
    	  if(cookieValue.equals(""))
    	  {
    		  cookie.setMaxAge(0);
    		  
    	  }
	      
	      cookie.setPath("/wow");
	      response.addCookie(cookie); 
    	}
    	return "redirect:/cart/showCart.action";
    }
    @RequestMapping("/deleteCart")
    public String deleteCart(HttpServletRequest request,HttpServletResponse response,HttpSession session)
    {
    	User user = (User)session.getAttribute("user");
    	String cookieName;
    	if(user==null)
    	{
    		cookieName=NAME;
    	}
    	else
    	{
    		cookieName = user.getUsername(); 
    	}
    	response.setContentType("text/html,charset=utf-8");
    	Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
    	if(cookie!=null)
    	{
    		cookie.setMaxAge(10000);
    		cookie.setMaxAge(0); 
        	cookie.setPath("/wow");
    	    response.addCookie(cookie); 
    	}
    	
    	return "redirect:/cart/showCart.action";
    }
  
    @RequestMapping("/userCollect")    //用户的收藏商品
	public void userCollect(HttpSession session,Integer id,HttpServletResponse response) throws Exception
	{
	  	User user = (User)session.getAttribute("user");
	  	PrintWriter out = response.getWriter();
	  	if(user==null)
	  	{
	  		out.write("用户还没有登录");
	  		return ;
	  	}
	  	UserCollect userCollect = new UserCollect(user.getId(),id,new Date());
	  	if(cartService.selectUserCollect(userCollect)!=null)
	  	{
	  		out.write("该商品已经被收藏！！！！");
	  		return ;
	  	}
	  	
	  	cartService.insertUserCollect(userCollect);
	  	out.write("商品收藏成功！！！！！！");
	  	
	  	
	}
	@RequestMapping("/updateItemNum")     //修改购物车里的数量信息
    public void updateItemNum(Integer id,Integer num,HttpServletRequest request,HttpSession session,HttpServletResponse response)//传入产品的id，和产品修改的数量
    {
		System.out.println("id"+id+"num"+num);
    	User user = (User)session.getAttribute("user");
    	String cookieName;
    	if(user==null)
    	{
    		cookieName = NAME;
    	}
    	else
    	{
    		 cookieName= user.getUsername();
    	}
        Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
        String cookieValue = CookieUtils.repalceString(id+"", cookie.getValue(), num);
        cookie.setValue(cookieValue);
        System.out.println("----------------------------------------------"+cookie.getValue());
        cookie.setMaxAge(10000);
    	cookie.setPath("/wow");
	    response.addCookie(cookie); 
    	
    }
	@RequestMapping("/account")//购物车中的商品区结算，提交的数据为选中的商品的Id，
	public String account(Integer []item_ids,HttpSession session,HttpServletRequest request,Model model) throws Exception 
	{
		String cookieName=null;
		if(session.getAttribute("user")!=null)
		{
			User user = (User)session.getAttribute("user");
			cookieName = user.getUsername();
		}
		else
		{
			cookieName = NAME;
		}
		Cookie cookie = CookieUtils.findCookie(request.getCookies(), cookieName);
        Map<String,Integer[]>  hashMap= CookieUtils.splitCookie(cookie.getValue());   //将客户端的cookie里的产品id和nums全部取出来，
    	Integer ids[] = hashMap.get("ids");
		Integer nums[] = hashMap.get("nums");
		List<ItemNumPic> itemNumPics = null;
		System.out.println("------------------"+item_ids);
		if(item_ids!=null)
		{
			itemNumPics = cartService.selectItemAndPic(item_ids);
			for(ItemNumPic itemNumPic:itemNumPics)
			{
				for(int i = 0;i<ids.length;i++)
				{
					if(itemNumPic.getItem().getId().equals(ids[i]))
					{
						itemNumPic.setNum(nums[i]);
						break;
					}
				
				}
			}
		}
		
		model.addAttribute("itemNumPics", itemNumPics);
		return "cart/account";
	}
	
	
}
