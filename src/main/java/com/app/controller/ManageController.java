package com.app.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import com.app.entity.Members;
import com.app.entity.Setting;
import com.app.service.MembersService;
import com.app.service.SettingService;
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Resource MembersService ms;	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		if (session.getAttribute("userid") != null)
			return "index";
		else
			return "login";
	}
	
	@RequestMapping("/mobile")
	public String mobile(HttpSession session) {		
			return "mobile";
	}
	@ResponseBody
	@RequestMapping("/code")
	public String code(String tel,HttpSession session) {
		List<Members> list = ms.getMembersByTel(tel);
		if(list.size()==0){
			return "0";
		}else{
			String code =String.valueOf((Math.random()*9+1)*100000);
			code = code.substring(0, 6);
			Members m = list.get(0);
			m.setGrade(code.toString());
			ms.update(m);
			return code.toString();
		}
			
	}


	@RequestMapping("/quit")
	public String quit(HttpSession session) {
		session.setAttribute("logined", null);
		session.setAttribute("userid", null);
		session.setAttribute("username", null);
		session.setAttribute("usertype", null);
		return "redirect:index";

	}
	@Resource
	SettingService settingService;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session,
			Model model) {
		System.out.println("Username:" + username);
		System.out.println("Password:" + password);
		Members entity = new Members();
		entity.setUsername(username);
		entity.setPassword(password);
		List<Members> list = ms.login(entity);
		if (list.size() > 0) {
			Members loginUser = list.get(0);
			
			Setting modelX = settingService.getSettingById(1);
			int count = Integer.parseInt(modelX.getCount());
			modelX.setCount((count+1)+"");
			settingService.update(modelX);
			
			session.setAttribute("logined", loginUser);
			session.setAttribute("userid", loginUser.getId());
			session.setAttribute("username", loginUser.getUsername());
			session.setAttribute("usertype", loginUser.getType());
			session.setAttribute("avatar", loginUser.getThumb());
			model.addAttribute("state", 1);
			model.addAttribute("message", "登录成功!正在跳转");
		} else {
			model.addAttribute("state", 0);
			model.addAttribute("message", "登录失败，请检查您的账号密码!");
		}
		return "login";
	}
	
	@RequestMapping(value = "/mobilelogin", method = RequestMethod.POST)
	public String mobilelogin(String username, String password, HttpSession session,
			Model model) {
		System.out.println("Username:" + username);
		System.out.println("Password:" + password);
		Members entity = new Members();
		entity.setTel(username);
		entity.setGrade(password);
		List<Members> list = ms.login2(entity);
		if (list.size() > 0) {
			Members loginUser = list.get(0);
			
			Setting modelX = settingService.getSettingById(1);
			int count = Integer.parseInt(modelX.getCount());
			modelX.setCount((count+1)+"");
			settingService.update(modelX);
			
			session.setAttribute("logined", loginUser);
			session.setAttribute("userid", loginUser.getId());
			session.setAttribute("username", loginUser.getUsername());
			session.setAttribute("usertype", loginUser.getType());
			session.setAttribute("avatar", loginUser.getThumb());
			model.addAttribute("state", 1);
			model.addAttribute("message", "登录成功!正在跳转");
		} else {
			model.addAttribute("state", 0);
			model.addAttribute("message", "登录失败，请检查您的账号密码!");
		}
		return "mobile";
	}
	
}
