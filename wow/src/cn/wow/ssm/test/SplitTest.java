package cn.wow.ssm.test;

public class SplitTest {
	
	public static String []ids ;
	public static String []nums;
	public static void splitCookie(String cookieString)
	{
		String []str1 = cookieString.split(",");
		String []ids=new String[str1.length];
		String []nums=new String[str1.length];
		for(int i =0;i<str1.length;i++)
		{
			String []first = cookieString.split(",");
			for(int j =0;j<first[0].split("=").length;j++)
			{
				String [] second = first[i].split("=");
				
				if(j%2==0)
				{
					ids[i]=second[j];
				}
				if(j%2==1)
				{
					nums[i]=second[j];
				}
			}
		}
	}
	
	public static void main(String args[])
	{
		String cookieValue = SplitTest.repalceString("3", "33333", "1=2,2=2,3=2");
		System.out.println(cookieValue);
//		String replaceString="ccc"; 
//		String str="1=2,2=2,3=3";
//		String reg ="2=";
//		int a = str.indexOf(reg);   // 4
//		int b = a+reg.length();     //6
//		int c = str.indexOf(",",b); //8
//		String d = str.substring(b, c);//23
//		StringBuilder sb = new StringBuilder(str);
//		String e = sb.replace(b, c, replaceString)+"";
//		System.out.println(e);
		
	}
	/**
	 * 
	 * @param id                     需要替换商品的id
	 * @param targetNum              需要替换的商品的数量
	 * @param cookievalue            存放在cookie中的cookieValue值
	 */
	public static String repalceString(String id,String targetNum,String cookievalue)
	{
		id+="=";         //为了保证定位字符串的唯一性，在商品的id后+"="
		int idLength = id.length();  //计算商品id+"="的长度
		int start = cookievalue.indexOf(id)+idLength;   //从指定开始位置替换
		int end = cookievalue.indexOf(",", start);      //从指定结束位置替换
		if(end==-1)   //如果为字符串中的最后一个id时，则返回值为-1
		{
			end=+cookievalue.length()+2;
		}
		StringBuilder sb = new StringBuilder(cookievalue);
		String targetCookieValue = sb.replace(start, end, targetNum)+"";
		return targetCookieValue;
	}
	
	}
	

	


