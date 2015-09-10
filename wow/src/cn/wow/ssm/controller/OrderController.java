package cn.wow.ssm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.Order;
import cn.wow.ssm.po.OrderDetails;
import cn.wow.ssm.po.User;
import cn.wow.ssm.po.UserAddress;
import cn.wow.ssm.service.OrderService;
import cn.wow.ssm.utils.CookieUtils;
import cn.wow.ssm.utils.OrderUtils;
import cn.wow.ssm.vo.OrderDetailsPic;
import cn.wow.ssm.vo.OrderRef;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	private OrderService orderService;
	@RequestMapping("/submitOrder") //提交订单，插入地址表，插入订单表，插入订单详情表
	public String submitOrder(Integer []item_ids,Integer []item_nums,String address,String note,
			String consignee,String telphone,HttpSession session,HttpServletResponse response,
			HttpServletRequest request) throws Exception
	{
		List<Item> items = orderService.findItemByIds(item_ids);  //从数据库中查出商品的价格和id
		User user = (User)session.getAttribute("user");
		if(user==null)
		{
			return "redirect:../view/login.jsp";
		}
		System.out.println("___________________________________________________________________");
		UserAddress userAddress = new UserAddress();    //封装用户的地址信息
		userAddress.setUser_id(user.getId());
		userAddress.setAddress(address);
		Order order = new Order();                     //封装用户的订单信息
		double totalPrice = OrderUtils.counttotalPrice(items, item_ids, item_nums);
		order.setConsignee(consignee);
		order.setCreateTime(new Date());
		order.setNote(note);
		order.setTelphone(telphone);
		order.setUser_id(user.getId());
		order.setTotalPrice(totalPrice);
		order.setState("未支付");
		
		List<OrderDetails> orderDetails = new ArrayList<OrderDetails>();//封装用户订单详情信息
		for(int i =0;i<item_ids.length;i++)    //将订单详情的商品id和数量分解为一个订单项的list
		{
			OrderDetails orderDetail = new OrderDetails();
			orderDetail.setItem_id(item_ids[i]);
			orderDetail.setItem_num(item_nums[i]);
			orderDetails.add(orderDetail);
		}
		orderService.submitOrder(userAddress, order, orderDetails);//提交订单的信息
		for(int i=0;i<item_nums.length;i++)
		{
			CookieUtils.deleteCookieItem(response, request, user.getUsername(), item_nums[i], item_ids[i]); 
		}
		                                                //提交完订单后，应该删除订单中商品信息的cookie
		response.getWriter().write("订单提交成功，请在24小时内付款成功");
		return null;
		
		
	}
	@RequestMapping("/selectOrder")//查看当前用户的所有订单
    public String selectOrder(HttpSession session,Model model)
	{
		
		User user = (User)session.getAttribute("user");
		if(user==null)                             //用户没有登录，则跳转到登录界面
		{
			return "redirect:../view/login.jsp";
		}
		Integer user_id = user.getId();
		List<OrderRef> orderRef = orderService.selectOrderByUser(user_id);
		model.addAttribute("orderRef", orderRef);
		System.out.println("集合的大小为："+orderRef.size());
		
		return "item/showOrder";
	}

}
