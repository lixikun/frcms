<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="web!commonNavHeader" executeResult="true">	
	<s:param name="channel.title"><s:property value="channel.title" /></s:param>	
</s:action>
<s:set var="conetentList" value="result.conetentList" />
<s:set var="subMenuList" value="result.subMenuList" />
<div style="margin:0 auto">
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2" >  
  <tr> 
    <td width="730">
	<table width="730" border="0" align="center" cellpadding="0" cellspacing="0">        
        <tr> 
          <td width="730" valign="top">           
          <s:if test="flag != 1"> <%--展示页面列表 --%>
          <div class="sidebar_b">
          	<div class="position" >
          		<span> Current Position：<a href="/">Home</a>/
          			<a href="<s:if test="channel.link!=null&&channel.link!=''"><s:property value="%{channel.link}"/></s:if><s:else><s:property value="%{channel.channel_path+getText('?channelId=')+channel.channel_id}"/></s:else>"><s:property value="channel.channel_name" /></a></span></div>
          	<div class="right_main">
                <div class="listb_name"><h2><s:property value="channel.channel_name" /></h2></div>
                     <div class="listb">
                     <ul>  
                     	<s:iterator  value="conetentList"  id="content" status="st">                       
                        <li><a href="/web_showContentDetail.do?contentId=<s:property value="#content.content_id" />&pid=<s:property value="pid" />" title="<s:property value="#content.title" />" target="_blank"><s:property value="#content.title" /></a></li>
                      	</s:iterator>
                      </ul>
                 </div>
                 <div class="bottom_line"><img width="692" height="22" src="/web/css/images/bottom_line.gif"></div>
                 <%-- 
                 <div class="page">
                     <div class="pagelist">
                         <a href="htm/portal/90.html">First</a>  <a href="htm/portal/90_1.html">Next</a>  <a href="htm/portal/90_21.html">End</a> <span style="float:left">total:297 records current page: 1   total :22 pages</span>
                     </div>
                 </div> 
                 --%>                  
                </div> 
             </div>
             </s:if>
             <s:else><%--展示页面内容 --%>
                <s:set var="content" value="#conetentList[0]" />
                <s:set var="contentTxt" value="result.contentTxt" />
             	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	              <tr> 
	                <td height="40" align="center" class="text-bt"><s:property value="#content.title"/></td>
	              </tr>
	              <tr>
	                <td >
	                	<div class="content">
	                		<s:property value="#contentTxt.txt" escape="false" />
	                	</div>
	                </td>
	              </tr>
	              <tr> 
	                <td height="10">&nbsp;</td>
	              </tr>
	            </table>
             </s:else>
          </td>          
        </tr>
      </table>
    </td>
    <td bgcolor="#F9F9F9" width="250" valign="top" style="vertical-align:top">
    	<table cellspacing="0" cellpadding="0" border="0" align="right" width="219">
            <tbody>
	            <tr>
	              <td class="text-xbt3" colspan="2">Menu</td>
	            </tr>
	            <s:if test="#subMenuList!=null && #subMenuList.size()>0">
	            	<s:iterator  value="subMenuList"  id="subChannel" status="st">  
		            	<tr>
		              		<td height="35">&nbsp;</td>
		              		<td width="196" class="text-xbt4">
		              		   <a  href="<s:if test="#subChannel.link!=null&&#subChannel.link!=''"><s:property value="%{#subChannel.link}"/></s:if><s:else><s:property value="%{#subChannel.channel_path+getText('?channelId=')+#subChannel.channel_id}"/></s:else>">
				      			<s:property value="#subChannel.channel_name"/>
				      		  </a>
		              		</td>
		            	</tr> 
	            	</s:iterator>  
	            </s:if>
	            <s:else>
            		<tr>
	              		<td height="35">&nbsp;</td>
	              		<td width="196" class="text-xbt4">
	              		   <a  href="<s:if test="channel.link!=null&&channel.link!=''"><s:property value="%{channel.link}"/></s:if><s:else><s:property value="%{channel.channel_path+getText('?channelId=')+channel.channel_id}"/></s:else>">
			      			<s:property value="channel.channel_name"/>
			      		  </a>
	              		</td>
	            	</tr> 
	            </s:else>                      
	          </tbody>
          </table>
     </td>
  </tr>
 </table>
</div>
 <s:action name="web_commonFooter" executeResult="true"></s:action>