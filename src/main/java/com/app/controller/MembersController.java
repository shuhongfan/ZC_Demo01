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

import com.app.entity.Members;
import com.app.service.MembersService;
import com.app.service.MorderService;
import com.app.utils.MainUtils;


@Controller
@RequestMapping("/members")
public class MembersController {
	@Resource
	MembersService membersService;

	@RequestMapping("/add")
	public String membersAdd() {
		return "members/add";
	}
	
	@RequestMapping("/addemps")
	public String addemps() {
		return "members/addemps";
	}

	@RequestMapping("/profile")
	public String profile(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/profile";
	}
	
	@RequestMapping("/charge")
	public String charge(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/charge";
	}
	@RequestMapping("/tx")
	public String tx(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/tx";
	}
	@RequestMapping("/password")
	public String password(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/password";
	}

	@RequestMapping("/avatar")
	public String avatar(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/avatar";
	}
	
	@RequestMapping("/rz")
	public String rz(HttpSession session, Model model,Integer id) {
		int userid = Integer
				.parseInt(session.getAttribute("userid").toString());
		if(id!=null) userid=id;
		model.addAttribute("edituser", membersService.getMembersById(userid));

		return "members/rz";
	}
	@RequestMapping(value = "/rz1", method = RequestMethod.POST)
	public String rz1(Integer id, String xx, Model model) {
		Members editUser = membersService.getMembersById(id);

		editUser.setXx(xx);
		
		membersService.update(editUser);
		model.addAttribute("inpost", true);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("message", "认证资料上传成功!");
		return "members/rz";
	}
	
	@RequestMapping(value = "/charge1", method = RequestMethod.POST)
	public String charge1(Integer id, Integer amount, Model model) {
		Members editUser = membersService.getMembersById(id);
Integer m = Integer.parseInt(editUser.getMoney());
		editUser.setMoney((m+amount)+"");
		
		membersService.update(editUser);
		model.addAttribute("inpost", true);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("message", "充值成功!");
		return "members/charge";
	}
	

	@RequestMapping(value = "/tx1", method = RequestMethod.POST)
	public String tx1(Integer id, Integer amount, Model model) {
		Members editUser = membersService.getMembersById(id);
Integer m = Integer.parseInt(editUser.getMoney());
if(m-amount<0){model.addAttribute("inpost", true);
model.addAttribute("id", editUser.getId());
model.addAttribute("message", "余额不足!");}else{
		editUser.setMoney((m-amount)+"");		
		membersService.update(editUser);
		model.addAttribute("inpost", true);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("message", "提现成功!");
}
		return "members/tx";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Integer id, Integer sex, String address,String maincontent, String email,
			String qq,String tel, Model model) {
		Members editUser = membersService.getMembersById(id);

		editUser.setSex(sex.toString());

		editUser.setAddress(address);
		editUser.setMaincontent(maincontent);
		editUser.setEmail(email);
		editUser.setTel(tel);
		editUser.setQq(qq);
		
		membersService.update(editUser);
		model.addAttribute("inpost", true);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("message", "资料信息更新成功!");
		return "members/profile";
	}
	
	@RequestMapping(value = "/pass")
	public String pass(Integer id, String status,Model model) {
		Members editUser = membersService.getMembersById(id);
		editUser.setStatus(status);		
		membersService.update(editUser);
		model.addAttribute("inpost", true);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("message", "审核成功!");
		return "members/customer";
	}

	@RequestMapping(value = "/update2", method = RequestMethod.POST)
	public String update2(Integer id, String thumb, Model model) {
		Members editUser = membersService.getMembersById(id);

		editUser.setThumb(thumb);
		membersService.update(editUser);
		model.addAttribute("id", editUser.getId());
		model.addAttribute("inpost", true);
		model.addAttribute("message", "头像上传成功!");
		return "members/avatar";
	}

	@RequestMapping(value = "/update1", method = RequestMethod.POST)
	public String update1(Integer id, String password, String password2,
			Model model) {
		Members editUser = membersService.getMembersById(id);

		if (!password.equals(password2)) {
			model.addAttribute("state", 0);
			model.addAttribute("message", "失败：两次输入密码不一致!");
		} else {
			editUser.setPassword(password);
			membersService.update(editUser);
			model.addAttribute("state", 1);
			model.addAttribute("id", editUser.getId());
			model.addAttribute("message", "密码重置成功!");
		}

		return "members/password";
	}


@RequestMapping(value="/save",method = RequestMethod.POST)
	public String membersSave(String username,
String password,
String sex,
String birthday,
String address,
String email,
String qq,
String tel,
String money,
String thumb,
String grade,
String type,
String created,
String updated,
String status,
String jf,
String age,
String maincontent,
String description,
Model model)
	{		
		Members modelX = new Members();		
		modelX.setUsername(username);
modelX.setPassword(password);
modelX.setSex(sex);
modelX.setBirthday(birthday);
modelX.setAddress(address);
modelX.setEmail(email);
modelX.setQq(qq);
modelX.setTel(tel);
modelX.setMoney("999999");
modelX.setGrade(grade);
modelX.setType("1");
modelX.setCreated(MainUtils.getTime());
modelX.setUpdated(updated);
modelX.setStatus(status);
modelX.setJf(jf);
modelX.setAge(age);
modelX.setMaincontent(maincontent);
modelX.setDescription(description);
		
		membersService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "新增客户成功!");
		return "members/add";
	}


	@RequestMapping("/delete")
	public String membersDelete(int id) {
		membersService.delete(id);
		return "redirect:customer";
	}
	
	@RequestMapping("/delete1")
	public String membersDelete1(int id) {
		membersService.delete(id);
		return "redirect:emps";
	}

	
	
	@RequestMapping("/customer")
	public ModelAndView customer() {
		List<Members> membersList = membersService.getMembersByType(1);
		System.out.println(membersList.size());
		ModelAndView mav = new ModelAndView("members/customer");
		mav.addObject("list", membersList);
		return mav;
	}
	
	@Resource
	MorderService morderService;
	@RequestMapping("/orders")
	public ModelAndView orders() {
		List<Members> membersList = membersService.getMembersByType(1);
		
		
		for (Members members : membersList) {
			members.setLs(morderService.getMorderByUid(members.getId()));
		}
		
		
		System.out.println(membersList.size());
		ModelAndView mav = new ModelAndView("members/orders");
		mav.addObject("list", membersList);
		return mav;
	}


}
