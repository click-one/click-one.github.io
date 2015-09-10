package cn.wow.ssm.controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CharacterFilter implements Filter {

	private FilterConfig config = null;
	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		request.setCharacterEncoding(config.getInitParameter("charset"));
		response.setContentType(config.getInitParameter("contentType"));
		response.setCharacterEncoding(config.getInitParameter("charset"));// 将请求转发到目的地   
		chain.doFilter(request,response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		config = arg0;
		
	}

	
	

}
