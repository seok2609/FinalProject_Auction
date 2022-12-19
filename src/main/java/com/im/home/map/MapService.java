package com.im.home.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapService {

		@Autowired
		private MapMapper mapMapper;
		
		public List<StartPointVO> setStartPoint() throws Exception{
			List<StartPointVO> ar = mapMapper.setStartPoint(); 
			return ar;
		}
		
		public List<EndPointVO> setEndPoint() throws Exception{
			List<EndPointVO> ar = mapMapper.setEndPoint();
			return ar;
		}
		
		public List<DeliveryInfoVO> setInfo() throws Exception{
			List<DeliveryInfoVO> ar = mapMapper.setInfo();
			return ar;
		}
}
