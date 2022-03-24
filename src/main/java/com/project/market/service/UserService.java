package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.UserDAO;


@Service
public class UserService {

	@Autowired
	private UserDAO dao;
}
