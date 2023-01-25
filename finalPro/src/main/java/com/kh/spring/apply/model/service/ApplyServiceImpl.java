package com.kh.spring.apply.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.apply.model.dao.ApplyDao;
import com.kh.spring.apply.model.vo.Apply;

@Service
public class ApplyServiceImpl implements ApplyService{
	@Autowired
	Apply apply;
	@Autowired
	ApplyDao wDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Map<String, List> myApplyList(Apply apply) {
		Map<String,List> applyMap=new HashMap<String,List>();
		List<Apply> myApplyList=wDao.selectApplyList(apply);
		if(myApplyList.size()==0){ 
			return null;
		}
		List<Lecture> myLecsList=wDao.selectLecsList(myApplyList);
		applyMap.put("myApplyList", myApplyList);
		applyMap.put("myLecsList",myLecsList);
		return applyMap;
	}
	
	public boolean findApplyLecs(Apply apply){
		return wDao.selectCountInApply(apply);
	}	
	public void addLecsInApply(Apply apply){
		wDao.insertLecsInApply(apply);
	}

	@Override
	public void removeApplyLecs(int applyNo) {
		wDao.deleteApplyLecs(applyNo);
	}

}
