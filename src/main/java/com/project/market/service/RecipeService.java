package com.project.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.market.dao.RecipeDAO;


@Service
public class RecipeService {
	
	@Autowired
	private RecipeDAO dao;

}
