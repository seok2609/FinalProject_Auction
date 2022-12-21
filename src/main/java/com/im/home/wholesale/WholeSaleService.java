package com.im.home.wholesale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.im.home.members.MembersVO;
import com.im.home.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WholeSaleService {
	
	@Autowired
	private WholeSaleMapper wholeSaleMapper;
	
	public int setAdd(WholeSaleVO wholeSaleVO) throws Exception{
		return wholeSaleMapper.setAdd(wholeSaleVO);
	}
	
	public List<WholeSaleVO> getList(Pager pager) throws Exception{
		pager.makeRow();
		return wholeSaleMapper.getList(pager);
	}
	
	public List<WholeSaleVO> getWhsalMain(String saleDate)throws Exception{
		return wholeSaleMapper.getWhsalMain(saleDate);
	}
	
	public List<WholeSaleVO> getMidMain(String saleDate)throws Exception{
		return wholeSaleMapper.getMidMain(saleDate);
	}
	
	public WholeSaleVO getTotAmt(String saleDate)throws Exception{
		return wholeSaleMapper.getTotAmt(saleDate);
	}
	
	public WholeSaleVO getTotQty(String saleDate)throws Exception{
		return wholeSaleMapper.getTotQty(saleDate);
	}
	
	public Long getListCount(Pager pager)throws Exception{
		return wholeSaleMapper.getListCount(pager);
	}

	
	public List<WholeSaleVO> getMidSale(Pager pager)throws Exception{
		return wholeSaleMapper.getMidSale(pager);
	}
	
	public List<WholeSaleVO> getRtime(String whsalCd)throws Exception{
		return wholeSaleMapper.getRtime(whsalCd);
	}

}
