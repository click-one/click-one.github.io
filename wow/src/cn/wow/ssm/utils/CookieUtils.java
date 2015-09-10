package cn.wow.ssm.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	
	//找到目前用户的Cookie
	public static Cookie findCookie(Cookie[] cookies,String cookiesName)
	{
		if(cookies==null)
		{
			return null;
		}
		for(Cookie cookie:cookies)
		{
			if(cookie.getName().equals(cookiesName))
			{
				return cookie;
			}
		}
		
		return null;
	}
    //找到当前cookie的num和产品id并且将其分割成两个String类型的数组
	
	public static Map<String,Integer[]> splitCookie(String cookieString)
	{
		Map<String,Integer[]> hashMap = new HashMap<String,Integer[]>();
		Integer[]ids =null;
		Integer []nums =null;
		String []str1 = cookieString.split(",");
		ids=new Integer[str1.length];
		nums=new Integer[str1.length];
		for(int i =0;i<str1.length;i++)
		{
			String []first = cookieString.split(",");
			for(int j =0;j<first[0].split("=").length;j++)
			{
				String [] second = first[i].split("=");
				
				if(j%2==0)
				{
					ids[i]=Integer.parseInt(second[j]);
				}
				if(j%2==1)
				{
					nums[i]=Integer.parseInt(second[j]);
				}
			}
		}
		hashMap.put("ids",ids);
		hashMap.put("nums", nums);
		return hashMap;
		
	}
	
	/**
	 * 将cookie中的指定id的num替换为更新后的num
	 * @param id                     需要替换商品的id
	 * @param targetNum              需要替换的商品的数量
	 * @param cookievalue            存放在cookie中的cookieValue值
	 */
	public static String repalceString(String id,String cookieValue,int num)
	{
		id+="=";         //为了保证定位字符串的唯一性，在商品的id后+"="
		int idLength = id.length();  //计算商品id+"="的长度
		int start = cookieValue.indexOf(id)+idLength;   //从指定开始位置替换
		int end = cookieValue.indexOf(",", start);      //从指定结束位置替换
		if(end==-1)   //如果为字符串中的最后一个id时，则返回值为-1
		{
			end=+cookieValue.length();
		}
		int oldStr = Integer.parseInt(cookieValue.substring(start, end));
		System.out.println("oldStr："+oldStr);
		num+=oldStr;
		StringBuilder sb = new StringBuilder(cookieValue);
		String targetCookieValue = sb.replace(start, end, num+"")+"";
		return targetCookieValue;
	}
	
	
	public static void deleteCookieItem(HttpServletResponse response,HttpServletRequest request,String cookieName,int num,int id)
	{
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
  }
}
