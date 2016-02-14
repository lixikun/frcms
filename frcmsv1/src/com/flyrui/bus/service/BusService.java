package com.flyrui.bus.service;

import java.util.List;

import com.flyrui.dao.pojo.bus.BusInfo;
import com.flyrui.dao.pojo.bus.BusRule;
import com.flyrui.dao.pojo.bus.BusTemplate;
import com.flyrui.dao.pojo.bus.BusTemplateItem;

public interface BusService {
	
	public List<BusTemplateItem> queryBusTemplateItem(BusTemplateItem busTemplateItem);
	
	public List<BusRule> queryBusRule(BusRule busRule);
	
	public List<BusInfo> queryBusInfo(BusInfo busInfo);
	
	public List<BusTemplate> queryBusTemplate(BusTemplate busTemplate);
}
