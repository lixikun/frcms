package com.flyrui.bus.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.flyrui.bus.service.BusService;
import com.flyrui.common.service.BaseService;
import com.flyrui.dao.pojo.bus.BusData;
import com.flyrui.dao.pojo.bus.BusInfo;
import com.flyrui.dao.pojo.bus.BusRule;
import com.flyrui.dao.pojo.bus.BusTemplate;
import com.flyrui.dao.pojo.bus.BusTemplateItem;

@Service(value="busService")
public class BusServiceImpl extends BaseService<BusData> implements BusService {	
	public BusServiceImpl(){
		super.setNameSpace("com.flyrui.dao.mapper.BusData");
	}

	public List<BusTemplateItem> queryBusTemplateItem(BusTemplateItem busTemplateItem) {		
		return (List<BusTemplateItem>)baseDao.selectList(getNameSpace()+".queryBusTemplateItem", busTemplateItem);
	}

	public List<BusInfo> queryBusInfo(BusInfo busInfo) {
		return (List<BusInfo>)baseDao.selectList(getNameSpace()+".queryBusTemplateItem", busInfo);
	}

	public List<BusRule> queryBusRule(BusRule busRule) {
		return (List<BusRule>)baseDao.selectList(getNameSpace()+".queryBusTemplateItem", busRule);
	}

	public List<BusTemplate> queryBusTemplate(BusTemplate busTemplate) {
		return (List<BusTemplate>)baseDao.selectList(getNameSpace()+".queryBusTemplateItem", busTemplate);
	}
	
	

}
