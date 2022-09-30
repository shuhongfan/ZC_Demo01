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
@RequestMapping("/comment")
public class CommentController {
	@Resource
	CommentService commentService;

	@RequestMapping("/comment/add")
	public String commentAdd() {
		return "admin/comment/add";
	}

	@RequestMapping(value = "/comment/save", method = RequestMethod.POST)
	public String commentSave(String uid, String mid, String content,
			String type, String created, String updated, String status,
			String reply, Model model) {
		Comment modelX = new Comment();
		modelX.setUid(uid);
		modelX.setMid(mid);
		modelX.setContent(content);
		modelX.setType(type);
		modelX.setCreated(created);
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setReply(reply);

		commentService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/comment/add";
	}

	@RequestMapping("/delete")
	public String commentDelete(int id) {
		commentService.delete(id);
		return "redirect:index";
	}

	@RequestMapping("/index")
	public ModelAndView commentList() {
		List<Comment> commentList = commentService.getAllComment();
		System.out.println(commentList.size());
		ModelAndView mav = new ModelAndView("comment/index");
		mav.addObject("list", commentList);
		return mav;
	}

	@RequestMapping("/edit")
	public String commentEdit(String id, Model model) {
		Comment comment = commentService.getCommentById(Integer.parseInt(id));
		model.addAttribute("model", comment);
		return "comment/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String commentUpdate(HttpSession session,String uid, String mid, String content,
			String type, String created, String updated, String status,
			String reply, String id, Model model) {

		Comment modelX = new Comment();
		modelX.setUid(session.getAttribute("userid").toString());
		modelX.setContent("<span style='color:#c00'>@回复：</span>"+content);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(session.getAttribute("username").toString());
		modelX.setMid(id);

		commentService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "回复成功");
		return "redirect:index";
	}
}
