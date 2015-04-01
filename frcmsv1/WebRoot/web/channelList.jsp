<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="web!commonNavHeader" executeResult="true">	
</s:action>
<s:set var="conetentList" value="result.conetentList" />
<div style="margin:0 auto">
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2" >  
  <tr> 
    <td width="730">
	<table width="730" border="0" align="center" cellpadding="0" cellspacing="0">        
        <tr> 
          <td width="730" valign="top"> 
          <div class="sidebar_b">
          	<div class="position" >
          		<span> Current Position：<a href="/">Home</a>/
          			<a href="<s:if test="channel.link!=null&&channel.link!=''"><s:property value="%{channel.link}"/></s:if><s:else><s:property value="%{channel.channel_path+getText('?channelId=')+channel.channel_id}"/></s:else>"><s:property value="channel.channel_name" /></a></span></div>
          	<div class="right_main">
                <div class="listb_name"><h2><s:property value="channel.channel_name" /></h2></div>
                     <div class="listb">
                     <ul>  
                     	<s:iterator  value="conetentList"  id="content" status="st">                       
                        <li><a href="/web_showContentDetail.do?contentId=<s:property value="#content.content_id" />" title="<s:property value="#content.title" />" target="_blank"><s:property value="#content.title" /></a></li>
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
          </td>          
        </tr>
      </table>
    </td>
    <td bgcolor="#F9F9F9" width="250" valign="top" style="vertical-align:top">
    	<table cellspacing="0" cellpadding="0" border="0" align="right" width="219">
            <tbody>
            <tr>
              <td class="text-xbt3" colspan="2">Search</td>
            </tr>
            <tr>
              <td colspan="2">
              	<div id="search" style="padding:0px 0px" >
						<form action="/web_search.do" method="post" id="searvhForm" target="_blank">  
			    			<input type="text" style="width:300px" onblur="if(this.value==''){this.value='Please input the search content'}"  onfocus="if(this.value=='Please input the search content'){this.value=''}"  value="Please input the search content" id="key" name="key">
			    			<input type="submit" class="button" value="Search" onclick="return doSearch();">
  						</form>
  				</div>             
              </td>
            </tr>
          </tbody></table>
            <div align="right"><br>
          </div>
     </td>
  </tr>
 </table>
</div>
<script>
	function doSearch(){
		if($("#key").val()=='Please input the search content' || $("#key").val()=='' ){
			alert("Please input the search content");
			return false;
		}		
		return true;
	}
</script>
 <s:action name="web_commonFooter" executeResult="true"></s:action>