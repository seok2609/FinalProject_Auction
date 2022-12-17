package com.im.home.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapService {

		@Autowired
		private MapMapper mapMapper;
		
		public List<MapVO> setStartPoint() throws Exception{
			List<MapVO> ar = mapMapper.setStartPoint(); 
			return ar;
		}
		
		public List<MapVO> setEndPoint() throws Exception{
			List<MapVO> ar = mapMapper.setEndPoint();
			return ar;
		}
}
