package com.project.market.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.service.OrderService;
import com.project.market.util.PageNavigator;
import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	private static final int COUNT_PER_PAGE = 5;
	private static final int PAGE_PER_GROUP = 5;
	@Autowired
	private OrderService service;
	
	//장바구니에 상품넣기
	@ResponseBody
	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(int itemNum, int cartAmount, Model model) {
		logger.info("itemNum : {}", itemNum);
		logger.info("cartAmount : {}", cartAmount);
		String res = null;
		
		// 1. 장바구니에 같은 상품이 있는지 확인
		CartVO cart = service.checkCart(itemNum);
		
		// 같은 상품이 없다면
		if(cart == null) {
			// 장바구니에 상품 정보를 입력
			boolean result1 = service.insertCart(itemNum,cartAmount);
			if(result1) {
				res = "yes";
			} else {
				res = "no";
			}
		} else { // 같은 상품이 있다면 cart의 amount를 업데이트
			boolean result2 = service.updateCartAmount(itemNum,cartAmount);
			
			if(result2) {
				res = "yes";
			} else {
				res = "no";
			}
		}
		
		ArrayList<ItemVO> cartList = service.selectCartList();
		logger.info("cartList :{}", cartList);
		
		model.addAttribute("cartList", cartList);
		
		return res;
	}
	
	//마우스 오버시 cartList조회
	@RequestMapping(value="/selectCartList", method = RequestMethod.POST)
	public String selectCartList(Model model) {
		ArrayList<ItemVO> cartList = service.selectCartList();
		logger.info("cartList :{}", cartList);
		
		model.addAttribute("cartList", cartList);
		
		return "/order/cartListAjax";
	}
	
	// 2022-03-24~2022-03-25 노채린
	// 1.주문 리스트 불러오기 및 페이지 열기 시작
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(@RequestParam(defaultValue = "1") int currentPage, HttpSession session, Model model, String searchWord) {
		logger.info("orderList 메소드 실행(GET).");
		
		// 페이징
		// 검색하지 않았을 때
		if(searchWord == null) {
			searchWord = "";
		}
		int totalRecordsCount = service.getTotalRecordsCount(searchWord);
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 1-1.주문 리스트 불러오기 메소드
		// String userMail = (String)session.getAttribute("loginMail");
		// ArrayList<OrderVO> orderList = service.getOrderList(userMail, navi.getStartRecord(), COUNT_PER_PAGE, searchWord);
		
		// 1-2.주문 리스트 불러오기 임시 메소드(로그인 정보 받아올 수 있을 때 비활성화)
		ArrayList<OrderVO> orderList = service.getOrderList(navi.getStartRecord(), COUNT_PER_PAGE, searchWord);
		
		// logger.info("orderList: {}", orderList);
		model.addAttribute("orderList", orderList);
		
		
		return "/order/orderList";
	}
	
	// 2022-03-25~2022-03-26 노채린
	// 2.주문 취소 시작
	@ResponseBody
	@RequestMapping(value = "orderCancle", method = RequestMethod.POST)
	public String orderCancle(String[] orderNum) {
		logger.info("orderCancle 메소드 실행(POST)");
		logger.info("orderNum:{}",orderNum);
		if(orderNum== null) {
			logger.info("null!!");
		}
		// 2.주문 취소 메소드
		boolean result = service.orderCancle(orderNum);
		
		if(result) {
			logger.info("주문 취소 성공");
	
			return "success";
		} else {
			logger.info("주문 취소 실패");
			
			return null;
		}
		
	}
	
}
