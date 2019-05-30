package com.capstone.service;

import java.util.List;

import com.capstone.domain.GoodsVO;
import com.capstone.domain.Criteria;

public interface GoodsService {
	
	public void register(GoodsVO goods);

	public GoodsVO get(int bno);

	public boolean modify(GoodsVO goods);

	public boolean remove(int bno);

	public List<GoodsVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

}
