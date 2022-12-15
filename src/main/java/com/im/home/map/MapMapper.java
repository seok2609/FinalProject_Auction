package com.im.home.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MapMapper {
	
	public List<MapVO> setStartPoint() throws Exception;
	public List<MapVO> setEndPoint() throws Exception;
	
}
