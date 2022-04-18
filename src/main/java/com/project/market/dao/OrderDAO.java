package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.market.vo.CartVO;
import com.project.market.vo.ItemVO;
import com.project.market.vo.OrderVO;
import com.project.market.vo.UserVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession session;

	// 주문 리스트 페이징
	public int getTotalRecordsCount(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;

		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getTotalRecordsCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	// 주문 리스트 불러오기 메소드
	public ArrayList<OrderVO> getOrderList(HashMap<String, Object> map) {
		OrderMapper mapper = session.getMapper(OrderMapper.class);
		ArrayList<OrderVO> orderList = mapper.getOrderList(map);
		
		return orderList;
	}

	// 주문 취소 메소드
	public int orderCancel(List<Integer> intCancelNum) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.orderCancel(intCancelNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	// 장바구니 페이징
	public int getCartTotalRecordsCount(String userMail) {
		int result = 0;
		OrderMapper mapper = null;

		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getCartTotalRecordsCount(userMail);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 장바구니 리스트 불러오기 메소드
	public ArrayList<CartVO> getCartList(HashMap<String, Object> map) {
		OrderMapper mapper = session.getMapper(OrderMapper.class);
		ArrayList<CartVO> cartList = mapper.getCartList(map);
		
		return cartList;
	}

	// 장바구니 삭제
	public int cartCancel(int cartNum) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.cartCancel(cartNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	//장바구니에 상품 넣기
	public int insertCart(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.insertCart(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니 상품 조회
	public ArrayList<ItemVO> selectCartList(int userNum) {
		ArrayList<ItemVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.selectCartList(userNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에 같은 상품이 있는지 확인
	public CartVO checkCart(HashMap<String, Object> map) {
		CartVO result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.checkCart(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//장바구니에 같은 상품이 있다면 수량을 증가
	public int updateCartAmount(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.updateCartAmount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// orderForm에 회원정보 가져오기
	public ArrayList<UserVO> getUserList(String userMail) {
		ArrayList<UserVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getUserList(userMail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	// orderForm에 상품정보 가져오기
	public ArrayList<ItemVO> getItemList(HashMap<String, Object> map) {
		ArrayList<ItemVO> result = null;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.getItemList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 주문 테이블에 입력
	public int insertOrder(HashMap<String, Object> map) {
		int result = 0;
		OrderMapper mapper = null;
		
		try {
			mapper = session.getMapper(OrderMapper.class);
			result = mapper.insertOrder(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
