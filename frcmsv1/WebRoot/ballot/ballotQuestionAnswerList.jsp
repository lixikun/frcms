<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="/admin/main/head.jsp"></jsp:include>
<div region="center" class="easyui-layout">    

    <div region="center" title="问题答案列表" style="padding:2px;">
        <table id="answerList"  rownumbers="true" pagination="true"
               fitColumns="false" nowrap="false" showFooter="true" singleSelect="false" style="height:400px" checkbox="true" autoRowHeight="true">
            <thead>
            <tr> 
            	<th checkbox="true"></th>            	
            	<th field="question_content" width="250">问题名称</th>
        		<th field="answer_content" width="600">问题答案</th>
				<th field="create_time" width="120">提交时间</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<div id="output"></div>
<jsp:include page="/admin/main/foot.jsp"></jsp:include>
<script type="text/javascript" src="js/ballotQuestionAnswerList.js"></script>
