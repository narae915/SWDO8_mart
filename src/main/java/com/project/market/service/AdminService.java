package com.project.market.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.market.dao.AdminDAO;
import com.project.market.vo.ItemVO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	public int getTotalRecordsCount() {
		return dao.getTotalRecordsCount();
	}

	public ArrayList<ItemVO> getItemList(int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);

		return dao.getItemList(map);
	}
}
