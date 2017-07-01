package com.cqut.model.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.cqut.model.pojo.Evaluation;
@Repository
public interface EvaluationDao {
	//�鿴
	 public List<Evaluation> getEvaluationByCondition(String condition);
	 //�޸�
	public void update(Evaluation eva);
	public void delete(String evaluationid);
}
