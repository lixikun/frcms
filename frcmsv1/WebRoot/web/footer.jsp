<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();
%>
<s:set var="visitCount" value="result.visitCount" />
<div>
	<table width="982" border="0" align="center" cellpadding="0" cellspacing="0" style="border-top: 2px solid #0072b8; background: none repeat scroll 0px 0px #f7f7f7;">
	  <tr> 
	    <td height="100" style="padding:0px 0px;color:#000000" class="text-bo">
	      <div>
			  <div style="width:250px;float:left;text-align:right"><a target="_blank" href="//bszs.conac.cn/sitename?method=show&amp;id=09C5E784889E29BDE053012819ACE67A"><img vspace="0" hspace="0" border="0" data-bd-imgshare-binded="1" src="http://dcs.conac.cn/image/blue.png" id="imgConac"></a></div>
			  <div style="text-aling:center;width:550px;float:left">
			  <div style="text-align:center">The number of visits ：<s:property value="#visitCount" /></div>
				    	 <div style="text-align:center">Address: 45 Shunhe Road, Zhengzhou 450003, China .  Tel: 86-371-66024525</div>
				        <div style="text-align:center"> Copyright &copy;2014 by Yellow River Institute Of Hydraulic Research</div>
			  </div>
	       </div>
	      </td>
	  </tr>
	</table>
</div>
<script language="javascript" type="text/javascript" src="<%=baseUri %>/public/common/log/event-min.js" defer="defer"></script>
</body>
</html>