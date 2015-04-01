<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>问卷调查</title>

    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-3.2.0/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/public/common/ress/css/jq/jquery.loadmask.css">
	<link rel="stylesheet" type="text/css" href="/ballot/css/index.css">
	<link href="/public/iCheck/skins/all.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/public/bootstrap-3.2.0/html5shiv.min.js"></script>
      <script src="/public/bootstrap-3.2.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="container" style="width:900px">
		<s:if test="(ballotList!=null) && (!ballotList.isEmpty())">
		    <s:set id="ballot0" value="ballotList[0]" />
			<%--右侧  主界面加载 --%>
		    <div id="detail" class="index_support floatright"  style="font-size: 12px">
		    	<div class="row" >
		    		<div class="span12">		    			
		    			<img class="img-rounded" alt="140x140" src="/ballot/image/banner2.jpg" style="width:900px;" />
							<h3 style="text-align: center;">
								<s:property value="#ballot0.title"/>
							</h3>
						
					</div>
		    	</div>	
				<div class="row">
						<form method="post" name="frmVote" id="frmVote">	
						   							
							<div >							
								<h4><s:property value="#ballot0.content"/></h4>
							</div>
							<input name="ballot_id" type="hidden" value="<s:property value="#ballot0.ballot_id"/>" />
							<input name="ANSWER_ARR" id="ANSWER_ARR" type="hidden" value="" />									
							<div>														
									<s:iterator  value="questionList"  id="singleQuestion" status="st">	
										<s:set var="answerList" value="#singleQuestion.answerList" />
											
											<div class="page-header" style="margin-top:15px;margin-bottom:5px">											
												<s:property value="%{#st.index+1+getText('、')}" />
												<s:property value="#singleQuestion.question_content" escape="false"/>
												<s:if test="#singleQuestion.is_must ==1" ><span style="color:red">*</span></s:if>	
											</div>
											<div class="span4">
											<s:if test="#st.index == 0 ">
												<s:set var="ARRQID" value="#singleQuestion.question_id" />
											</s:if>
											<s:else>
												<s:set var="ARRQID" value="#ARRQID+'|'+#singleQuestion.question_id" />
											</s:else>																		
											<%--查询问卷调查表问题下的答案 --%>
											<s:if test="#singleQuestion.answer_type==0">												
													<li >
														<textarea name='ANSWER_<s:property value="#singleQuestion.question_id" />' id='ANSWER_<s:property value="#singleQuestion.question_id" />' style="width: 99%" rows="2" value="" onblur="if(value==''){value='最多输入200个字符'};" onfocus="if(value=='最多输入200个字符'){value=''};" ismust="<s:property value="#singleQuestion.is_must" />">最多输入200个字符</textarea>
													</li>												
											</s:if>
											<s:if test="#singleQuestion.answer_type=='00'">
												<li class="span4">
													<input type="text"
														name='ANSWER_<s:property value="#singleQuestion.question_id" />'
														id='ANSWER_<s:property value="#singleQuestion.question_id" />' value="最多输入200个字符！" ismust="<s:property value="#singleQuestion.is_must" />"/>
												</li>
											</s:if>
											
											<s:iterator id="singleAnswer" value="#answerList" status="sta">	
											   						
												<s:if test="#singleQuestion.answer_type ==1">
													<li class="fli">														
														<input type="radio" class=noback
															id='ANSWER_<s:property value="#singleQuestion.question_id" />'
															name='ANSWER_<s:property value="#singleQuestion.question_id" />'
															value="<s:property value="#singleAnswer.answer_content" />"
															ANSWER_ID="<s:property value="#singleAnswer.answer_id" />"  ismust="<s:property value="#singleQuestion.is_must" />"/>
														<label
															for='ANSWER_<s:property value="#singleQuestion.question_id" />'>
															<s:property value="#singleAnswer.answer_content" />
														</label>														
													</li>
												</s:if>
												<s:if test="#singleQuestion.answer_type ==2">
													<li class="fli">
														<input type="checkbox"
															name='ANSWER_<s:property value="#singleQuestion.question_id" />'
															id='ANSWER_<s:property value="#singleQuestion.question_id" />'
															class=noback
															value="<s:property value="#singleAnswer.answer_content" />"
															ANSWER_ID="<s:property value="#singleAnswer.answer_id" />"  ismust="<s:property value="#singleQuestion.is_must" />"/>
														<label
															for='ANSWER_<s:property value="#singleQuestion.question_id" />'>
															<s:property value="#singleAnswer.answer_content" />
														</label>												
													</li>		
												</s:if>												
											</s:iterator>											
											<input type="hidden"
												id='answerNO_<s:property value="#singleQuestion.question_id" />'
												name='answerNO_<s:property value="#singleQuestion.question_id" />'
												value="" />	
											</div>
											<div style="clear:both"></div>		
										</s:iterator>
									<input type="hidden" id="questionNO" name="questionNO" value="<s:property value="#ARRQID" />">
									<%--标识是否为有奖问卷--%>
									<input type="hidden" id="hasPrize" name="hasPrize" value="<s:property value="#ballot0.has_prize" />"/>
								
									<s:if test="#ballot0.has_prize != null && #ballot0.has_prize== 'T'">
											<li>
												<span style="color: red;">非常感谢您的支持！请您完整填写下列联络信息，以便我们寄出幸运奖奖品。我们承诺对您的信息完全保密</span><br/>											
											</li>	
											<li>
												姓&nbsp;&nbsp;名：<input id="user_name" name="user_name" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;												
												联系电话：<input id="user_phone" name="user_phone" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
											</li>	
											<li>
												邮&nbsp;&nbsp;编：<input id="user_post" name="user_post" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
											</li>
											<li>
												地&nbsp;&nbsp;址：<input id="user_addr" name="user_addr" style="width: 450px;"/><span><font color="red">&nbsp;*</font></span>
											</li>	
										</s:if>
										<s:elseif test="#ballot0.has_prize != null &&  #ballot0.has_prize == 'H'">
											<li></li>													
											<li>
												手机号码：<input id="acc_nbr" name="acc_nbr" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;												
												联系电话：<input id="user_phone" name="user_phone" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
											</li>
											<li>
												<span style="color: red;">注：手机号码为话费奖励号码，仅限于云南电信手机</span><br/>											
											</li>		
										</s:elseif>
										<s:elseif test="#ballot0.has_prize != null && #ballot0.has_prize == 'K'">
											<li>											
												<span style="color: red;">非常感谢您的支持！请您完整填写下列信息，以便我们能为您的设备充值。</span><br/>
											</li>													
											<li>
												地市：<input id="area_code" name="area_code" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;												
												电信号码：<input id="user_phone" name="user_phone" style="width: 150px; padding: 2px 3px;"/><span><font color="red">&nbsp;*</font></span>
											</li>
											<li>
												<span style="color: red;">注：话费奖励仅限云南电信用户，设备号码可以为固定电话（号码前请加区号）、手机号、宽带接入号、宽带帐号。</span><br/>											
											</li>	
										</s:elseif>					
									<div class="p10 h40">
										验证码：
										<input id="valid_code" name="valid_code"
											style="width: 50px; padding: 2px 3px;" />
										<img id="check_img" src="/ballot/image.jsp"
											style="vertical-align: middle" />
										<a onclick="getValidateImg()" href="JavaScript:void(0)">换一张</a>
									</div>								
									<div class="p10 h40" style="text-align:center">
										<button type="button" onClick="fucExecVote('<s:property value="#ballot0.ballot_id"/>')"  id="subMit1" class="btn btn-primary">  投票  </button>
									</div>																	
							</form>
					</div>
					<%-- 结束  --%>	
			</div>
		</s:if>
		<s:else>
			未找到问卷调查信息.
		</s:else>
	</div>
	<script src="/public/jquery-1.11.1/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/public/common/ress/js/jquery.loadmask.min.js"></script>
    <%--<script src="/public/bootstrap-3.2.0/js/bootstrap.min.js"></script> --%>    
	<script type="text/javascript" src="/public/iCheck/icheck.min.js"></script>	
	<script type="text/javascript" src="/public/common/ress/js/CommonUtils.js"></script>
    <script language="javascript" type="text/javascript" src="/ballot/js/showBallotDetail.js"></script>
</body>
</html>
