<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="web!commonNavHeader" executeResult="true">	
</s:action>
<s:set var="contentList" value="result.contentList" />
<s:set var="channelList" value="result.channelList" />
<div style="margin:0 auto">
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2" >  
  <tr> 
    <td width="730">
	<table width="730" border="0" align="center" cellpadding="0" cellspacing="0">        
        <tr> 
          <td width="730" valign="top"> 
          <div class="sidebar_b">
          	<div class="position" >
          		<span> Current Position：<a href="/">Home</a>/Search</span>
          	</div>
          	<div id="search">  
          		<form action="/web_search.do" method="post" id="searvhForm">  
			    	<input type="text" name="key" id="key" value="<s:if test="key!=null && key !=''"><s:property value="key" /></s:if><s:else>Please input the search content</s:else>">
			    	<input class="button" type="submit" value="Search" onclick="return doSearch();">
			    </form>
			</div>
          	<div class="right_main">
                <div class="listb_name"><h2>Search Result</h2></div>
                     <div class="listb">
                     	<ul>  
                     		<s:if test="#channelList.size()>0 || #contentList.size()>0">
                     		<s:iterator  value="channelList"  id="channelIner" status="st">                       
	                        	<li><a href="<s:if test="#channelIner.link!=null&&#channelIner.link!=''"><s:property value="%{#channelIner.link}"/></s:if><s:else><s:property value="%{#channelIner.channel_path+getText('?channelId=')+#channelIner.channel_id}"/></s:else>" title="<s:property value="#channelIner.channel_name" />"><s:property value="#channelIner.channel_name" /></a></li>
	                      	</s:iterator>
	                     	<s:iterator  value="contentList"  id="content" status="st">                       
	                        	<li><a href="/web_showContentDetail.do?contentId=<s:property value="#content.content_id" />" title="<s:property value="#content.title" />"><s:property value="#content.title" /></a></li>
	                      	</s:iterator>
	                      	</s:if>
	                      	<s:else>
	                      		<div>There is no record to been found for searching content!</div>
	                      	</s:else>	                      	
                      </ul>
                 </div>
                 <div class="bottom_line"><img width="692" height="22" src="/web/css/images/bottom_line.gif"></div>
                                
              </div> 
            </div>
          </td>          
        </tr>
      </table>
    </td>
    <td bgcolor="#F9F9F9" width="250" valign="top" style="vertical-align:top">
    	
     </td>
  </tr>
 </table>
</div>
<script type="text/javascript">
	$(function(){
		$("#key").focus(function(){
			var v = $(this).val();
			if(v=='Please input the search content'){
				$(this).val("");
			}
		});
		$("#key").blur(function(){
			var v = $(this).val();
			if(v==''){
				$(this).val("Please input the search content");
			}
		});
	});
	function doSearch(){
		if($("#key").val()=='Please input the search content' || $("#key").val()=='' ){
			alert("Please input the search content");
			return false;
		}		
		return true;
	}
</script>
 <s:action name="web_commonFooter" executeResult="true"></s:action>