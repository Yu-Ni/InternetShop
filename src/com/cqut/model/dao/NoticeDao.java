package com.cqut.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cqut.model.pojo.Notice;

@Repository
public interface NoticeDao {
	
   public void insert(Notice notice);
   
   public List<Notice> getNoticeByCondition(String condition);

 	public void delete(String noticeids);

  	public void update(Notice notice);
}
