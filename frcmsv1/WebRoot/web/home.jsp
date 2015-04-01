<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome to YRIHR</title>
<link rel="stylesheet" href="/web/css/main.css" type="text/css" />
<script src="/public/common/ress/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="/public/SuperSlide/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script> 
<script type="text/javascript" src="/web/js/main.js" ></script>
<style type="text/css">
	 /* 本例子css */
	.picMarquee-left{ overflow:hidden; position:relative;   margin:0px width:980px;}
	.picMarquee-left .hd{ overflow:hidden;  height:30px; background:#f4f4f4; padding:0 10px;  }
	.picMarquee-left .hd .prev,.picMarquee-left .hd .next{ display:block;  width:5px; height:9px; float:right; margin-right:5px; margin-top:10px;  overflow:hidden;
		 cursor:pointer; background:url("/web/css/images/arrow.png") no-repeat;}
	.picMarquee-left .hd .next{ background-position:0 -50px;  }
	.picMarquee-left .hd .prevStop{ background-position:-60px 0; }
	.picMarquee-left .hd .nextStop{ background-position:-60px -50px; }

	.picMarquee-left .bd{ padding:10px;   margin:0px;}
	.picMarquee-left .bd ul{ overflow:hidden; zoom:1; margin:0px;width:980px;}
	.picMarquee-left .bd ul li{ width:164px;margin:0 8px; float:left; _display:inline; overflow:hidden; text-align:center;  }
	.picMarquee-left .bd ul li .pic{ text-align:center; }
	.picMarquee-left .bd ul li .pic img{ width:164px; height:114px; display:block; padding:2px;  }
	.picMarquee-left .bd ul li .pic a:hover img{ border-color:#999;  }
	.picMarquee-left .bd ul li .title{ line-height:24px;   }
</style>
</head>
<%--获取查询到的数据 --%>
<s:set var="headNavList" value="result.headNavList" />
<s:set var="picList" value="result.picList" />
<s:set var="linkList" value="result.linkList" />

<body >
  <div class="main">
  	  <div id="shortcut">
	      <div class="center980">  
	        <ul>       
	        <li><a href="javascript:void(0);" onclick="SetHome(this,window.location)" >Set Home Page</a></li>
	        <li><a href="javascript:void(0);" onclick="AddFavorite(window.location,document.title)" >Add Favorite</a></li>
	        <li><a target="_blank" href="http://www.yrihr.com.cn/" target="_blank">Chinese</a></li>       
	      </ul>
	      </div>
     </div>
	  <div style="width:980px;">
	       <img src="/web/images/top-bg.jpg" width="980" height="134">
	  </div> 
	  <div style="width:980px;">
	      <img src="/web/images/top.jpg" width="980" height="280">
	  </div>
	   
	  <div class="nav">  
	  <table cellspacing="0" cellpadding="0" border="0" align="center" width="982">
      <tbody><tr>
        <td align="center" height="5"></td>
        <td align="center" height="5"></td>
        <td align="center" height="5"></td>
        <td align="center" height="5"></td>
        <td align="center" height="5"></td>
      </tr>
      <tr>
	     <s:iterator  value="headNavList"  id="headNav" status="st">	
	        <s:if test="#headNav.channel_id != 1">
		        <td align="center" width="<s:property value="#headNav.title_img_width" default="163"/>" height="<s:property value="#headNav.title_img_height" default="45"/>"> 
		     		<a <s:if test="#st.last == false" > class="navborderRight" </s:if> href="<s:if test="#headNav.link!=null&&#headNav.link!=''"><s:property value="%{#headNav.link}"/></s:if><s:else><s:property value="%{#headNav.channel_path+getText('?channelId=')+#headNav.channel_id}"/></s:else>">
		     			<img border="0" width="<s:property value="#headNav.title_img_width" default="174"/>" height="<s:property value="#headNav.title_img_height" default="45"/>" src="<s:property value="#headNav.title_img"/>"/>
		     		</a>
		     	</td>	
	     	</s:if>     	      
	     </s:iterator>
       </tr>  
       <tr>      
	    <s:iterator  value="picList"  id="pic" status="st" begin="0" end="5">	
	        <s:if test="#headNav.channel_id != 1">
		        <td align="center" width="<s:property value="#pic.title_img_width" default="163"/>" height="<s:property value="#pic.title_img_height" default="45"/>"> 
		     		<a href="<s:property value="%{#pic.channel_path}"/>" target="_blank">
								<img src="<s:property value="%{#pic.title_img}"/>" width="<s:property value="#pic.title_img_width" default="164"/>" height="<s:property value="#headNav.pic" default="114"/>" />
							</a>
		     	</td>	
	     	</s:if>     	      
	     </s:iterator>
       </tr>   
    </tbody></table>
	  		
	  </div> 	 
	  <%-- 
	   <div class="picMarquee-left">
			<div class="hd">
				<a class="next"></a>
				<a class="prev"></a>
			</div>
			<div class="bd">
				<ul class="picList">
				  <s:iterator  value="picList"  id="pic" status="st" begin="0" end="4">	
					<li>
						<div class="pic">
							<a href="<s:property value="%{#pic.channel_path}"/>" target="_blank">
								<img src="<s:property value="%{#pic.title_img}"/>" width="<s:property value="#pic.title_img_width" default="164"/>" height="<s:property value="#headNav.pic" default="114"/>" />
							</a>
					   </div>						
					</li>	
				  </s:iterator>					 		
				</ul>
			</div>
		</div>
		<script id="jsID" type="text/javascript">		 	
			//jQuery(".picMarquee-left").slide( { mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",vis:3,interTime:50,opp:false,pnLoop:true,trigger:"click",mouseOverStop:true });
		</script>  
	--%>
   <div style="clear:both"></div>
   <div style="width:980px;">
	   <table cellspacing="0" cellpadding="0" border="0" align="right" width="100%">
	        <tbody>
		        <tr>
		          <td align="center" width="80" height="50" class="text-xbt4">Search</td>
		          <td width="400">
					<div id="search" style="padding:0px 0px" >
						<form action="/web_search.do" method="post" id="searvhForm" target="_blank">  
			    			<input type="text" style="width:250px;height:25px;" onblur="if(this.value==''){this.value='Please input the search content'}"  onfocus="if(this.value=='Please input the search content'){this.value=''}"  value="Please input the search content" id="key" name="key">
			    			<input type="submit" class="button" value="Search" onclick="return doSearch();">
  						</form>
  					</div>
				  </td>
		          <td align="center" width="150" class="text-xbt4">Related links</td>
		          <td align="left">
			          <select id="link" style="height:25px;font-size:12px">
			          <s:iterator  value="linkList"  id="link" status="st">
							<option value="<s:property value="%{#link.link}"/>"><s:property value="%{#link.channel_name}"/></option>
	           		  </s:iterator>		            
			          </select>
		          </td>
		          <form id="goToForm">		          	
		          </form>
		        </tr>
	      </tbody>
	    </table>
   </div> 
  </div>
  <script language="javascript">
  	$("#link").change(function(){
		var url = $(this).val();		
		var fm = document.getElementById("goToForm");
		fm.target="_blank";
		fm.action=url;
		fm.submit();
  	});
  </script>
  <s:action name="web_commonFooter" executeResult="true"></s:action>
