package cn.wow.ssm.utils;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;

import cn.wow.ssm.po.User;




/**
 * 发送邮件 工具方法
 * 
 * @author seawind
 * 
 */
public class MailUtils {
	private static String activeCode;
	// 生成激活码
	public static String generateActivecode() {
		activeCode = UUID.randomUUID().toString();
		return activeCode;
	}

	// 发送邮件
	public static void sendMail(Message message, Session session)
			throws Exception {
		Transport transport = session.getTransport();
		transport.connect("820042649@qq.com", "dhzx422500");  //发件人的邮箱和密码
		transport.sendMessage(message, message.getAllRecipients());
	}

	// 生成邮件
	public static Message generateMessage(Session session, User user)
			throws Exception {
		MimeMessage message = new MimeMessage(session);
		// 邮件头
		message.setFrom(new InternetAddress("820042649@qq.com"));// 发件人
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(user
				.getEmail())); // 收件人
		message.setSubject("WOW网站激活邮件");
		// 邮件头
		message
				.setContent(
						"<h2>欢迎"
								+ user.getUsername()
								+ "注册WOW网站商城，这里可以购买您需要商品！</h2><h3>请于24小时内点击下面链接完成账户激活：</h3><a href='http://192.168.1.8:8080/wow/user/activeUpdateUser.action?" +
										"username="+user.getUsername()
								+ "'>" +
										"http://www.wow.com/active?activecode="
								+ activeCode + "</a>",
						"text/html;charset=utf-8");
		return message;
	}

	// 创建会话
	public static Session createSession() {
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");  //发送邮件的协议
		properties.put("mail.smtp.host", "smtp.qq.com");    //发送邮件的st
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties);
		return session;
	}

	public static void sendMail(User user)
	{
		MailUtils.generateActivecode();
		Session session = MailUtils.createSession();
		try {
			Message message = MailUtils.generateMessage(session,user);
			MailUtils.sendMail(message, session);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public static void main(String args[])
	{
		User user = new User();
		sendMail(user);
	}
	
}
