package com.capstone.mapper;

import java.util.List;

import com.capstone.domain.NoticeVO;
import com.capstone.domain.Criteria;

public interface NoticeMapper {

	public List<NoticeVO> getList();

	public List<NoticeVO> getListWithPaging(Criteria cri);

	public void insert(NoticeVO notice);

	public Integer insertSelectKey(NoticeVO notice);

	public NoticeVO read(int bno);

	public int delete(int bno);

	public int update(NoticeVO notice);

	public int getTotalCount(Criteria cri);
	
}
