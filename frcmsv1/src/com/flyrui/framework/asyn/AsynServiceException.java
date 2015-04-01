package com.flyrui.framework.asyn;

import com.lmax.disruptor.ExceptionHandler;

public class AsynServiceException  implements ExceptionHandler {

	
	public void handleEventException(Throwable ex, long seq, Object obj) {
		// TODO Auto-generated method stub
		ex.printStackTrace();
	}

	
	public void handleOnShutdownException(Throwable arg0) {
		// TODO Auto-generated method stub
		
	}

	
	public void handleOnStartException(Throwable arg0) {
		// TODO Auto-generated method stub
		
	}

}
