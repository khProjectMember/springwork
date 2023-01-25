package com.kh.spring.apply.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.spring.apply.model.vo.Apply;

public interface ApplyService {
	public boolean findApplyLecs(Apply apply);
	public void addLecsInApply(Apply apply);
	public Map<String, List> myApplyList(Apply apply);
	public void removeApplyLecs(int applyNo);
}
