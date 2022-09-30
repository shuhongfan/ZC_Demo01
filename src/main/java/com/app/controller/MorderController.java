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
@RequestMapping("/morder")
public class MorderController {
	@Resource
	MorderService morderService;

	@RequestMapping("/morder/add")
	public String morderAdd() {
		return "admin/morder/add";
	}

	@RequestMapping(value = "/morder/save", method = RequestMethod.POST)
	public String morderSave(String order_id, String price, String total,
			String uid, String pid, String cuid, String num, String content,
			String step, String updated, String created, String status,
			String buyer, String pname, String type, String saler,
			String shopid, String shopname, String ordersn, String y, String m,
			String d, Model model) {
		Morder modelX = new Morder();
		modelX.setOrder_id(order_id);
		modelX.setPrice(price);
		modelX.setTotal(total);
		modelX.setUid(uid);
		modelX.setPid(pid);
		modelX.setCuid(cuid);
		modelX.setNum(num);
		modelX.setContent(content);
		modelX.setStep(step);
		modelX.setUpdated(updated);
		modelX.setCreated(created);
		modelX.setStatus(status);
		modelX.setBuyer(buyer);
		modelX.setPname(pname);
		modelX.setType(type);
		modelX.setSaler(saler);
		modelX.setShopid(shopid);
		modelX.setShopname(shopname);
		modelX.setOrdersn(ordersn);
		modelX.setY(y);
		modelX.setM(m);
		modelX.setD(d);

		morderService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "Success!");
		return "admin/morder/add";
	}

	@RequestMapping("/morder/delete")
	public String morderDelete(int id) {
		morderService.delete(id);
		return "redirect:list";
	}
	@Resource
	ProductsService productsService;
	@Resource
	MembersService membersService;
	@RequestMapping("/list")
	public ModelAndView morderList() {
		List<Morder> morderList = morderService.getAllMorder();
		System.out.println(morderList.size());
		ModelAndView mav = new ModelAndView("morder/list");
		mav.addObject("list", morderList);
		return mav;
	}
	
	@RequestMapping("/list1")
	public ModelAndView morderList1() {
		List<Morder> morderList = morderService.getAllMorder();
		System.out.println(morderList.size());
		
		for (Morder morder : morderList) {
			morder.setP(productsService.getProductsById(Integer.parseInt(morder.getPid())));
		}
		
		ModelAndView mav = new ModelAndView("morder/list1");
		mav.addObject("list", morderList);
		return mav;
	}
	
	@RequestMapping("/list2")
	public ModelAndView morderList2() {
		List<Morder> morderList = morderService.getAllMorder();
		System.out.println(morderList.size());for (Morder morder : morderList) {
			morder.setP(productsService.getProductsById(Integer.parseInt(morder.getPid())));
		}
		ModelAndView mav = new ModelAndView("morder/list2");
		mav.addObject("list", morderList);
		return mav;
	}
	
	@RequestMapping("/list3")
	public ModelAndView morderList3() {
		List<Morder> morderList = morderService.getAllMorder();
		System.out.println(morderList.size());for (Morder morder : morderList) {
			morder.setP(productsService.getProductsById(Integer.parseInt(morder.getPid())));
		}
		ModelAndView mav = new ModelAndView("morder/list3");
		mav.addObject("list", morderList);
		return mav;
	}
	
	@RequestMapping("/report")
	public ModelAndView report(Integer y,Integer m,Integer d) {
		List<Products> list = productsService.getAllProducts();
		
		for (Products products : list) {
			List<Morder> os = morderService.getMorderByPid(products.getId());
			List<Morder> os1 = new LinkedList<Morder>();
			for (Morder morder : os) {
				if(y!=null){
					if(!y.toString().equals(morder.getY())) continue;
				}
				if(m!=null){
					if(!m.toString().equals(morder.getM())) continue;
				}
				if(d!=null){
					if(!d.toString().equals(morder.getD())) continue;
				}
				os1.add(morder);
			}
			products.setList(os1);
		}
		
		
		ModelAndView mav = new ModelAndView("morder/report");
		mav.addObject("list", list);
		return mav;
	}
	
	
	@Resource
	InviceService inviceService;
	@RequestMapping("/morder/ts")
	public ModelAndView ts() {
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
		ModelAndView mav = new ModelAndView("morder/ts");
		mav.addObject("list", inviceList);
		return mav;
	}
	
	@RequestMapping("/morder/tslist")
	public ModelAndView tslist() {
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
		ModelAndView mav = new ModelAndView("morder/tslist");
		mav.addObject("list", inviceList);
		return mav;
	}

	@RequestMapping("/my")
	public ModelAndView my(HttpSession session) {
		int uid = Integer.parseInt(session.getAttribute("userid").toString());
		List<Morder> morderList = morderService.getMorderByUid(uid);
		System.out.println(morderList.size());
		ModelAndView mav = new ModelAndView("morder/my");
		mav.addObject("list", morderList);
		return mav;
	}

	@RequestMapping(value = "/morder/st")
	public String state(String ret, String status,

	int id, Model model) {

		Invice modelX = inviceService.getInviceById(id);

		modelX.setStatus(status);

		inviceService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "Success");
		return "morder/"+ret;
	}
	@RequestMapping("/state")
	public String state(Model model, HttpSession session, Integer id,
			String ret, int step) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStep(step + "");
		morderService.update(modelX);
		if(step==4){
			Members mem = membersService.getMembersById(Integer.parseInt(modelX.getShopid()));
			Integer um = Integer.parseInt(mem.getMoney());
			Integer mm = Integer.parseInt(modelX.getTotal());
			Integer left = um+mm;
			morderService.update(modelX);
			mem.setMoney(left.toString());
			membersService.update(mem);
			model.addAttribute("message", "操作成功:资金已打入发起人账号");
		}else{
		model.addAttribute("message", "操作成功");
		}
		return "morder/" + ret;
	}
	
	
	@RequestMapping("/fk")
	public String fk(Model model, HttpSession session, Integer id) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStatus("1");
		morderService.update(modelX);
		
			Members mem = membersService.getMembersById(Integer.parseInt(modelX.getShopid()));
			Integer um = Integer.parseInt(mem.getMoney());
			Integer mm = Integer.parseInt(modelX.getTotal());
			Integer left = um+mm;
			morderService.update(modelX);
			mem.setMoney(left.toString());
			membersService.update(mem);
			model.addAttribute("message", "操作成功:资金已打入发起人账号");
		
		return "morder/list1" ;
	}
	
	@RequestMapping("/tk")
	public String tk(Model model, HttpSession session, Integer id) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStatus("2");
		morderService.update(modelX);
		
			Members mem = membersService.getMembersById(Integer.parseInt(modelX.getUid()));
			Integer um = Integer.parseInt(mem.getMoney());
			Integer mm = Integer.parseInt(modelX.getTotal());
			Integer left = um+mm;
			morderService.update(modelX);
			mem.setMoney(left.toString());
			membersService.update(mem);
			model.addAttribute("message", "操作成功:资金已打入投资人账号");
		
		return "morder/list2" ;
	}
	@RequestMapping("/hb")
	public String hb(Model model, HttpSession session, Integer id) {
		Morder modelX = morderService.getMorderById(id);
		modelX.setStatus("3");
		morderService.update(modelX);
		
			
			model.addAttribute("message", "操作成功:已发送回报");
		
		return "morder/list2" ;
	}
	@RequestMapping("/state2")
	public String state2(Model model, HttpSession session, Integer id,String ordersn,
			String ret, int step) {
		Morder modelX = morderService.getMorderById(id);
		Products ps = productsService.getProductsById(Integer.parseInt(modelX.getPid()));
		/*
		if(Integer.parseInt(ps.getStore())<Integer.parseInt(modelX.getNum())){
			
			model.addAttribute("message", "对不起 库存告急");
			
		}else{*/
		Members mem = membersService.getMembersById(Integer.parseInt(session.getAttribute("userid").toString()));
		Integer um = Integer.parseInt(mem.getMoney());
		Integer mm = Integer.parseInt(modelX.getTotal());
		Integer left = um-mm;
		
		
		if(left<0){
			model.addAttribute("message", "余额不足，请联系管理员充值");
		}else{
		modelX.setStep(step + "");
		modelX.setOrdersn(ordersn);
		mem.setMoney(left.toString());
		membersService.update(mem);
		morderService.update(modelX);
		model.addAttribute("message", "支付成功，您的资金将在项目结束后打入发起人账号");
		}
	//	}
		return "morder/" + ret;
	}

	@RequestMapping("/pay")
	public String pay(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "admin/morder/pay";
	}
	
	@RequestMapping("/pj")
	public String pj(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "morder/pj";
	}
	@RequestMapping("/wl")
	public String wl(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "morder/wl";
	}
	
	@RequestMapping("/fq")
	public String fq(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "morder/fq";
	}
	
	
	@RequestMapping("/morder/edit")
	public String morderEdit(String id, Model model) {
		Morder morder = morderService.getMorderById(Integer.parseInt(id));
		model.addAttribute("model", morder);
		return "admin/morder/edit";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String morderUpdate( String content, String status, int id, Model model) {

		Morder modelX = morderService.getMorderById(id);
		
		modelX.setContent(content);
		modelX.setStatus(status);

		morderService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "评价成功");
		return "morder/pj";
	}
	

	@RequestMapping(value = "/update2", method = RequestMethod.POST)
	public String update2(String express, int id, Model model) {

		Morder modelX = morderService.getMorderById(id);		
		modelX.setExpress(express);
		
		morderService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "物流更新成功");
		return "morder/wl";
	}
}
