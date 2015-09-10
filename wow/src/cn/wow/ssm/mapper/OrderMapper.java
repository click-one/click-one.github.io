package cn.wow.ssm.mapper;

import java.util.List;

import cn.wow.ssm.po.Item;
import cn.wow.ssm.po.Order;
import cn.wow.ssm.po.OrderDetails;
import cn.wow.ssm.po.UserAddress;
import cn.wow.ssm.vo.OrderRef;

public interface OrderMapper {
	public void insertAddress(UserAddress userAddress);
	public void insertOrder(Order order);
	public void insertOrderDetails(List<OrderDetails> orderDetails);
	public List<Item> findItemByIds(Integer []ids);
	public List<OrderRef> selectOrderByUser(Integer userId);

}
