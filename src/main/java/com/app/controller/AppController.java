package com.app.controller;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.Cart;
import com.app.entity.Category;
import com.app.entity.Comment;
import com.app.entity.Fav;
import com.app.entity.Invice;
import com.app.entity.Members;
import com.app.entity.Morder;
import com.app.entity.Products;
import com.app.entity.Pt;
import com.app.entity.Setting;
import com.app.service.AdsService;
import com.app.service.CategoryService;
import com.app.service.CommentService;
import com.app.service.FavService;
import com.app.service.InviceService;
import com.app.service.MembersService;
import com.app.service.MorderService;
import com.app.service.ProductsService;
import com.app.service.PtService;
import com.app.service.SettingService;

import com.app.utils.MainUtils;

@Controller
@RequestMapping("/app")
public class AppController {

	@Resource
	MembersService ms;
	@Resource
	SettingService settingService;
	@Resource
	CategoryService categoryService;
	@Resource
	AdsService adsService;
	@Resource
	ProductsService productsService;
	
	@RequestMapping("/test")
	public String test()
	{
		return "home/test";
	}
			
	@RequestMapping("/index")
	public String index(HttpSession session, Model model) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		model.addAttribute("cates", categoryService.getCategoryByCate(0));
		model.addAttribute("ls", productsService.getAllProducts());
		model.addAttribute("ads", adsService.getAllAds());
		return "app/index";
	}
	@Resource
	PtService ptService;
	@RequestMapping("/tuan")
	public String tuan(HttpSession session, Model model) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();		
		model.addAttribute("cates", cates);
		List<Pt> ptList = ptService.getAllPt();
		for (Pt pt : ptList) {
			
				
				pt.setUs(membersService.getMembersById(Integer.parseInt(pt.getUserid())));
				
				List<Products> ls= new LinkedList<Products>();
				String[] ids = pt.getIds().split(",");
				for (String string : ids) {
					ls.add(productsService.getProductsById(Integer.parseInt(string)));
				}
				pt.setLs(ls);
				
			
		}
		model.addAttribute("ls", ptList);
		
		return "app/tuan";
	}

	@RequestMapping("/categoies")
	public String categoies(HttpSession session, Model model, Integer id) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		
		List<Products> ls = productsService.getProductsByCate(id);
		for (Products products : ls) {
			products.setShopname(membersService.getMembersById(Integer.parseInt(products.getUid())).getUsername());
		}
		
		model.addAttribute("cates", cates);
		model.addAttribute("cates1", categoryService.getCategoryByCate(id));
		model.addAttribute("cate", categoryService.getCategoryById(id));
		model.addAttribute("list", ls);
		return "app/categoies";
	}
	
	@RequestMapping(value = "/lq")
	public String addjz(HttpSession session,  Integer uid,Integer id, Model model) {
		uid = Integer.parseInt(session.getAttribute("userid").toString());
Members m = membersService.getMembersById(uid);
Products p = productsService.getProductsById(id);
p.setSkuid(null);
productsService.update(p);
		
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
		model.addAttribute("message", "申请成功");
		model.addAttribute("inpost", true);
		
		return "app/jz";
	}
	
	@RequestMapping("/jz")
	public String jz(HttpSession session, Model model) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		model.addAttribute("cates", cates);
		model.addAttribute("list", productsService.getProductsJz());
		return "app/jz";
	}

	@RequestMapping("/detail")
	public String detail(HttpSession session, Model model, Integer id) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		boolean faved = false;
				
		if(session.getAttribute("userid")!=null){
			String uid = session.getAttribute("userid")
					.toString();
			System.out.println("uid:"+uid);
			System.out.println("pid:"+id);
			Fav f = new Fav();
			f.setPid(id.toString());
			f.setUid(uid);
			List<Fav> list = favService.getFav2(f);
			if(list.size()>0) faved=true;
		}
		
		Products p = productsService.getProductsById(id);
		
		int geted =0; 
	List<Morder> ols =	morderService.getMorderByPid(id);
	for (Morder morder : ols) {
		geted+=Integer.parseInt(morder.getTotal());
	}
		
		model.addAttribute("cmt",morderService.getMorderCMT(id));
		model.addAttribute("faved", faved);
		model.addAttribute("geted",geted);
		model.addAttribute("ols",ols);
		model.addAttribute("cates", cates);model.addAttribute("cates1", categoryService.getCategoryByCate(0));
		model.addAttribute("author",membersService.getMembersById(Integer.parseInt(p.getUid())));
		model.addAttribute("g",p );
		model.addAttribute("list", productsService.getProductsRand());
		return "app/detail";
	}
	
	

	@RequestMapping("/iwant")
	public String iwant(HttpSession session, Model model, Integer id) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		boolean faved = false;
				
		if(session.getAttribute("userid")!=null){
			String uid = session.getAttribute("userid")
					.toString();
			System.out.println("uid:"+uid);
			System.out.println("pid:"+id);
			Fav f = new Fav();
			f.setPid(id.toString());
			f.setUid(uid);
			List<Fav> list = favService.getFav2(f);
			if(list.size()>0) faved=true;
		}
		
		Products p = productsService.getProductsById(id);
		
		int geted =0; 
	List<Morder> ols =	morderService.getMorderByPid(id);
	for (Morder morder : ols) {
		geted+=Integer.parseInt(morder.getTotal());
	}
		
		model.addAttribute("cmt",morderService.getMorderCMT(id));
		model.addAttribute("faved", faved);
		model.addAttribute("geted",geted);
		model.addAttribute("cates", cates);model.addAttribute("cates1", categoryService.getCategoryByCate(0));
		model.addAttribute("author",membersService.getMembersById(Integer.parseInt(p.getUid())));
		model.addAttribute("g",p );
		model.addAttribute("list", productsService.getProductsRand());
		return "app/iwant";
	}

	
	@RequestMapping("/ts")
	public String ts(HttpSession session, Model model, Integer id) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		for (Category category : cates) {
			category.setLs(productsService.getProductsByCate(category.getId()));
		}
		
	Products p = productsService.getProductsById(id);
		model.addAttribute("cates", cates);
		model.addAttribute("g", p);
		model.addAttribute("saler", membersService.getMembersById(Integer.parseInt(p.getUid())));
		return "app/ts";
	}
	@Resource
	FavService favService;
	@RequestMapping("/fav1")
	public String favDelete(Integer id,HttpSession session) {
		String uid = session.getAttribute("userid")
				.toString();
		Fav f = new Fav();
		f.setPid(id.toString());
		f.setUid(uid);
		List<Fav> list = favService.getFav2(f);
		favService.delete(list.get(0).getId());
		return "redirect:detail?id="+id;
	}
	@RequestMapping("/fav")
	public String fav(HttpSession session, Model model, Integer id) {
		String uid = session.getAttribute("userid")
				.toString();
		
		Fav f = new Fav();
		f.setPid(id.toString());
		f.setUid(uid);
		List<Fav> list = favService.getFav2(f);
		
		if(list.size()>0)
		{model.addAttribute("message","你已经关注过了");			
			
		}else{
			Fav m = new Fav();
			m.setPid(id+"");
			m.setUid(uid+"");
			favService.insert(m);
			model.addAttribute("message","关注成功");
		}
		model.addAttribute("id",id);
		return "app/detail";
		
		
	}

	@RequestMapping("/cart")
	public String cart(HttpSession session, Model model, Integer id) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		model.addAttribute("cates", cates);
		return "app/cart";
	}

	public void setTotal(HttpSession session) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		int total = 0;
		for (Cart cart : list) {
			total += Integer.parseInt(cart.getP().getPrice()) * cart.getNum();
		}
		session.setAttribute("cartTotal", total);
	}

	@RequestMapping("/search")
	public String search(Model model, String q) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		model.addAttribute("cates", cates);

		model.addAttribute("list", productsService.search("%" + q + "%"));
		return "app/search";
	}

	@Resource
	MembersService membersService;

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(String xx,String zy,String nj,String username, String password, String sex,
			String birthday, String address, String email, String qq,
			String tel, String money, String thumb, String grade, String type,
			String created, String updated, String status, String jf,
			String age, String maincontent, String description, Model model) {
		Members modelX = new Members();
		modelX.setUsername(username);
		modelX.setPassword(password);
		modelX.setSex(sex);
		modelX.setBirthday(birthday);
		modelX.setAddress(address);
		modelX.setEmail(email);
		modelX.setQq(qq);
		modelX.setTel(tel);
		modelX.setMoney(money);
		modelX.setGrade(grade);
		modelX.setType("1");
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(updated);
		modelX.setStatus(status);
		modelX.setJf(jf);
		modelX.setAge(age);
		modelX.setMaincontent(maincontent);
		modelX.setDescription(description);
		modelX.setXx(xx);
		modelX.setZy(zy);
		modelX.setNj(nj);

		membersService.insert(modelX);
		model.addAttribute("inpost", true);
		model.addAttribute("message", "账号注册成功!");
		return "app/sign";
	}

	@RequestMapping("/sign")
	public String sign(Model model) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		model.addAttribute("cates", cates);

		return "app/sign";
	}

	@Resource
	CommentService commentService;

	@RequestMapping("/feedback")
	public String feedback(Model model) {
		model.addAttribute("site", settingService.getSettingById(1));
		List<Category> cates = categoryService.getAllCategory();
		model.addAttribute("cates", cates);

		List<Comment> ls = this.getAll(0);
		System.out.println("S:"+ls.size());
		model.addAttribute("html", this.getHtml(ls,1));
		
		model.addAttribute("list", ls);
		return "app/feedback";
	}

	public static String[] arr = new String[]{"info","primary","danger","success","warning"};
	
	public String getHtml(List<Comment> ls,int level)
	{
		String html="";
		for (Comment comment : ls) {
			Random r = new Random();
			String item = "<div style='margin-bottom:15px;border-bottom:1px solid #ddd; margin-left:"+level+"px' class='uk-comment alert alert-"+arr[r.nextInt(4)]+"'>";
			item+="<h5 style='margin-bottom:10px;font-size:14px;'><span class='badge badge-"+arr[r.nextInt(4)]+"'>"+comment.getUpdated()+"</span>/"+comment.getCreated()+"发布</h5>";
			item+="<p style='margin-top:0px'>"+comment.getContent()+"";
			item+="<a class='btn btn-link' href='javascript:;' onclick=javascript:show("+comment.getId()+") >回复</a></p>";
			item+=this.getHtml(comment.getSubs(),level*5);
			item+="</div>";
			html+=item;
			
		}
		return html;
	}
	
	public List<Comment> getAll(int mid)
	{
		List<Comment> ls = commentService.getCommentByPID(mid);
		for (Comment comment : ls) {
			comment.setSubs(this.getAll(comment.getId()));
		}
		return ls;
	}
	
	
	@RequestMapping("/comment")
	public String comment(HttpSession session, Model model, String content, String mid,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		if(!mid.equals("0"))
		{
content = "<span style='color:#c00'>@回复：</span>"+content;
		}
		
		
		Comment modelX = new Comment();
		modelX.setUid(session.getAttribute("userid").toString());
		modelX.setContent(content);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(session.getAttribute("username").toString());
		modelX.setMid(mid);

		commentService.insert(modelX);
		model.addAttribute("message", "感谢您的留言，我们将尽快与您联系");
		return "app/feedback";

	}

	@Resource
	MorderService morderService;

	@RequestMapping("/submit1")
	public String submit1(HttpSession session, Model model, String q,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		for (Cart cart : list) {
			Morder obj = new Morder();
			int salerId = Integer.parseInt(cart.getP().getUid());
			Members saler = membersService.getMembersById(salerId);
			obj.setUid(session.getAttribute("userid").toString());
			obj.setBuyer(session.getAttribute("username").toString());
			obj.setPid(cart.getP().getId() + "");
			obj.setPname(cart.getP().getProduct_name());
			obj.setShopid(salerId+"");
			obj.setSaler(saler.getUsername());
			obj.setCreated(MainUtils.getTime());
			obj.setStep("1");
			obj.setNum(cart.getNum() + "");
			obj.setPrice(cart.getP().getPrice());
			obj.setTotal(cart.getTotal() + "");
			Date date = new Date();
			obj.setY(date.getYear()+"");
			obj.setM(date.getMonth()+"");
			obj.setD(date.getDay()+"");
			obj.setType("1");
			morderService.insert(obj);
			model.addAttribute("message", "提交成功，请到个人中心管理、查看");
		}
		session.setAttribute("cart", null);
		session.setAttribute("cartTotal", 0);
		return "app/cart";
	}
	
	@RequestMapping("/submit")
	public String submit(HttpSession session, Model model, Integer id,Integer total,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		Products p = productsService.getProductsById(id);
		
			Morder obj = new Morder();
			int salerId = Integer.parseInt(p.getUid());
			Members saler = membersService.getMembersById(salerId);
			obj.setUid(session.getAttribute("userid").toString());
			obj.setBuyer(session.getAttribute("username").toString());
			obj.setPid(p.getId() + "");
			obj.setPname(p.getProduct_name());
			obj.setShopid(salerId+"");
			obj.setSaler(saler.getUsername());
			obj.setCreated(MainUtils.getTime());
			obj.setStep("1");
			obj.setNum( "1");
			obj.setPrice(total.toString());
			obj.setTotal(total.toString());
			Date date = new Date();
			obj.setY(date.getYear()+"");
			obj.setM(date.getMonth()+"");
			obj.setD(date.getDay()+"");
			obj.setType("1");
			morderService.insert(obj);
			model.addAttribute("id",id);
			model.addAttribute("message", "提交成功");
		
		
		return "app/iwant";
	}
	
	
	@RequestMapping("/gm")
	public String gm(HttpSession session, Model model, Integer id,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
	
		Pt pt = ptService.getPtById(id);
			Morder obj = new Morder();
			int salerId = Integer.parseInt(pt.getUserid());
			Members saler = membersService.getMembersById(salerId);
			obj.setUid(session.getAttribute("userid").toString());
			obj.setBuyer(session.getAttribute("username").toString());
			obj.setPid(pt.getId() + "");
			obj.setPname(pt.getProduct_name());
			obj.setShopid(salerId+"");
			obj.setSaler(saler.getUsername());
			obj.setCreated(MainUtils.getTime());
			obj.setStep("1");
			obj.setNum("1");
			obj.setPrice(pt.getPrice());
			obj.setTotal(pt.getPrice());
			Date date = new Date();
			obj.setY(date.getYear()+"");
			obj.setM(date.getMonth()+"");
			obj.setD(date.getDay()+"");
			obj.setType("3");
			morderService.insert(obj);
			model.addAttribute("message", "订单提交成功，请到个人中心管理、查看");
		
		session.setAttribute("cart", null);
		session.setAttribute("cartTotal", 0);
		return "app/tuan";
	}
	
	@Resource InviceService inviceService;
	@RequestMapping("/addts")
	public String addts(HttpSession session, Model model, String content,String mid,String type,
			HttpServletRequest req) {
		if (session.getAttribute("username") == null) {
			return "redirect:/manage/index";
		}
		Invice modelX = new Invice();
		modelX.setUid(session.getAttribute("userid").toString());
		modelX.setContent(content);
		modelX.setMid(mid);
		System.out.println("MID:"+mid);
		modelX.setType(type);
		modelX.setCreated(MainUtils.getTime());
		modelX.setUpdated(session.getAttribute("username").toString());
		modelX.setStatus("1");
		

		inviceService.insert(modelX);
		model.addAttribute("message", "提交投诉成功");
		model.addAttribute("id", mid);
		return "app/ts";
	}
	@RequestMapping("/change")
	public String change(HttpSession session, Model model, Integer index,
			Integer type) {
		List<Cart> list = (List<Cart>) session.getAttribute("cart");
		int ix = 0;
		for (Cart cart : list) {
			if (index == ix) {
				if (type == 1) {
					int num = cart.getNum();
					num = num - 1;
					num = num > 0 ? num : 1;
					cart.setNum(num);
					cart.setTotal(num
							* Integer.parseInt(cart.getP().getPrice()));
				}
				if (type == 2) {
					int num = cart.getNum();
					num = num + 1;
					cart.setNum(num);
					cart.setTotal(num
							* Integer.parseInt(cart.getP().getPrice()));
				}
			}
			ix++;
		}
		session.setAttribute("cart", list);
		this.setTotal(session);
		return "redirect:cart";
	}

	@RequestMapping("/remove")
	public String remove(HttpSession session, Model model, Integer index) {
		List<Cart> cartList = (List<Cart>) session.getAttribute("cart");
		List<Cart> newCartList = new LinkedList<Cart>();
		int pointer = 0;
		for (Cart cart : cartList) {
			if (index == pointer) {
				pointer++;
				continue;
			}
			pointer++;
			newCartList.add(cart);
		}
		session.setAttribute("cart", newCartList);
		this.setTotal(session);
		return "redirect:cart";
	}

	@RequestMapping(value = "/addcart", method = RequestMethod.POST)
	public String addcart(HttpSession session, Model model, Integer id,
			Integer num) {

		Object usertype = session.getAttribute("usertype");
		if (usertype!=null && usertype.toString().equals("1")) {
			//String usertype = session.getAttribute("usertype").toString();
			List<Cart> list = (List<Cart>) session.getAttribute("cart");
			Integer total = (Integer) session.getAttribute("cartTotal");
			Products ps = productsService.getProductsById(id);
			Cart ct = new Cart();
			ct.setP(ps);
			ct.setNum(num);
			ct.setTotal(ct.getNum() * Integer.parseInt(ps.getPrice()));

			if (list == null) {
				list = new LinkedList<Cart>();
				list.add(ct);
				total = 0;
			} else {
				boolean exist = false;
				for (Cart cart : list) {
					if (cart.getP().getId() == id) {
						exist = true;
						cart.setNum(num + cart.getNum());
						cart.setTotal(Integer.parseInt(cart.getP().getPrice())
								* cart.getNum());
						total += Integer.parseInt(cart.getP().getPrice())
								* cart.getNum();
					}
				}
				if (!exist) {
					list.add(ct);
					total += ct.getNum()
							* Integer.parseInt(ct.getP().getPrice());
				}
			}

			session.setAttribute("cart", list);
			this.setTotal(session);
			return "redirect:cart";
		} else {
			model.addAttribute("message", "请您登录！");
			return "app/message";
		}

	}

}
