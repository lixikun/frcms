package com.flyrui.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

/**
 *  从dwr的上下文中取得当前的request信息
 *  
 * @author  Lee
 * @version  [版本号, May 3, 2012]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public class ContextHelper {
	/**
	 * 获取request对象
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		WebContext ctx = WebContextFactory.get();
		if(ctx==null){
			return null;
		}
		HttpServletRequest request = ctx.getHttpServletRequest();
		return request;
	}
	/**
	 * 获取session对象
	 * @return
	 */
	public static HttpSession getSession() {
		WebContext ctx = WebContextFactory.get();
		if(ctx==null){
			return null;
		}
		HttpSession session = ctx.getSession();
		return session;
	}
	/**
	 * 获取request中的key值
	 * @param key
	 * @return
	 */
	public static Object getRequestObj(String key){
		if(getRequest()==null)return null;
		return getRequest().getAttribute(key);
	}
	/**
	 * 设置request中的key值
	 * @param key
	 * @param value
	 */
	public static boolean setReqeustObj(String key,Object value){
		if(getRequest()==null)return false;
		getRequest().setAttribute(key, value);
		return true;
	}
	/**
	 * 获取session中的key值
	 * @param key
	 * @return
	 */
	public static Object getSessionObj(String key){
		if(getSession()==null)return null;
		return getSession().getAttribute(key);
	}
	/**
	 * 设置session中的key值
	 * @param key
	 * @param value
	 */
	public static boolean setSessionObj(String key,Object value){
		if(getSession()==null)return false;
		getSession().setAttribute(key, value);
		return true;
	}
	
	/**
	 * 获取线程IP
	 * @return
	 */
	public static String getIp(){
		HttpServletRequest request = getRequest();
		return getRequestIp(request);
		
	}
	public static String getRequestIp(HttpServletRequest request) {
		// 取IP地址
		String vIP = request.getHeader("x-forwarded-for");
		if (vIP == null || vIP.length() == 0|| "unknown".equalsIgnoreCase(vIP)) {
			vIP = request.getHeader("X-Forwarded-For");
		}
		if (vIP == null || vIP.length() == 0|| "unknown".equalsIgnoreCase(vIP)) {
			vIP = request.getHeader("Proxy-Client-IP");
		}
		if (vIP == null || vIP.length() == 0|| "unknown".equalsIgnoreCase(vIP)) {
			vIP = request.getHeader("WL-Proxy-Client-IP");
		}
		if (vIP == null || vIP.length() == 0|| "unknown".equalsIgnoreCase(vIP)) {
			vIP = request.getRemoteAddr();
		}
		return vIP;
	}
}
