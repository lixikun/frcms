<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();
%>
<s:set var="busTemplateItemList" value="result.busTemplateItemList" />
<jsp:include page="/admin/main/head.jsp"></jsp:include>
<script language="javascript" type="text/javascript" >
	var busId="<s:property value="busId" />";
	var q="<s:property value="q" />";
</script>
<div region="center" class="easyui-layout">
    <div region="north" style="height:70px;" id="search">
        <div region="center" id="searchDiv" style="margin-top: 10px;margin-left: 5px;">
        	<div>         	
	            <label>查询开始时间：</label><input type="text" name="col5_start" db_field="busData.col5_start" is_like="0" class="easyui-datebox" />
	            <label>查询结束时间：</label><input type="text" name="c0l5_end" db_field="busData.col5_end" is_like="0" class="easyui-datebox" />
	            <s:if test="%{q == 1}">
	               <label>证件号码：</label><input type="text" name="s_user_code" db_field="busData.user_code" need_encode="1" is_like="1" style="width:100px;">
	               <label>员工名称：</label><input type="text" name="s_user_name" db_field="busData.col1" need_encode="1" is_like="1" style="width:100px;">	            
	            </s:if>
	           <input type="hidden" db_field="busData.bus_id" is_like="0" value="<s:property value="busId" />"> 
	        </div>
            <div style="padding-top:5px">
                 <s:if test="%{q == 1}">
	            	<label>批次号：</label><input type="text" name="s_batch_id" db_field="busData.batch_id" is_like="0" style="width:200px;"> 
	            	<a href="javascript:void(0);" class="easyui-linkbutton" id="delete_by_batch_btn" >按批次删除</a>
	            </s:if>
	            <a href="javascript:void(0);" class="easyui-linkbutton" id="search_btn" iconCls="icon-search">搜索</a>
            </div>
        </div>
     </div>

    <div region="center" title="查询列表" style="padding:2px;"> 
        <table id="salaryList"  rownumbers="true" pagination="true"
               fitColumns="true" nowrap="false" showFooter="true" singleSelect="false" style="height:400px" checkbox="true" autoRowHeight="false">
            <thead>
            <tr> 
            	<th checkbox="true"></th>
                <s:iterator  value="busTemplateItemList"  id="busTemplateItem" status="st">             	            	
            	  <th field="<s:property value="#busTemplateItem.data_col" />" ><s:property value="#busTemplateItem.item_name" /></th>
        	    </s:iterator>
            </tr>
            </thead>
        </table>
    </div>
</div>

<!--导入-->
<div id="execel_info" style="display: none;" title="Excel导入">
    <div rgion="center" style="height: 140px;">        	
    	<form action="" name="excelForm" method="POST" enctype="multipart/form-data">
	        <table id="execel_info_tb" style="height:120px">	            
	            <tr>
	                <td colspan="2">请选择导入文件：</td>
	            </tr>
	            <s:file name="upload" label="File"/>	           
	            <tr>
	            	<td colspan="2">
	            		<a href="javascript:void(0);" style="text-align: center;" id="import_btn" class="easyui-linkbutton" iconCls="icon-save">导入</a>
	            		<a href="javascript:void(0);" style="text-align: center;" id="cancel_import_btn" class="easyui-linkbutton" iconCls="icon-save">关闭</a>
	            	</td>
	            </tr>	           
	        </table>
        </from>
    </div> 
    <div rgion="bottom" style="height: 80px;"> 
       	<div id="importHints">
       		<span id="importParseFailNum" class="red"></span><br/>
     		<span id="importSucNum" class="red"></span><br/>
     		<span id="importErrNum" class="red"></span><br/>
     		<span id="importErrMsg" class="red"></span><br/>
     		<span id="importBatchId" class="red"></span>                		
     	</div>	             
    </div>
</div>
<div id="output"></div>
<jsp:include page="/admin/main/foot.jsp"></jsp:include>
<script type="text/javascript" src="<%=baseUri %>/admin/bus/js/busMan.js"></script>