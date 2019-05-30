package com.capstone.service;

import java.util.List;

import com.capstone.domain.ApplyListVO;
import com.capstone.domain.BusVO;
import com.capstone.domain.Criteria;

public interface BusService {
	
	public void register(BusVO bus);

	public BusVO get(int bno);

	public boolean modify(BusVO bus);

	public boolean remove(int bno);
	
	public boolean apply(BusVO bus);

	public List<BusVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
	
	public void applyListRegister(ApplyListVO ApplyListVO);

}
