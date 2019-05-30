package com.capstone.service;

import java.util.List;

import com.capstone.domain.NoticeVO;
import com.capstone.domain.Criteria;

public interface NoticeService {

	public void register(NoticeVO notice);

	public NoticeVO get(int bno);

	public boolean modify(NoticeVO notice);

	public boolean remove(int bno);

	public List<NoticeVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

}
