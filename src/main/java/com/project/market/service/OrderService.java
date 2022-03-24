package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.OrderDAO;


@Service
public class OrderService {
	
	@Autowired
	private OrderDAO dao;

}
