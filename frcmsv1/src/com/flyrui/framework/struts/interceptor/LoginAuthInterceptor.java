package com.flyrui.framework.struts.interceptor;

import java.lang.reflect.Method;
import java.util.Map;

import org.apache.log4j.Logger;

import com.flyrui.exception.ErrorConstants;
import com.flyrui.exception.FRError;
import com.flyrui.exception.FRException;
import com.flyrui.framework.annotation.SessionCheckAnnotation;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginAuthInterceptor extends AbstractInterceptor {

	/**
	 * 注释内容
	 */
	private static final long serialVersionUID = -8046153573157978624L;
	private static Logger log = Logger.getLogger(LoginAuthInterceptor.class);

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();		
		String method = invocation.getProxy().getMethod();
		Method m = invocation.getAction().getClass().getDeclaredMethod(method);
		
		//检查方法是否需要判断session登陆
		boolean isNeed = true;//默认要校验
		//for(Method m : ms){
			if(m.getName().equals(method)){
				SessionCheckAnnotation sessionCheck = m.getAnnotation(SessionCheckAnnotation.class);
				if(sessionCheck!=null){
					if("false".equals(sessionCheck.needCheckSession())){
						isNeed = false;
					}
				}
			}
		//}
		
		String actionName = ctx.getName();
		Map<String,Object> session = ctx.getSession();
		Object user = session.get("user");
		//validateLogin
		if(user!=null || !isNeed|| "validateLogin".equals(method) || "loginOut".equals(method)){
			return invocation.invoke();
		}else{
			throw new FRException(new FRError(ErrorConstants.SYS_USER_NO_LOGIN));
		}		
	}
}
