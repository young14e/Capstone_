package com.capstone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.capstone.domain.ApplyListVO;
import com.capstone.domain.BusVO;
import com.capstone.domain.Criteria;
import com.capstone.mapper.BusMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BusServiceImpl implements BusService {
	
	private BusMapper mapper;

	@Override
	public void register(BusVO bus) {

		log.info("register......" + bus);

		mapper.insert(bus);
	}

	@Override
	public BusVO get(int bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	@Override
	public boolean modify(BusVO bus) {

		log.info("modify......" + bus);

		return mapper.update(bus) == 1;
	}

	@Override
	public boolean remove(int bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}
	
	@Override
	public boolean apply(BusVO bus) {

		log.info("apply...." + bus);

		return mapper.apply(bus) == 1;
	}
	
	@Override
	public List<BusVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public void applyListRegister(ApplyListVO ApplyListVO) {
		log.info("applyListRegister......" + ApplyListVO);

		mapper.applyListRegister(ApplyListVO);
	}
}
