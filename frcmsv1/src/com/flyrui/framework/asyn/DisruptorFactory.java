package com.flyrui.framework.asyn;

import com.lmax.disruptor.EventFactory;



public class DisruptorFactory implements EventFactory<AsynServiceEvent>{

	public AsynServiceEvent newInstance() {
		
		 return new AsynServiceEvent();
	}

}
