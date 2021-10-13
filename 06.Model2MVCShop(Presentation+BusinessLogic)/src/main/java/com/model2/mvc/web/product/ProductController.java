package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

@Controller
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping("/addProductView.do")
	public String addProductView() throws Exception {

		System.out.println("/addProductView.do");

		return "redirect:/product/addProductView.jsp";
	}

	@RequestMapping("/addProduct.do")
	public String addProduct(@ModelAttribute("product") Product product, Model model) throws Exception {
		
		System.out.println("/addProduct.do");

		model.addAttribute("product", product);

		productService.insertProduct(product);

		return "/product/addProduct.jsp";
	}

	@RequestMapping("/getProduct.do")
	public String getProduct(@RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("/getProduct.do");
		/////////////////////// Cookie part
		String history = "";

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie h = cookies[i];

				if (h.getName().equals("history")) {

					history = h.getValue();
					System.out.println(history);

				}
			}
		}
		history += request.getParameter("prodNo") + ",";

		Cookie cookie = new Cookie("history", history);

		response.addCookie(cookie);
		/////////////////////// Cookie part

		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);

		request.setAttribute("product", product);

		System.out.println(":: getProduct Method에서 불러온 menu :: " + request.getParameter("menu"));

		if (request.getParameter("menu") == null) {
			return "forward:/product/getProduct.jsp";
		}

		if (request.getParameter("menu").equals("search")) {
			return "forward:/product/getProduct.jsp";

		} else {
			return "forward:/product/updateProduct.jsp";
		}

		// return "forward:/product/getProduct.jsp";
	}

	@RequestMapping("/updateProductView.do")
	public String updateProductView(@RequestParam("prodNo") int prodNo, Model model) throws Exception {

		System.out.println("/updateProductView.do");

		Product product = productService.getProduct(prodNo);

		model.addAttribute("product", product);

		return "forward:/product/updateProduct.jsp";
	}

	@RequestMapping("/updateProduct.do")
	public String updateProduct(@ModelAttribute("product") Product product, Model model)
			throws Exception {

		System.out.println("/updateProduct.do");

		productService.updateProduct(product);

		model.addAttribute("product", product);
		

		return "redirect:/getProduct.do?prodNo=" + product.getProdNo();
	}

	@RequestMapping("/listProduct.do")
	public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {

		System.out.println("/listProduct.do");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/product/listProduct.jsp";
	}

}
