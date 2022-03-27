package com.project.market.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.market.vo.ItemVO;

public interface AdminMapper {

	int getTotalRecordsCount();

	ArrayList<ItemVO> getItemList(HashMap<String, Object> map);

}
