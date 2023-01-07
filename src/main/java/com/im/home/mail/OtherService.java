package com.im.home.mail;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Configurable;

@Mapper
@Configurable

public interface OtherService {

	public String sendSimpleMessage(String to) throws Exception;

}
