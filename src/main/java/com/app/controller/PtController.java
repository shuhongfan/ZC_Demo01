package com.app.controller;

import java.io.File;
import java.util.LinkedList;
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
@RequestMapping("/pt")
public class PtController {
	@Resource
	PtService ptService;
	@Resource
	ProductsService productsService;

	@RequestMapping("/pt/add")
	public String ptAdd(Model model,HttpSession sess ) {
		model.addAttribute("ls", productsService.getMy(sess.getAttribute("userid").toString()));
		return "pt/add";
	}

	@RequestMapping(value = "/pt/save", method = RequestMethod.POST)
	public String ptSave(String[] ids, String price, String product_name,
			HttpSession sess, String description, String thumb, String userid,
			Model model) {
		Pt modelX = new Pt();
		String saveStr = "";
		if (ids.length > 0) {
			int index = 0;
			for (String string : ids) {
				if (index != ids.length - 1) {
					saveStr += string + ",";
				} else {
					saveStr += string;
				}
				index++;
			}
		}
		modelX.setProduct_name(product_name);
		modelX.setIds(saveStr);
		modelX.setPrice(price);
		modelX.setDescription(description);
		modelX.setThumb(thumb);
		modelX.setUserid(sess.getAttribute("userid").toString());

		ptService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "pt/add";
	}

	@RequestMapping("/pt/delete")
	public String ptDelete(int id) {
		ptService.delete(id);
		return "redirect:my";
	}
	@Resource
	MembersService membersService;

	@RequestMapping("/pt/my")
	public ModelAndView ptList(HttpSession sess) {
		List<Pt> ptList = ptService.getAllPt();
		List<Pt> ptList1 = new LinkedList<Pt>();
		for (Pt pt : ptList) {
			if(pt.getUserid().equals(sess.getAttribute("userid").toString())){
				
				pt.setUs(membersService.getMembersById(Integer.parseInt(pt.getUserid())));
				
				List<Products> ls= new LinkedList<Products>();
				String[] ids = pt.getIds().split(",");
				for (String string : ids) {
					ls.add(productsService.getProductsById(Integer.parseInt(string)));
				}
				pt.setLs(ls);
				ptList1.add(pt);
			}
		}
		System.out.println(ptList.size());
		ModelAndView mav = new ModelAndView("pt/my");
		mav.addObject("list", ptList1);
		return mav;
	}

	@RequestMapping("/pt/edit")
	public String ptEdit(String id, Model model) {
		Pt pt = ptService.getPtById(Integer.parseInt(id));
		model.addAttribute("model", pt);
		return "pt/edit";
	}

	@RequestMapping(value = "/pt/update", method = RequestMethod.POST)
	public String ptUpdate(String ids, String price, String description,
			String thumb, String userid, int id, Model model) {

		Pt modelX = ptService.getPtById(id);
		modelX.setIds(ids);
		modelX.setPrice(price);
		modelX.setDescription(description);
		modelX.setThumb(thumb);
		modelX.setUserid(userid);

		ptService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "pt/edit";
	}
}
