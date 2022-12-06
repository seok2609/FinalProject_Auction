package com.im.home.wholesale;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WholeSaleMapper {

	public int setAdd(WholeSaleVO wholeSaleVO) throws Exception;
}
