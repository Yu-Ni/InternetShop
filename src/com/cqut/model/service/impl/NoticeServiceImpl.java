package com.cqut.model.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.NoticeDao;
import com.cqut.model.pojo.Notice;
import com.cqut.model.service.NoticeService;
import com.cqut.util.UID;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;

	/*@Override
	public List<Admin> queryByName(String input) {
		// TODO Auto-generated method stub
		return dao.queryByName(input);
	}
*/
	@Override
	public void insert(Notice notice) {
		// TODO Auto-generated method stub
		String noticeid = UID.createID();
	    notice.setNoticeid(noticeid);
	    
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		notice.setNoticetime(df.format(new Date()));
		dao.insert(notice);		
	}

	@Override
	public String getNoticeList(String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> getNoticeByCondition(String condition) {
		// TODO Auto-generated method stub
	
		return dao.getNoticeByCondition(condition);
	
	}

	@Override
	public void delete(String noticeids) {
		// TODO Auto-generated method stub

		dao.delete(noticeids);
		
	}

	@Override
	public void update(Notice notice) {
		// TODO Auto-generated method stub
		dao.update(notice);
		
	}
	
	
}

