package com.capstone.mapper;

import java.util.List;

import com.capstone.domain.ApplyListVO;
import com.capstone.domain.BusVO;
import com.capstone.domain.Criteria;

public interface BusMapper {
	public List<BusVO> getList();

	public List<BusVO> getListWithPaging(Criteria cri);

	public void insert(BusVO bus);

	public Integer insertSelectKey(BusVO bus);

	public BusVO read(int bno);

	public int delete(int bno);
	
	public int apply(BusVO bus);

	public int update(BusVO bus);

	public int getTotalCount(Criteria cri);
	
	public void applyListRegister(ApplyListVO ApplyListVO);
}
