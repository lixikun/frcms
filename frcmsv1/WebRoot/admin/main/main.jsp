<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>飞锐电子科技-CMS管理系统</title>
<link rel="stylesheet" href="<%=baseUri%>/public/common/ress/css/reset.css" type="text/css" />
<link rel="stylesheet" href="<%=baseUri%>/public/common/ress/css/main.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=baseUri%>/public/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=baseUri%>/public/common/ress/css/jq/jquery.loadmask.css">
<link rel="stylesheet" type="text/css" href="<%=baseUri%>/public/easyui/themes/icon.css">
<script type="text/javascript" src="<%=baseUri%>/ress/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=baseUri%>/public/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=baseUri%>/public/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=baseUri%>/public/common/ress/js/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="<%=baseUri%>/public/common/ress/js/json2.js"></script>
<script type="text/javascript" src="<%=baseUri%>/public/common/ress/js/CommonUtils.js"></script>
<script type="text/javascript" src="<%=baseUri%>/admin/main/js/frame_menu.js"></script>
</head>
<script language="javascript" type="text/javascript" >
	var base="<%=baseUri%>";
</script>
<style type="text/css">
body{ behavior:url("css/csshover3.htc");}
*{ margin:0; padding:0; font-size:100%;}
html, body{ height:100%;}
html{box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; padding:75px 0 34px 0; overflow:hidden; }
</style>

<script language="JavaScript">
function correctPNG() // correctly handle PNG transparency in Win IE 5.5 & 6.
{
     var arVersion = navigator.appVersion.split("MSIE")
     var version = parseFloat(arVersion[1])
     if ((version >= 5.5) && (document.body.filters)) 
     {
       for(var j=0; j<document.images.length; j++)
       {
           var img = document.images[j]
           var imgName = img.src.toUpperCase()
           if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
           {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
           }
       }
     }    
}
</script>

<body>
<div class="header">
  <div class="header_logo"></div>
    <div class="header_center">
    	<ul class="quick_menu">
    	
        </ul>
    </div>
    <div class="header_right">
    	<!--  <a id="profile" href="javascript:void(0)"><img src="/public/common/ress/images/main/icon_home.png" width="16" height="16" style="vertical-align:middle;">&nbsp;个人资料</a> -->
    	<a id="mdfPwd" href="javascript:void(0)"><img src="<%=baseUri%>/public/common/ress/images/main/icon_home.png" width="16" height="16" style="vertical-align:middle;">&nbsp;修改密码</a>
    	<!--   <a id="relogin" href="javascript:void(0)"><img src="/public/common/ress/images/main/icon_reset.png" width="16" height="16" style="vertical-align:middle;">&nbsp;重新登录</a>-->
    	<a id="logout" href="javascript:void(0)"><img src="<%=baseUri%>/public/common/ress/images/main/icon_close.png" width="16" height="16" style="vertical-align:middle;">&nbsp;退出</a>
    </div>
    <div class="clear"></div>
</div>
<div class="wrapper">
	<div class="leftmenu">
		<div class="leftmenutop"></div>
    	<div id="left_menu" class="left_menu">
            <ul id="menu"> 
		    </ul>
		</div>
    </div>
    <div class="centerline"><a id="center_line" href="javascript:void(0)"></a></div>
  	<div class="main_div">
    	<iframe id="frame_page" frameborder="0" src="<%=baseUri%>/admin/main/iframe.jsp" style="width:100%; height:100%; border:none;"></iframe>
  	</div>
</div>
<div style="display:none" id="pwd_win">
	<div>
		<table style="width:100%;padding:25px 20px 20px 20px;text-align:center">
			<tr><td>原密码:</td><td><input type="password" id="old_pwd" name="old_pwd" width="100px" /></td></tr>
			<tr><td>新密码:</td><td><input type="password" id="new_pwd" name="new_pwd" width="100px" /></td></tr>
			<tr><td>确认新密码:</td><td><input type="password" id="re_new_pwd" name="re_new_pwd" width="100px" /></td></tr>
			<tr>
				<td colspan="2">
					<div style="margin:10px 0;">
	            		<a href="javascript:void(0);" id="save" iconCls="icon-save" class="easyui-linkbutton">保存</a>
	            		<a href="javascript:void(0);" id="cancel" iconCls="icon-cancel" class="easyui-linkbutton">取消</a>
	        		</div>
        		</td>
        	</tr>
		</table>
	</div>
</div>
<div class="footer">河南飞锐电子科技有限公司版权所有@2012-2014</div>
</body>
</html>
