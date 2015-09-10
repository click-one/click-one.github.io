package cn.wow.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.wow.ssm.mapper.OrderMapper;
import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.Order;
import cn.wow.ssm.po.OrderDetails;
import cn.wow.ssm.po.UserAddress;
import cn.wow.ssm.service.OrderService;
import cn.wow.ssm.vo.OrderRef;
@Service
public class OrderServiceImpl implements OrderService{
    @Resource
	private OrderMapper orderMapper;

	@Override
	public void submitOrder(UserAddress userAddress, Order order,
			List<OrderDetails> orderDetails) {
		orderMapper.insertAddress(userAddress);   //插入用户地址id，返回用户地址的id
		
		order.setAddress_id(userAddress.getId()); // 设置订单的收货地址id
		orderMapper.insertOrder(order);           //插入订单，返回订单的id
		for(OrderDetails orderDetail:orderDetails)//for循环给每一个订单详情设置其订单id
		{
			orderDetail.setOrder_id(order.getId());
		}
		orderMapper.insertOrderDetails(orderDetails);//插入订单详情的信息
	}

	@Override
	public List<Item> findItemByIds(Integer[] ids) {
		
		return orderMapper.findItemByIds(ids);
	}

	@Override
	public List<OrderRef> selectOrderByUser(Integer userId) {
		
		return orderMapper.selectOrderByUser(userId);
	}

}
