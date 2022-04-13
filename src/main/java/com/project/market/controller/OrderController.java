package com.project.market.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.dao.UserDAO;
import com.project.market.service.OrderService;
import com.project.market.util.PageNavigator;
import com.project.market.vo.CartVO;
import com.project.market.vo.ForwardVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;
import com.project.market.vo.UserVO;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	private static final int COUNT_PER_PAGE = 5;
	private static final int PAGE_PER_GROUP = 5;
	@Autowired
	private OrderService service;
	
	@Autowired
	private UserDAO uDao;
	
	//장바구니에 상품넣기 - 박나래
	@ResponseBody
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public String insertCart(int itemNum, int cartAmount, String userMail, Model model) {
		logger.info("장바구니에 상품넣기(POST)");
		logger.info("itemNum : {}, cartAmount : {}", itemNum, cartAmount);
		logger.info("userMail : {}", userMail);
		String res = null;
		
		// 1. 장바구니에 같은 상품이 있는지 확인
		UserVO user = uDao.getUser(userMail);
		int userNum = user.getUserNum();
		CartVO cart = service.checkCart(itemNum,userNum);
		
		// 같은 상품이 없다면
		if(cart == null) {
			// 장바구니에 상품 정보를 입력
			logger.info("같은 상품 없음");
			boolean result1 = service.insertCart(itemNum,cartAmount,userNum);
			if(result1) {
				res = "yes";
			} else {
				res = "no";
			}
		} else { // 같은 상품이 있다면 cart의 amount를 업데이트
			logger.info("같은 상품 있음");
			boolean result2 = service.updateCartAmount(itemNum,cartAmount,userNum);
			
			if(result2) {
				res = "yes";
			} else {
				res = "no";
			}
		}
		
		ArrayList<ItemVO> cartList = service.selectCartList(userMail);
		logger.info("cartList :{}", cartList);
		
		model.addAttribute("cartList", cartList);
		
		return res;
	}
	
	//마우스 오버시 cartList조회
	@RequestMapping(value="/selectCartList", method = RequestMethod.POST)
	public String selectCartList(Model model, String userMail) {
		logger.info("마우스 오버시 cartList 조회(POST)");
		logger.info("userMail : {}", userMail);
		ArrayList<ItemVO> cartList = service.selectCartList(userMail);
		String emptyCart = null;
		
		if(userMail == "" || userMail == " " || userMail == null) {
			cartList = null;
			emptyCart = "로그인 후 이용 가능합니다.";
			model.addAttribute("cartList", cartList);
			model.addAttribute("emptyCart" , emptyCart);
		} else {
			if(cartList.size() >= 1) {
				logger.info("cartList :{}", cartList);
				model.addAttribute("cartList", cartList);

			} else if(cartList.size() == 0) {
				cartList = null;
				emptyCart = "장바구니에 등록된 상품이 없습니다.";
				model.addAttribute("cartList", cartList);
				model.addAttribute("emptyCart", emptyCart);
			}
		}
		
		return "/order/cartListAjax";
	}
	
	// 2022-03-24~2022-03-25 노채린
	// 주문 리스트 불러오기 및 페이지 열기 시작
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(@RequestParam(defaultValue = "1") int currentPage, 
								Model model, String searchWord, Authentication authentication) {
		logger.info("orderList 메소드 실행(GET).");

		String userMail = authentication.getName();
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		model.addAttribute("searchWord", searchWord);
		
		// 주문 리스트 페이징
		int totalRecordsCount = service.getTotalRecordsCount(searchWord, userMail);
		
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);
		
		// 주문 리스트 불러오기 메소드
		ArrayList<OrderVO> orderList = service.getOrderList(userMail, navi.getStartRecord(), COUNT_PER_PAGE, searchWord);
		
		logger.info("orderList:{}",orderList);
		model.addAttribute("orderList", orderList);
		
		
		return "/order/orderList";
	}
	
	// 2022-03-25~2022-03-26 노채린
	// 주문 취소 시작
	@ResponseBody
	@RequestMapping(value = "/orderCancel", method = RequestMethod.POST)
	public String orderCancel(@RequestParam(value="cancelNumArray[]") List<String> cancelNum) {
		logger.info("orderCancel 메소드 실행");
		logger.info("cancelNum:{}", cancelNum);
		
		 // 상품 목록 삭제 메소드
		boolean result = service.orderCancel(cancelNum);
		
		if(result) {
			logger.info("주문 취소 성공");
			
			return "success";
			
		} else {
			logger.info("주문 취소 실패");
			
			return null;
		}
		
	}
	
	// 2022-04-01 노채린
	// 장바구니 페이지 열기
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(@RequestParam(defaultValue = "1") int currentPage, Model model, Authentication authentication) {
		logger.info("cart 메소드 실행(GET).");

		String userMail = authentication.getName();
		logger.info("userMail:{}",userMail);
		
		// 페이징
		int totalRecordsCount = service.getCartTotalRecordsCount(userMail);
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, currentPage, totalRecordsCount);
		model.addAttribute("navi", navi);

		// 장바구니 리스트 불러오기 메소드
		ArrayList<CartVO> cartList = service.getCartList(userMail, navi.getStartRecord(), COUNT_PER_PAGE);
		
		logger.info("cartList:{}",cartList);
		 model.addAttribute("cartList", cartList);
		 
		
		return "/order/cart";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart() {
		logger.info("cart 메소드 실행(POST).");
		
		return "/order/orderForm";
	}
	
	// 22-04-04 노채린
	// 장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/cartCancel", method = RequestMethod.POST)
	public String cartCancel(int cartNum) {
		logger.info("cartCancel 메소드 실행(POST)");
		logger.info("cartNum:{}", cartNum);
		
		 // 장바구니 삭제 메소드
		boolean result = service.cartCancel(cartNum);
		
		if(result) {
			logger.info("장바구니 삭제 성공");
			
			return "success";
		} else {
			logger.info("장바구니 삭제 실패");
			
			return null;
		}
	}
	
	// 22-04-06 노채린
	// 결제 정보 입력 페이지
	@RequestMapping(value = "/orderForm", method = RequestMethod.GET)
	public String orderForm(Authentication authentication, Model model, String totalPrice, String buy, String p_num) {
		logger.info("orderForm 메소드 실행(GET).");
		
		String userMail = authentication.getName();
		model.addAttribute("userMail", userMail);
		// 총계
		logger.info("totalPrice:{}", totalPrice);
		model.addAttribute("totalPrice", totalPrice);
		
		// 체크박스 cartNum
		logger.info("buy:{}", buy);
		
		// 수량
		if(p_num.contains("-1") == true) {
			p_num = p_num.replace("-1,", "");
			p_num = p_num.replace(",-1", "");
		}
		String[] pNumArr = p_num.split(",");

		for(int i = 0; i < pNumArr.length; i++) {
			// logger.info(pNumArr[i]);
			model.addAttribute("pNumArr", pNumArr);
		}
		
		// 가져올 것: 회원 정보, 상품정보
		ArrayList<UserVO> userList = service.getUserList(userMail);
		model.addAttribute("userList", userList);
		logger.info("userList:{}", userList);
		
		ArrayList<ItemVO> itemList = service.getItemList(buy);
		logger.info("itemList:{}",itemList);
		model.addAttribute("itemList", itemList);
		
		return "/order/orderForm";
	}
	/*
	@RequestMapping(value = "/orderForm", method = RequestMethod.POST)
	public String orderForm(@RequestParam(value="purchaseAmountArray[]") List<String> purchaseAmount) {
		logger.info("orderForm 메소드 실행(POST).");
		
		logger.info("purchaseAmount:{}", purchaseAmount);
		
		return null;
	}
	*/
	// 결제 정보 입력 페이지
	@RequestMapping(value = "/orderFormForward", method = RequestMethod.GET)
	public String orderFormForward() { // 세션에서 유저 정보 가져와서 넣기
		logger.info("orderFormForward 메소드 실행(GET).");
		
		
		return "/order/orderFormForward";
	}
	
}
