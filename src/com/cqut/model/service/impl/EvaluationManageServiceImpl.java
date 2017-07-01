package com.cqut.model.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cqut.model.dao.EvaluationDao;
import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Evaluation;
import com.cqut.model.service.EvaluationManagerService;

@Service
public class EvaluationManageServiceImpl implements EvaluationManagerService {
	
	@Autowired
	private EvaluationDao dao;

	/*@Override
	public List<Admin> queryByName(String input) {
		// TODO Auto-generated method stub
		return dao.queryByName(input);
	}
*/
//	@Override
//	public void insert(Admin admin) {
//		// TODO Auto-generated method stub
//		String adminid = UUID.randomUUID().toString().replaceAll("-", ""); 
//		admin.setAdminid(adminid);
//		dao.insert(admin);		
//	}

//	@Override
//	public String getEvaluationList(String condition) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<Evaluation> getEvaluationByCondition(String condition) {
		// TODO Auto-generated method stub
	
		return dao.getEvaluationByCondition(condition);
	
	}
	@Override
	public void delete(String evaluationid) {
		// TODO Auto-generated method stub
		dao.delete(evaluationid);
	}

	@Override
	public void update(Evaluation eva) {
		// TODO Auto-generated method stub
		    Date d = new Date();  
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			eva.setTime(df.format(new Date()));    
		      dao.update(eva);	
	}

//	@Override
//	public void delete(String adminids) {
//		// TODO Auto-generated method stub
//		String id= "";
//		String ids[] = adminids.split(",");
//		
//		for(int i=0;i<ids.length;i++){
//			id+="'"+ids[i]+"',";
//		}
//		id=id.substring(0, id.length()-1);
//		id="("+id+")";
//		dao.delete(id);
//		
//	}
//
//	@Override
//	public void update(Admin admin) {
//		// TODO Auto-generated method stub
//		dao.update(admin);
//		
//	}
	
	
}
