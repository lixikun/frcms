<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:property value="channel.title" default="YRIHR"/></title>
<link rel="stylesheet" href="/web/css/main.css" type="text/css" />
<script src="/public/common/ress/js/jquery-1.5.1.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/web/js/main.js" ></script>
</head>
<s:set var="headNavList" value="result.headNavList" />
<body>
<div>
<table width="982" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2">

  <tr> 
    <td height="134" background="/web/images/t-bg.jpg"><table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="87"><img src="/web/images/top-bg.jpg" width="980" height="134"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="50" background="/web/images/navbg.jpg">	 
    	<table cellspacing="0" cellpadding="0" border="0" align="center" width="982">
    		<s:iterator  value="headNavList"  id="headNav" status="st">	
	    		<td align="center" class="text14" <s:if test="#headNav.channel_id == 1">width="100"</s:if>>
	    			<a style="font-size:17px <s:if test=" pid == #headNav.channel_id " > ;color:#3366cc </s:if>" href="<s:if test="#headNav.link!=null&&#headNav.link!=''"><s:property value="%{#headNav.link}"/></s:if><s:else><s:property value="%{#headNav.channel_path+getText('?channelId=')+#headNav.channel_id}"/></s:else>">
		      			<s:property value="#headNav.channel_name"/>
		      		</a>
		      	</td>
	      	</s:iterator>
    	</table>
    	<%-- 
    	<div class="nav">  
    		<ul>
	      <s:iterator  value="headNavList"  id="headNav" status="st">	      
	      	 <li <s:if test=" channelId == #headNav.channel_id " > class="currNav" </s:if>>
	      		<a <s:if test="#st.last == false" > class="navborderRight" </s:if> href="<s:if test="#headNav.link!=null&&#headNav.link!=''"><s:property value="%{#headNav.link}"/></s:if><s:else><s:property value="%{#headNav.channel_path+getText('?channelId=')+#headNav.channel_id}"/></s:else>">
	      			<s:property value="#headNav.channel_name"/>
	      		</a>
	      	 </li>	      
	      </s:iterator>   
	      </ul>  
		</div>
		--%>    
   </td>
  </tr>
 </table> 
 
</div>