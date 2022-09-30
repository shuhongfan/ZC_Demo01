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
@RequestMapping("/invice")
public class InviceController {
	@Resource
	InviceService inviceService;

	@RequestMapping("/invice/add")
	public String inviceAdd() {
		return "admin/invice/add";
	}

	@RequestMapping(value = "/invice/save", method = RequestMethod.POST)
	public String inviceSave(String uid, String mid, String content,
			String type, String created, String updated, String status,
			String reply, Model model) {
		Invice modelX = new Invice();
		modelX.setUid(uid);
		modelX.setMid(mid);
		modelX.setContent(content);
		modelX.setType(type);
		modelX.setCreated(created);
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setReply(reply);

		inviceService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/invice/add";
	}

	@RequestMapping("/invice/delete")
	public String inviceDelete(int id) {
		inviceService.delete(id);
		return "redirect:list";
	}

	@Resource
	ProductsService productsService;
	@Resource
	MembersService membersService;

	@RequestMapping("/invice/list")
	public ModelAndView inviceList(HttpSession sess) {
		List<Invice> inviceList = inviceService.getAllInvice();
		// System.out.println(inviceList.size());
		for (Invice invice : inviceList) {
			invice.setM(membersService.getMembersById(Integer.parseInt(invice
					.getUid())));
			invice.setP(productsService.getProductsById(Integer.parseInt(invice
					.getMid())));
			invice.setM1(membersService.getMembersById(Integer.parseInt(invice
					.getType())));
		}
		ModelAndView mav = new ModelAndView("admin/invice/list");
		mav.addObject("list", inviceList);
		return mav;
	}

	@RequestMapping("/invice/edit")
	public String inviceEdit(String id, Model model) {
		Invice invice = inviceService.getInviceById(Integer.parseInt(id));
		model.addAttribute("model", invice);
		return "admin/invice/edit";
	}

	@RequestMapping(value = "/invice/update", method = RequestMethod.POST)
	public String inviceUpdate(String uid, String mid, String content,
			String type, String created, String updated, String status,
			String reply, int id, Model model) {

		Invice modelX = inviceService.getInviceById(id);
		modelX.setUid(uid);
		modelX.setMid(mid);
		modelX.setContent(content);
		modelX.setType(type);
		modelX.setCreated(created);
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setReply(reply);

		inviceService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/invice/edit";
	}

	@RequestMapping(value = "/invice/state")
	public String state(String ret, String status,

	int id, Model model) {

		Invice modelX = inviceService.getInviceById(id);

		modelX.setStatus(status);

		inviceService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "admin/invice/list";
	}
}
