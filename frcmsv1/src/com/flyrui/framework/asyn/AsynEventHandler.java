package com.flyrui.framework.asyn;

import org.apache.log4j.Logger;

import com.lmax.disruptor.EventHandler;


public class AsynEventHandler implements
		EventHandler<AsynServiceEvent> {

	private Logger log = Logger.getLogger(AsynEventHandler.class);

	
	public void onEvent(AsynServiceEvent event, long sequence,
			boolean endOfBatch) throws Exception {
		//log.info("2.handler a LogServiceEvent and sort=" + sequence);
		AsynServiceConfig confgiInfo = event.getConfgiInfo();
		if (confgiInfo == null) {
			return;
		}
		
		try {
			if(confgiInfo.businessHandler!=null)
				
				confgiInfo.businessHandler.execute(confgiInfo.parameters_1,confgiInfo.parameters_2,confgiInfo.parameters_3,confgiInfo.parameters_4);

		}catch (Exception e) {
			
		}
			
	}
		
}
