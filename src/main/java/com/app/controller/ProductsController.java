package com.app.controller;

import java.io.File;
import java.util.Date;
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
@RequestMapping("/products")
public class ProductsController {
	@Resource
	ProductsService productsService;
	@Resource
	CategoryService categoryService;

	@RequestMapping("/add")
	public String productsAdd(Model model) {
		model.addAttribute("list", categoryService.getAllCategory());
		return "products/add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String productsSave(HttpSession sess, String code, String product_name,
			String description, String thumb, String content,
			String category_name, String click, String category, String store,
			String vpath, String price, String created, String updated,
			String status, String brandid, String brandname, String skuid,
			String skuname, String jf, String shopname, String shopid,
			String userid, String username, String filepath, Model model) {
		category_name = categoryService.getCategoryById(
				Integer.parseInt(category)).getTitle();

		Products modelX = new Products();
		modelX.setUid(sess.getAttribute("userid").toString());
		modelX.setCode(code);
		modelX.setProduct_name(product_name);
		modelX.setDescription(description);
		modelX.setThumb(thumb);
		modelX.setContent(content);
		modelX.setCategory_name(category_name);
		modelX.setClick(click);
		modelX.setCategory(category);
		modelX.setStore(store);
		modelX.setVpath(vpath);
		modelX.setPrice(price);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setBrandid(brandid);
		modelX.setBrandname(brandname);
		modelX.setSkuid(skuid);
		modelX.setSkuname(skuname);
		modelX.setJf(jf);
		modelX.setShopname(shopname);
		modelX.setShopid(shopid);
		modelX.setUserid(userid);
		modelX.setUsername(username);
		modelX.setFilepath(filepath);
		modelX.setStore(store);
		productsService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "发布众筹项目成功!");
		return "products/add";
	}

	@RequestMapping("/delete")
	public String productsDelete(int id,String ret) {
		productsService.delete(id);
		return "redirect:"+ret;
	}@Resource
	MembersService membersService;

	@RequestMapping("/list")
	public ModelAndView productsList() {
		List<Products> productsList = productsService.getAllProducts();
		System.out.println(productsList.size());
		for (Products products : productsList) {
			products.setUs(membersService.getMembersById(Integer.parseInt(products.getUid())));
		}
		ModelAndView mav = new ModelAndView("products/list");
		mav.addObject("list", productsList);
		return mav;
	}
	

	@RequestMapping("/my")
	public ModelAndView my(HttpSession sess) {
		List<Products> productsList = productsService.getMy(sess.getAttribute("userid").toString());
		System.out.println(productsList.size());
		for (Products products : productsList) {
			products.setUs(membersService.getMembersById(Integer.parseInt(products.getUid())));
		}
		ModelAndView mav = new ModelAndView("products/my");
		mav.addObject("list", productsList);
		return mav;
	}

	@RequestMapping("/edit")
	public String productsEdit(String id, Model model) {
		model.addAttribute("list", categoryService.getAllCategory());
		Products products = productsService.getProductsById(Integer
				.parseInt(id));
		model.addAttribute("model", products);
		
		return "products/edit";
	}
	@RequestMapping("/process")
	public String process(Integer id, Model model) {
		
		float geted =0;
		Products products = productsService.getProductsById(id);
		List<Morder> ols =	morderService.getMorderByPid(id);
		for (Morder morder : ols) {
			geted+=Float.parseFloat(morder.getTotal());
		}
		float dem = Float.parseFloat( products.getPrice());
		System.out.println("Rest:"+(geted/dem));
		System.out.println("Rest:"+Math.floor((geted/dem)*100));
		model.addAttribute("width", Math.floor((geted/dem)*100)+"%");
		model.addAttribute("list",ols );model.addAttribute("geted",geted);
		
		model.addAttribute("model", products);
		
		return "products/process";
	}
	@RequestMapping("/jz")
	public String jz(String id, Model model) {
		model.addAttribute("list", categoryService.getAllCategory());
		Products products = productsService.getProductsById(Integer
				.parseInt(id));
		model.addAttribute("model", products);
		model.addAttribute("us",membersService.getMembersByType(1));
		return "products/jz";
	}
	
	@Resource
	MorderService morderService;
	@RequestMapping(value = "/addjz", method = RequestMethod.POST)
	public String addjz(HttpSession session,  Integer uid,Integer id, Model model) {
		
Members m = membersService.getMembersById(uid);
Products p = productsService.getProductsById(id);
		
		Morder obj = new Morder();
		int salerId = Integer.parseInt(p.getUid());
		Members saler = membersService.getMembersById(Integer.parseInt(p.getUid()));
		obj.setUid(m.getId()+"");
		obj.setBuyer(m.getUsername());
		obj.setPid(p.getId() + "");
		obj.setPname(p.getProduct_name());
		obj.setShopid(salerId+"");
		obj.setSaler(saler.getUsername());
		obj.setCreated(MainUtils.getTime());
		obj.setStep("1");
		obj.setNum("1");
		obj.setPrice("0");
		obj.setTotal("0");
		Date date = new Date();
		obj.setY(date.getYear()+"");
		obj.setM(date.getMonth()+"");
		obj.setD(date.getDay()+"");
		obj.setType("2");
		morderService.insert(obj);
		model.addAttribute("message", "成功");
		model.addAttribute("inpost", true);
		
		return "products/jz";
	}


	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String productsUpdate(String uid, String code, String product_name,
			String description, String thumb, String content,
			String category_name, String click, String category, String store,
			String vpath, String price, String created, String updated,
			String status, String brandid, String brandname, String skuid,
			String skuname, String jf, String shopname, String shopid,
			String userid, String username, String filepath, int id, Model model) {
		category_name = categoryService.getCategoryById(
				Integer.parseInt(category)).getTitle();

		Products modelX = productsService.getProductsById(id);

		modelX.setProduct_name(product_name);
		modelX.setDescription(description);
		modelX.setThumb(thumb);
		modelX.setContent(content);
		modelX.setStore(store);
		modelX.setCategory(category);
		modelX.setCategory_name(category_name);
		modelX.setSkuid(skuid);
		modelX.setPrice(price);

		productsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "更新项目成功");
		return "products/edit";
	}
	
	@RequestMapping(value = "/addjz")
	public String addjz( int id, Model model) {	

		Products modelX = productsService.getProductsById(id);
		modelX.setSkuid("1");

		productsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "申请提交成功");
		
		return "products/jz";
	}
	
	@RequestMapping(value = "/pass")
	public String pass( String status, int id, Model model) {
		

		Products modelX = productsService.getProductsById(id);

		modelX.setStatus(status);

		productsService.update(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("model", modelX);
		model.addAttribute("message", "审核成功");
		return "products/edit";
	}
}
