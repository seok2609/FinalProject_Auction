package com.im.home.wholesale;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.im.home.util.Pager;

@Mapper
public interface WholeSaleMapper {
	
	public int setAdd(WholeSaleVO wholeSaleVO) throws Exception;

	public List<WholeSaleVO> getList(Pager pager) throws Exception;
	
	public void deleteList() throws Exception;

	public void deleteList(String delDay);
	
	public Long getListCount(Pager pager)throws Exception;
	
}
