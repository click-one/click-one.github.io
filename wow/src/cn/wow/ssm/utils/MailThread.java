package cn.wow.ssm.utils;

import cn.wow.ssm.po.User;

public class MailThread implements Runnable{
	private User user;
	public MailThread(User user)
	{
		this.user = user;
	}
	@Override
	public void run() {
		MailUtils.sendMail(user);
		
	}

}
