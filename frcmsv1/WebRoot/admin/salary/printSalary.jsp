<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();	 
%>
<s:set var="busSalaryBaseList" value="busSalaryBaseList" />
<s:set var="curDate" value="result.ret.curDate" />
<html>
<head>
  <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"> 
  <title>工资打印</title>
  <meta http-equiv="Content-Type" content="text/html;  charset=utf-8">
  <style media="print">
      .Noprint
      {
          display: none;
      }
      .PageNext
      {
          page-break-after: always;
      }
  </style>
  <style>
      body, td, th
      {
          font-size: 12px;
      }      
      .tdp
      {
          border-bottom: 1 solid #000000;
          border-left: 1 solid #000000;
          border-right: 0 solid #ffffff;
          border-top: 0 solid #ffffff;
      }
      .tabp
      {
          border-color: #000000;
          border-collapse: collapse;
      }
      .NOPRINT
      {
          font-family:"宋体";
          font-size: 12px;
      }
  </style>
</head>
<body>
  <object id="WebBrowser" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
      width="0" viewastext>
  </object> 
  <div class="NOPRINT"><font color="red">使用IE浏览器时请把此网站加入到信任站点!</font></div> 
  <input type="button" value="打印" onclick="doPront();" class="NOPRINT">
  <input type="button" value="直接打印" onclick="document.all.WebBrowser.ExecWB(6,6)" class="NOPRINT" id="ieprint1" style="display:none">
  <input type="button" value="页面设置" onclick="document.all.WebBrowser.ExecWB(8,1)" class="NOPRINT" id="ieprint2" style="display:none">
  <input type="button" value="打印预览" onclick="document.all.WebBrowser.ExecWB(7,1)" class="NOPRINT" id="ieprint3" style="display:none">
  <br />
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center">
          <td colspan="5">
              <font size="3">黄河水利科学研究院工资单</font>
          </td>
      </tr>
      <tr style="text-align:right">         
          <td colspan="5">
             	打印时间:<s:property value="#curDate" />
          </td>
      </tr>
  </table>
  
  <s:iterator  value="busSalaryBaseList"  id="salaryBase" status="stp">  
     <table width="90%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000"
        class="tabp" style="margin-top:10px;">
        <tr>                  
       	<td>姓名</td>       	
       	<td><s:property value="#salaryBase.user_name" /></td>       	
        <td>帐号</td>        
        <td><s:property value="#salaryBase.bank_account" /></td>
        <td>发放日期</td>        
        <td><s:date name="#salaryBase.salary_schedule" format="yyyy年MM月"/></td>       
        <s:iterator  value="#salaryBase.busSalaryExtendList"  id="busSalaryExtend" status="st">
         	<td><s:property value="#busSalaryExtend.extend_name" /></td>         
        	<td><s:property value="#busSalaryExtend.extend_value" /></td>        	
        	<s:if test="((#st.index+1)*2+6)%14 == 0">
        		</tr><tr>
        	</s:if>
        </s:iterator>
        </tr>
       </table>   
       <s:if test="(#stp.index+1)%3 == 0">           			
  		 <div class="PageNext"></div> 
       </s:if>
      </s:iterator>   
 
</body>

  <script language="javascript">
    function pagesetup_null(){   
           try{
               var RegWsh = new ActiveXObject("WScript.Shell");           
               hkey_key="header";           
               RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"");
               hkey_key="footer";
               RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"");
    
           }catch(e){alert(e);}
	  }
     function getBrowserInfo(){
	       var Sys = {};
	       var ua = navigator.userAgent.toLowerCase();
	       var re =/(msie|firefox|chrome|opera|version).*?([\d.]+)/;
	       var m = ua.match(re);
	       Sys.browser = m[1].replace(/version/, "'safari");
	       Sys.ver = m[2];
	       return Sys;
	 }
	 function doPront(){
		 if("msie"==sys.browser){
			 pagesetup_null();
			 document.all.WebBrowser.ExecWB(6,1);
	     }else{
	    	 window.print();
		  }
	 }
     var sys = getBrowserInfo();
     //document.write(sys.browser + "的版本是：" + sys.ver);
     //alert(sys.browser);
     if("msie"==sys.browser){
         //alert(1);
		document.getElementById("ieprint1").style.display="";
		document.getElementById("ieprint2").style.display="";
		document.getElementById("ieprint3").style.display="";
     }
  </script>
</html>