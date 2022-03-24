package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.AdminDAO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;
}
