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
import com.app.utils.MainUtils;

@Controller
@RequestMapping("/ads")
public class AdsController {
	@Resource
	AdsService adsService;

	@RequestMapping("/add")
	public String adsAdd() {
		return "ads/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String adsSave(String title, String url, String thumb,
			String created, String updated, String status, String intro,
			Model model) {
		Ads modelX = new Ads();
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setIntro(intro);

		adsService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "上传海报图成功!");
		return "ads/add";
	}

	@RequestMapping("/delete")
	public String adsDelete(int id) {
		adsService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/list")
	public ModelAndView adsList() {
		List<Ads> adsList = adsService.getAllAds();
		System.out.println(adsList.size());
		ModelAndView mav = new ModelAndView("ads/list");
		mav.addObject("list", adsList);
		return mav;
	}

	@RequestMapping("/edit")
	public String adsEdit(String id, Model model) {
		Ads ads = adsService.getAdsById(Integer.parseInt(id));
		model.addAttribute("model", ads);
		return "ads/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String adsUpdate(String title, String url, String thumb,
			String created, String updated, String status, String intro,
			int id, Model model) {

		Ads modelX = adsService.getAdsById(id);
		modelX.setTitle(title);
		modelX.setUrl(url);
		modelX.setThumb(thumb);
		modelX.setIntro(intro);

		adsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新海报图成功");
		return "ads/edit";
	}
}
