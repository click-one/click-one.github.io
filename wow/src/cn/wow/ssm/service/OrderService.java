package cn.wow.ssm.service;

import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.Order;
import cn.wow.ssm.po.OrderDetails;
import cn.wow.ssm.po.UserAddress;
import cn.wow.ssm.vo.OrderRef;

public interface OrderService {
	public void submitOrder(UserAddress userAddress,Order order,List<OrderDetails> orderDetails);
	public List<Item> findItemByIds(Integer []ids);
	public List<OrderRef> selectOrderByUser(Integer user_id);

}
