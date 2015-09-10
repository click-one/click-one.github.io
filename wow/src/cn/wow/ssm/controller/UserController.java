package cn.wow.ssm.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.wow.ssm.po.User;
import cn.wow.ssm.service.UserService;
import cn.wow.ssm.utils.CheckCode;
import cn.wow.ssm.utils.CheckEmailTel;
import cn.wow.ssm.utils.MailThread;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	//用户的登录
	@RequestMapping("/login")
	public String login(HttpServletResponse response,User user,HttpSession session) throws Exception
	{
		System.out.println(user);
		user = userService.findUserByCriteria(user);
		if(user!=null)
		{
			session.setAttribute("user", user);
			return "redirect:/item/showRollPic.action";
		}
		
		return "redirect:../login.jsp";
		
		
		
		
		
	}
	//获取验证码
	@RequestMapping("/getCheckCode")
	public void getCheckCode(HttpServletResponse response,HttpSession session)
	{
		CheckCode.getCheckCode(response,session);
		System.out.println("checkCode的值为："+session.getAttribute("checkCode"));
		
	}
	//验证输入的验证码是否正确
	@RequestMapping("/checkCode")
	public void checkCode(HttpSession session,HttpServletResponse response) throws Exception
	{
		String checkCode =(String)session.getAttribute("checkCode");
		response.setContentType("html/text;charset=utf-8"); 
		System.out.println("==========="+checkCode);
		response.getWriter().write(checkCode);
		
	}
	//验证用户名、邮箱、是否唯一 如果存在则user对象不为空，则返回给前台页面进行判断
	@RequestMapping("/checkUser") 
	public void checkUserName(User user,HttpServletResponse response) throws Exception
	{
		User userResult = userService.findUserByCriteria(user);
		if(userResult==null)     //表示数据库不存在
		{
			response.getWriter().write("1");
			System.out.println("打印1");
		}
		else
		{
			response.getWriter().write("0");
		}
		
		
	}
	//用户的注册
	@RequestMapping(value="/insertUser",method=RequestMethod.POST)
	public ModelAndView insertUser( User user,HttpServletResponse response) throws Exception
	{
		
		CheckEmailTel check = new CheckEmailTel();
			//邮箱和电话号码是否符合格
			if(check.checkEmail(user.getEmail()) && check.checkPhone(user.getTelphone()))
			{
				MailThread mailThread = new MailThread(user);
				new Thread(mailThread).start();
				userService.insertUser(user);
			}
			else
			{
				throw new Exception("邮箱或者电话号码的格式不正确时！！！");
			}
		
		response.getWriter().write("success！！！");
		
		return null;
		
		
		
	}
	//当用户点击激活邮箱的连接后，更新数据库里的激活时间和激活状态
	@RequestMapping("/activeUpdateUser")
	public ModelAndView activeUpdateUser(User user,HttpSession session) throws Exception
	{
		System.out.println("用户的用户名为："+user.getUsername());
		user.setActiveTime(new Date());
		user.setActiveState("yes");
		userService.activeUpdateUser(user);
		session.setAttribute("user", user);//激活邮箱后将其设置为自动登录状态
		
		return new ModelAndView("activeEmailSuccess","user",user);
	}
    //根据用户名来查询用户
	public void selectPasswordByUsername(String originalPassword,HttpSession session,HttpServletResponse response) throws Exception
	{
		User user = (User)session.getAttribute("user");
		String username = user.getUsername();
	    user = userService.selectPasswordByUsername(username);
	    if(user.getPassword()==originalPassword)
	    {
	    	response.getWriter().write("success");
	    }
	    else
	    {
	    	response.getWriter().write("fail");
	    }
	}
    //更新用户的密码
	public void updatePassword(String password,String originalPassword,HttpSession session) throws Exception
	{

		User user = (User)session.getAttribute("user");
		String username = user.getUsername();
	    user = userService.selectPasswordByUsername(username);
	    if(user.getPassword()!=originalPassword)
	    {
	    	new RuntimeException("你输入的两次密码不一致！");
	    }
	    else
	    {
	    	userService.updatePassword(user);
	    	
	    }
	}
	//用户的退出操作
	@RequestMapping("/logout")
	public String logOut(HttpSession session)
	{
		session.removeAttribute("user");
		return "login";
	}
}
