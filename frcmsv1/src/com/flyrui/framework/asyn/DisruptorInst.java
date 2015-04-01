package com.flyrui.framework.asyn;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import com.lmax.disruptor.RingBuffer;
import com.lmax.disruptor.dsl.Disruptor;



public class DisruptorInst {
	private static DisruptorInst inst = null;
	private Executor executor = null;
	private int bufferSize = 65536;
	private Disruptor<AsynServiceEvent> disruptor = null;
	private static Object keyObj = new Object();
	private DisruptorFactory factory = null;
	
	/**
	 * 
	 */
	private DisruptorInst() {
		factory = new DisruptorFactory();
		executor = Executors.newCachedThreadPool();
	}
	
	/**
	 * 
	 * @return
	 */
	public static DisruptorInst getInst() {
		if (inst == null) {
			synchronized (keyObj) {
				if (inst == null) {
					inst = new DisruptorInst();
					inst.startDisruptor();
				}
			}
		}
		return inst;
	}
	
	private void startDisruptor() {
		disruptor = new Disruptor<AsynServiceEvent>(factory, bufferSize,executor);
		disruptor.handleEventsWith(new AsynEventHandler());
		disruptor.handleExceptionsWith(new AsynServiceException());
		disruptor.start();
	}
	
	public void putEvent(AsynServiceConfig confgiInfo) {		
		RingBuffer<AsynServiceEvent> ringBuffer = disruptor.getRingBuffer();
		AsynServiceProducer producer = new AsynServiceProducer(ringBuffer);
		producer.write(confgiInfo);
	}

}
