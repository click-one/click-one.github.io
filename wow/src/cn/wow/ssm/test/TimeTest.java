package cn.wow.ssm.test;

import java.util.Date;

public class TimeTest {
	public static void main(String[] args) {
		Date date1 = new Date();
		for(int i= 0;i<10;i++)
		{
			for(int j= 0;j<100;j++)
			{
				for(int k= 0;k<100;k++)
				{
					System.out.println("aaaa");
				}
			}
		}
		
		Date date2 = new Date();
		System.out.println("消耗的时间为"+(date2.getTime()-date1.getTime()));
	}

}
