package com.app.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.app.entity.*;
import com.app.service.*;

@Controller
@RequestMapping("/setting")
public class SettingController {
	@Resource
	SettingService settingService;

	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("cfg", settingService.getSettingById(1));
		return "setting/index";
	}

	@RequestMapping(value = "/update2", method = RequestMethod.POST)
	public String update2( String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, String title, String keywords,
			String description, Model model) {

		Setting modelX = settingService.getSettingById(1);
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		//modelX.setCount(count);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新信息成功");
		return "setting/index";
	}
	@RequestMapping("/setting/add")
	public String settingAdd() {
		return "admin/setting/add";
	}

	@RequestMapping(value = "/setting/save", method = RequestMethod.POST)
	public String settingSave(String title, String keywords,
			String description, String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, Model model) {
		Setting modelX = new Setting();
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		//modelX.setCount(count);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/setting/add";
	}

	@RequestMapping("/setting/delete")
	public String settingDelete(int id) {
		settingService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/setting/list")
	public ModelAndView settingList() {
		List<Setting> settingList = settingService.getAllSetting();
		System.out.println(settingList.size());
		ModelAndView mav = new ModelAndView("admin/setting/list");
		mav.addObject("list", settingList);
		return mav;
	}

	@RequestMapping("/setting/edit")
	public String settingEdit(String id, Model model) {
		Setting setting = settingService.getSettingById(Integer.parseInt(id));
		model.addAttribute("model", setting);
		return "admin/setting/edit";
	}

	@RequestMapping(value = "/setting/update", method = RequestMethod.POST)
	public String settingUpdate(String title, String keywords,
			String description, String copyright, String address, String url,
			String facebook, String tel, String email, String fax, String icp,
			String phone, String weibo, String count, String other,
			String master, int id, Model model) {

		Setting modelX = settingService.getSettingById(id);
		modelX.setTitle(title);
		modelX.setKeywords(keywords);
		modelX.setDescription(description);
		modelX.setCopyright(copyright);
		modelX.setAddress(address);
		modelX.setUrl(url);
		modelX.setFacebook(facebook);
		modelX.setTel(tel);
		modelX.setEmail(email);
		modelX.setFax(fax);
		modelX.setIcp(icp);
		modelX.setPhone(phone);
		modelX.setWeibo(weibo);
		//modelX.setCount(count);
		modelX.setOther(other);
		modelX.setMaster(master);

		settingService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/setting/edit";
	}
}
