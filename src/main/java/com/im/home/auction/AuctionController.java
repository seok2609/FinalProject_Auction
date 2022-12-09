package com.im.home.auction;

import java.io.EOFException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.im.home.auction.product.ProductMapper;
import com.im.home.auction.product.ProductVO;
import com.im.home.members.MembersMapper;
import com.im.home.members.MembersVO;

import lombok.extern.slf4j.Slf4j;

@CrossOrigin(origins = "*")
@Controller
@RequestMapping("/auction/*")
@Slf4j
public class AuctionController {
	
	@Autowired
	private MembersMapper membersMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	
	@GetMapping("vidu")
	public void viduTest() {

	}
	
	@GetMapping("test")
	@ResponseBody
	public String testest(Model model) {
		MembersVO membersVO = membersMapper.getMembersLogin("11");
		
		return "good";
	}
	
	
	@GetMapping("chat")
	public void chatTest() {
		log.info("@chatController, chat Get()");
		
	}
	
	
	
	@GetMapping("detail")
	public String getDetail() throws Exception{
		return "auction/detail";
	}
	
	@GetMapping("add")
	public ModelAndView setAdd() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> productVOs = productMapper.getList();
		
		mv.addObject("list", productVOs);
		mv.setViewName("auction/add");
		
		return mv;
		
		
	
	}
	
	@PostMapping("add")
	public void setAdd(AuctionVO auctionVO) throws Exception{
		
	}
	
	
	@PostMapping("asking")
	@ResponseBody
	public void setAddAskingPrice(AskingPriceVO askingPriceVO) throws Exception{
		
	}
	
	@GetMapping("list")
	public void getList() throws Exception{
		
	}
	
	
	// ======================================= 판매 상품 ===========================================
	
	
	@GetMapping("product/add")
	public String setProductAdd() throws Exception{
		return "item/add";
	}
	
	
	@PostMapping("product/add")
	public String setProductAdd(ProductVO productVO) throws Exception{
		int result = productMapper.setAdd(productVO);
		
		return "redirect:/auction/list";
		
	}
	
	@GetMapping("product/list")
	public ModelAndView getProductList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> productVOs = productMapper.getList();
		
		mv.addObject("list", productVOs);
		mv.setViewName("item/list");
		
		return mv;
		
	}
	
	
	
	
}
