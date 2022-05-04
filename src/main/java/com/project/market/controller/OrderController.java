package com.project.market.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.market.dao.UserDAO;
import com.project.market.service.OrderService;
import com.project.market.util.LookingImgSrc;
import com.project.market.util.PageNavigator;
import com.project.market.vo.CartVO;
import com.project.market.vo.FileListVO;
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

	//이미지 주소를 불러오는 Class
	private LookingImgSrc imgSrc = new LookingImgSrc();
	
	//장바구니에 상품넣기 - 박나래
	@ResponseBody
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public String insertCart(int itemNum, int cartAmount, String userMail, Model model) {
		logger.info("장바구니에 상품넣기(POST)");
		logger.info("itemNum : {}, cartAmount : {}", itemNum, cartAmount);
		String res = null;
		
		// 1. 장바구니에 같은 상품이 있는지 확인
		UserVO user = uDao.getUser(userMail);
		int userNum = user.getUserNum();
		CartVO cart = service.checkCart(itemNum,userNum);
		
		// 같은 상품이 없다면
		if(cart == null) {
			// 2. 장바구니에 상품 정보를 입력
			logger.info("같은 상품 없음");
			boolean result1 = service.insertCart(itemNum,cartAmount,userNum);
			if(result1) {
				res = "yes";
			} else {
				res = "no";
			}
		} else { // 3. 같은 상품이 있다면 cart의 amount를 업데이트
			logger.info("같은 상품 있음");
			boolean result2 = service.updateCartAmount(itemNum,cartAmount,userNum);
			
			if(result2) {
				res = "yes";
			} else {
				res = "no";
			}
		}
		
		//값이 잘 들어갔는지 확인용
		ArrayList<ItemVO> cartList = service.selectCartList(userNum);
		logger.info("cartList :{}", cartList);
		
		return res;
	}
	
	//마우스 오버시 cartList조회
	@RequestMapping(value="/selectCartList", method = RequestMethod.POST)
	public String selectCartList(Model model, HttpSession session) {
		logger.info("마우스 오버시 cartList 조회(POST)");
		String emptyCart = null;
		String userMail = (String)session.getAttribute("userMail");

		logger.info("userMail : {}", userMail);
		//로그인 되어 있다면
		if(userMail != null) {
		//회원정보를 조회하고, cartList를 조회
		UserVO user = uDao.getUser(userMail);
		ArrayList<ItemVO> cartList = service.selectCartList(user.getUserNum());
		ArrayList<FileListVO> fileList = service.getFileList();
			// 장바구니에 조회된 목록이 있다면
			if(cartList.size() >= 1) {
				String temp = null;
				int tempNum = 0;

				//cartList에 이미지 파일 넣기
				for(int i = 0; i < cartList.size(); i++) {
					//가상의 int에 아이템 번호 넣기
					tempNum = cartList.get(i).getItemNum();
					
					//파일리스트 크기만큼 반복
					for(int j = 0; j <= fileList.size(); j++) {
						
						if(cartList.get(i).getSavedFilename() == null) {
							//cartList의 아이템번호와 fileList의 아이템번호가 같을 때
							if(tempNum == fileList.get(j).getItemNum()) {
								//fileList의 제일 첫번째 올린 파일이름을 가상의 string에 저장
								temp = fileList.get(0).getSavedFilename();
								cartList.get(i).setSavedFilename("/uploadImg/" + temp);
							} else {
								//상품 사진이 없을 경우 기본 이미지로 설정
								cartList.get(i).setSavedFilename("/resources/img/itemDefault.png");
								break;
							}
						}
						//파일리스트 테이블에 같은 상품 번호가 없을 경우 기본 이미지로 설정
						if(cartList.get(i).getSavedFilename() == null) {
							cartList.get(i).setSavedFilename("/resources/img/itemDefault.png");
						}
					}
				}
				
				logger.info("cartList :{}", cartList);
				model.addAttribute("cartList", cartList);
			// 장바구니에 조회된 목록이 없다면
			} else if(cartList.size() == 0) {
				cartList = null;
				emptyCart = "장바구니에 등록된 상품이 없습니다.";
				model.addAttribute("emptyCart", emptyCart);
			}
		// 로그인 되어 있지 않다면
		} else if(userMail == null || userMail == "" || userMail == " ") {
				emptyCart = "로그인 후 이용 가능합니다.";
				model.addAttribute("emptyCart" , emptyCart);
		}
		
		return "/order/cartListAjax";
	}
	
	//마우스 오버의 장바구니 내역 삭제(실제로 cart_table 내역이 삭제됨)
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public String deleteCart(int cartNum, int itemNum, HttpSession session, Model model) {
		logger.info("deleteCart 메소드 실행(POST)");
		logger.info("ajax에서 넘어온 cartNum, itemNum:{} {}", cartNum, itemNum);
		
		String userMail = (String)session.getAttribute("userMail");
		UserVO user = uDao.getUser(userMail);
		
		//장바구니를 삭제하기 전에 수량을 회복시켜야 하므로 수량을 일시적으로 tempAmount 에 저장
		CartVO temp = service.checkCart(itemNum, user.getUserNum());
		int tempAmount = temp.getCartAmount();
		logger.info("tempAmount: {}", tempAmount);
		
		//일시적으로 저장한 tempAmount를 ItemAmount에 다시 추가
		service.returnAmount(tempAmount, itemNum);
		
		 // 장바구니 삭제 메소드
		boolean result = service.cartCancel(cartNum);
		
		if(result) {
			logger.info("장바구니 삭제 성공");
			
			ArrayList<ItemVO> cartList = service.selectCartList(user.getUserNum());
			model.addAttribute("cartList", cartList);
			
			return "/order/cartListAjax";

		} else {
			logger.info("장바구니 삭제 실패");
			return null;
		}
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
	
	// 22-04-04 노채린
	// 장바구니 삭제
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
		model.addAttribute("cartNum", buy);
		
		// 수량
		if(p_num.contains("-1") == true) {
			p_num = p_num.replace("-1", "");
		}
		model.addAttribute("amount", p_num);

		String[] pNumArr = p_num.split(",");

		for(int i = 0; i < pNumArr.length; i++) {
			// logger.info(pNumArr[i]);
			model.addAttribute("pNumArr", pNumArr);
		}
		
		// 회원정보 가져오기
		ArrayList<UserVO> userList = service.getUserList(userMail);
		model.addAttribute("userList", userList);
		logger.info("userList:{}", userList);
		
		// 주문정보 가져오기
		ArrayList<ItemVO> itemList = service.getItemList(buy);
		logger.info("itemList:{}",itemList);
		model.addAttribute("itemList", itemList);
		
		return "/order/orderForm";
	}
	
	// 결제 정보 전송
	@ResponseBody
	@RequestMapping(value = "/orderForm", method = RequestMethod.POST)
	public String orderForm(Model model, String cartNum, Authentication authentication, String amount, 
						String orderMail, String orderCall, String address, String detailAddress) {
		logger.info("orderForm 메소드 실행(POST).");

		String userMail = authentication.getName();
		model.addAttribute("userMail", userMail);

		// 주문 테이블 입력 메소드
		boolean result1 = service.insertOrder(amount, cartNum, orderMail, orderCall,
													address, detailAddress, userMail);

		String[] cartNumArr = cartNum.split(",");
		
		for(int i=0; i<cartNumArr.length; i++) {
			cartNum = cartNumArr[i];
			
			// 장바구니 테이블 삭제 메소드
			boolean result2 = service.cartCancel(Integer.parseInt(cartNum));
			
			if(result2) {
				logger.info(cartNum+"번 장바구니 테이블 삭제 성공");
				
			} else {
				logger.info(cartNum+"번 장바구니 테이블 삭제 실패");
			}
			
		}
		
		if(result1) {
			logger.info("결제 테이블 입력 성공");
			return "success";
			
		} else {
			logger.info("결제 테이블 입력 실패");
			return null;
		}

	}
	
}
