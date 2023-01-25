package com.kh.spring.apply.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.apply.model.vo.Apply;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

@Repository
public class ApplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List selectApplyList(Apply apply) {
		List applyList = (List)sqlSession.selectList("applyMapper.selectApplyList",apply);
		return applyList;
	}
	
	public List<Lecture> selectLecsList(List<Apply> applyList){
		List<Lecture> myLecsList;
		myLecsList = sqlSession.selectList("applyMapper.selectLecsList", applyList);
		return myLecsList;
	}
	
	public boolean selectCountInApply(Apply apply) {
		String result=sqlSession.selectOne("applyMapper.selectCountInApply", apply);
		return Boolean.parseBoolean(result);
	}
	public void insertLecsInApply(Apply apply){
		int applyNo=selectMaxApplyNo();
		apply.setApplyNo(applyNo);
		sqlSession.insert("applyMapper.insertLecsInApply", apply);
	}
	

	public void updateApplyLecsCount(Apply apply) {
		sqlSession.insert("applyMapper.updateApplyLecsCount",apply);
		
	}
	
	public void deleteApplyLecs(int applyNo) {
		sqlSession.delete("applyMapper.deleteApplyLecs",applyNo);
	}
	
	private int selectMaxApplyNo() {
		int applyNo = sqlSession.selectOne("applyMapper.selectMaxApplyNo");
		return applyNo;
	}

	public ArrayList<Apply> applyList(SqlSessionTemplate sqlSession, Apply apply) {
		return (ArrayList)sqlSession.selectList("applyMapper.applyList",apply);
	}

}
