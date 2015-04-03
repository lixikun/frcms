<%@ page contentType="text/html; charset=utf-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String baseUri = request.getContextPath();
%>
<jsp:include page="/admin/main/head.jsp"></jsp:include>
<link rel="stylesheet" href="<%=baseUri %>/public/common/ress/css/reset.css" type="text/css" />
<link rel="stylesheet" href="<%=baseUri %>/public/common/ress/css/main.css" type="text/css" />
<style>
html, body{overflow-y:auto;}
</style>

<div class="content_div">
	<div class="content_left">
    	<div class="content_left_div">
        	<div class="notice_div">
            	<div class="notice_title">
                	<div class="notice_title_right">
                    	<div class="notice_title_left">
                        	<h2>公告<span><a href=""></a></span></h2>
                        </div>
                    </div>
                </div>
                <div class="notice_content" id="noticeContent"></div>
            </div>           
        </div>
    </div>
</div>
<div id="noticeDetail" style="display:none" class="notie_detail">
	<div class="title">
		<span id="detailTitle"></span>
	</div>
	<div class="time">
		发布日期：<span id="detailTime"></span>
	</div>
	<div id="detailContent" class="content">
			
	</div>
</div>
<script type="text/javascript" src="js/content.js" charset="utf-8"></script>
<script>
   $(function(){
		noticeIndex.queryNotices();
   });
</script>
<jsp:include page="/admin/main/foot.jsp"></jsp:include>