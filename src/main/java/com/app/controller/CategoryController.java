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
@RequestMapping("/category")
public class CategoryController {
	@Resource
	CategoryService categoryService;

	@RequestMapping("/add")
	public String categoryAdd(Model model) {
		model.addAttribute("list",categoryService.getCategoryByCate(0));
		return "category/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String categorySave(String pid, String title, String thumb,
			String description, String created, String updated, String status,
			Model model) {
		Category modelX = new Category();
		modelX.setPid(pid);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);

		categoryService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "类目新增成功!");
		return "category/add";
	}

	@RequestMapping("/delete")
	public String categoryDelete(int id) {
		categoryService.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/list")
	public ModelAndView categoryList() {
		List<Category> categoryList = categoryService.getAllCategory();
		System.out.println(categoryList.size());
		ModelAndView mav = new ModelAndView("category/list");
		mav.addObject("list", categoryList);
		return mav;
	}

	@RequestMapping("/edit")
	public String categoryEdit(String id, Model model) {
		Category category = categoryService.getCategoryById(Integer
				.parseInt(id));
		model.addAttribute("list",categoryService.getCategoryByCate(0));
		model.addAttribute("model", category);
		return "category/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String categoryUpdate(String pid, String title, String thumb,
			String description, String created, String updated, String status,
			int id, Model model) {

		Category modelX = categoryService.getCategoryById(id);
		modelX.setPid(pid);
		modelX.setTitle(title);
		modelX.setThumb(thumb);
		modelX.setDescription(description);

		categoryService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新类目成功");
		return "category/edit";
	}
}
