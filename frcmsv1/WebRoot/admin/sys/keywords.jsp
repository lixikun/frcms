<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<jsp:include page="/MgWeb/main/head.jsp"></jsp:include>

<div region="center" class="easyui-layout">
    <div region="center" title="关键词" style="padding:2px;">
        <table id="searchList" class="easyui-datagrid" rownumbers="true" pagination="true"
               fitColumns="true" nowrap="false" showFooter="true" singleSelect="true">
            <thead>
            <tr>
                <th field="id" hidden>ID</th>
                <th field="search_name" width="40">关键词</th>
                <th field="search_count" width="40">搜索次数</th>

                <th field="state" hidden>状态</th>
                <th field="state_name" width="40">状态</th>
                <th field="state_date" width="40" sortable="true">搜索时间</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<!--更改状态-->
<div style="display: none;" title="关键词" id="keyWords">
    <div region="center" style="margin-left: 20px;">
        <table width="100%" align="center">
            <tr>
                <td>关键词:</td>
                <td><input type="text" name="search_name" disabled="disabled"></td>
            </tr>
            <tr>
                <td>搜索次数:</td>
                <td><input type="text" name="search_count" disabled="disabled"></td>
            </tr>
            <tr>
                <td>状态:</td>
                <td>
                    <select name="state">
                        <option value="1">有效</option>
                        <option value="0">无效</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div align="center" style="margin-top: 20px;">
                        <a href="javascript:void(0);" class="easyui-linkbutton" id="save" iconCls="icon-save">保存</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" id="cancel" iconCls="icon-cancel">取消</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>


<jsp:include page="/MgWeb/main/foot.jsp"></jsp:include>

<script type="text/javascript" src="js/keywords.js"></script>