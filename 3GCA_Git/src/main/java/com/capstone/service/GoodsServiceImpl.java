package com.capstone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.capstone.domain.GoodsVO;
import com.capstone.domain.Criteria;
import com.capstone.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {
	
	private GoodsMapper mapper;

	@Override
	public void register(GoodsVO goods) {

		log.info("register......" + goods);

		mapper.insert(goods);
	}

	@Override
	public GoodsVO get(int bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	@Override
	public boolean modify(GoodsVO goods) {

		log.info("modify......" + goods);

		return mapper.update(goods) == 1;
	}

	@Override
	public boolean remove(int bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	@Override
	public List<GoodsVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
}
