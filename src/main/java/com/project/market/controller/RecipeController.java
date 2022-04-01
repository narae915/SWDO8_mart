package com.project.market.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.market.service.RecipeService;

@Controller
@RequestMapping(value = "/recipe")
public class RecipeController {
	
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

	@Autowired
	private RecipeService serivce;
	
	//레시피 게시판 이동
	@RequestMapping(value = "/recipeList", method = RequestMethod.GET)
	public String recipeList() {
		logger.info("reipeList 게시판(GET)");
		
		return "recipe/recipeList";
	}
}
