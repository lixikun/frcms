<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();
%>
<s:set var="content" value="result.content" />
<s:set var="contentTxt" value="result.contentTxt" />
<s:action name="web!commonNavHeader" executeResult="true">
	<s:param name="channel.title"><s:property value="#content.title" /></s:param>
</s:action>

<script type="text/javascript" src="<%=baseUri %>/web/js/main.js" ></script>
<table width="982" border="0" align="center" cellpadding="0" cellspacing="0" >  
  <tr> 
    <td>
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2">
        <tr> 
          <td width="740" valign="top"> 
          	<div class="listb_name" style="margin: 0px; padding-top: 10px; padding-left: 10px; ">
				<h2 style="float:left;"><s:property value="channel.channel_name" /></h2>
			</div>
          	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2">
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
          <br> </td>
          <td width="240" valign="top" bgcolor="#F9F9F9" style="vertical-align:top">
          	<table width="230" border="0" align="right" cellpadding="0" cellspacing="0" style="vertical-align:top;padding-left:10px;">
	            <tr>
	              <td width="230" class="text-xbt3">Search</td>
	            </tr>
	            <tr>
	              <td style="vertical-align:top">
	              	<div id="search" style="padding:0px 0px;width:230px" >
							<form action="<%=baseUri %>/web_search.do" method="post" id="searvhForm" target="_blank">  
				    			<input type="text" style="width:220px" onblur="if(this.value==''){this.value='Please input the search content'}"  onfocus="if(this.value=='Please input the search content'){this.value=''}"  value="Please input the search content" id="key" name="key">
				    			<div style="height:10px;"></div>
				    			<input type="submit" class="button" value="Search" onclick="return doSearch();">
	  						</form>
	  				</div>  
	              </td>
	            </tr>
          	</table>
          </td>
        <tr>
      </table>
    </td>
  </tr>
 </table>
 <s:action name="web_commonFooter" executeResult="true"></s:action>