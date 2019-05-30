package com.capstone.mapper;

import java.util.List;

import com.capstone.domain.GoodsVO;
import com.capstone.domain.Criteria;

public interface GoodsMapper {
	public List<GoodsVO> getList();

	public List<GoodsVO> getListWithPaging(Criteria cri);

	public void insert(GoodsVO goods);

	public Integer insertSelectKey(GoodsVO goods);

	public GoodsVO read(int bno);

	public int delete(int bno);

	public int update(GoodsVO goods);

	public int getTotalCount(Criteria cri);
}
