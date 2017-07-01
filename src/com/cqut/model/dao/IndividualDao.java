package com.cqut.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cqut.model.pojo.Individual;

public interface IndividualDao {
	public Individual getIndInfo(String sessionUser);
	public void UpdateInd(Individual i);
}

