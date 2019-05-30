package com.capstone.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.capstone.domain.NoticeVO;
import com.capstone.domain.Criteria;
import com.capstone.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private NoticeMapper mapper;

	@Override
	public void register(NoticeVO notice) {

		log.info("register......" + notice);

		mapper.insert(notice);
	}

	@Override
	public NoticeVO get(int bno) {

		log.info("get......" + bno);

		return mapper.read(bno);

	}

	@Override
	public boolean modify(NoticeVO notice) {

		log.info("modify......" + notice);

		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(int bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
