package cn.wow.ssm.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckEmailTel {
	//匹配成功则返回true，验证失败则返回false
	public boolean startCheck(String reg,String str)
	{
		boolean flag = false;
		 Pattern pattern = Pattern.compile(reg);  
		 Matcher matcher = pattern.matcher(str);
		 flag = matcher.matches();
		return flag;
	}
	
	
	//该正则表达式验证邮箱的规则：@前面的内容不能以_开头和结尾，必须存在@，@后面和结尾也必须是字母开头、结尾，中间有一个.
	public boolean checkEmail(String str) 
	{
		String reg ="^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		String reg1="^(\\w+[-|_|\\.]?)+@\\w+((-\\w+)?\\.)+\\w{2,}";
		
		
		return this.startCheck(reg, str);
	}
	
	//验证11位手机号码
	public boolean checkPhone(String str)
	{
		String reg ="^1[3458]{1}\\d{9}$";
		return this.startCheck(reg, str);
	}
}
