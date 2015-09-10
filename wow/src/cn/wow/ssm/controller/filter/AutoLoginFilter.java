package cn.wow.ssm.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.wow.ssm.controller.UserController;
import cn.wow.ssm.utils.CookieUtils;
/**
 * 用户自动登录的过滤器
 * @author didi
 *
 */
public class AutoLoginFilter implements Filter{
	private final static String autoLoginName="autoLoginName";

	@Override
	public void destroy() {
		
	}

	@Override//默认登录为30天
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		Cookie cookies[] = request.getCookies();
		if(cookies!=null)
		{
			Cookie cookie = CookieUtils.findCookie(cookies, autoLoginName);
			if(cookie!=null)
			{
				String cookieValue = cookie.getValue();
				String info[] = cookieValue.split("=");
				String userName = info[0];
				String password = info[1];
				UserController userController = new UserController();
//				/*if(userController.l)
//				{
//					
//				}*/
			}
		}
		
		
			
		
		
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	

}
