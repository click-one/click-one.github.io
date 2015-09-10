package cn.wow.ssm.vo;

import java.util.List;

import cn.wow.ssm.po.Order;
import cn.wow.ssm.po.OrderDetails;

public class OrderRef {
	private Integer order_id;      //唯一确定当前这个包装类
	private Order order;
	private List<OrderDetailsPic> orderDetailsPic;
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer orderId) {
		order_id = orderId;
	}
	
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<OrderDetailsPic> getOrderDetailsPic() {
		return orderDetailsPic;
	}
	public void setOrderDetailsPic(List<OrderDetailsPic> orderDetailsPic) {
		this.orderDetailsPic = orderDetailsPic;
	}

	
	

}
