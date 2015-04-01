package com.flyrui.framework.asyn;


public class AsynServiceConfig implements java.io.Serializable{

	
	public Object parameters_1;
	
	public Object parameters_2;
	
	public BusinessHandler businessHandler;

	public Object parameters_3;

	public Object parameters_4;
	
	private AsynServiceConfig(){
		
		
	}
	
	public AsynServiceConfig(BusinessHandler businessHandler){
		
		this.businessHandler=businessHandler;
	}
	

	public BusinessHandler getBusinessHandler() {
		return businessHandler;
	}

	public void setBusinessHandler(BusinessHandler businessHandler) {
		this.businessHandler = businessHandler;
	}

	public Object getParameters_1() {
		return parameters_1;
	}

	public void setParameters_1(Object parameters_1) {
		this.parameters_1 = parameters_1;
	}

	public Object getParameters_2() {
		return parameters_2;
	}

	
	public void setParameters_2(Object parameters_2) {
		this.parameters_2 = parameters_2;
	}

	public Object getParameters_3() {
		return parameters_3;
	}

	public void setParameters_3(Object parameters_3) {
		this.parameters_3 = parameters_3;
	}

	public Object getParameters_4() {
		return parameters_4;
	}

	public void setParameters_4(Object parameters_4) {
		this.parameters_4 = parameters_4;
	}

}
