package com.cqut.model.service;

import java.util.List;

import com.cqut.model.pojo.Notice;




public interface NoticeService {
	
	public String getNoticeList(String condition);
    public List<Notice> getNoticeByCondition(String condition);
    public void insert(Notice notice);
  	public void delete(String noticeids);
  	public void update(Notice notice);
}
