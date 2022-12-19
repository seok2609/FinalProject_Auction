package com.im.home.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
	
	public List<StartPointVO> setStartPoint() throws Exception;
	public List<EndPointVO> setEndPoint() throws Exception;
	
}
