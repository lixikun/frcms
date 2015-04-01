var tflag = '';
function fucExecVote(id){
				var hForm = document.getElementById("frmVote");
				var hControls = document.getElementsByName("questionNO");
				var iLoopNum	= 0;
				var iLoop		=	0;
				var vRetValue	=	'';
				var ARR_Q_ID;
				var Answer_Ctr;
				var jLoopNum = 0;
				var jLoop	=	0;
				var Answer_Ctrs;
				var vAnswer;
				var vAnswer1;
				var vAnswerID;
				var vAnswerCheckBox;

				var hasPrize = hForm.hasPrize.value;
				var arrAnswer = new Array();
				var strAnswer ='';
				
				arrNum = 0 ;
				//标题的个数赋值给iLoopNum
				if(hControls!=null) iLoopNum=hControls.length;
				vAnswerCheckBox = "";
				//按标题个数循环
				//alert("biaoti"+iLoopNum);
				for(iLoop=0;iLoop<iLoopNum;iLoop++){
					hControl    = hControls[iLoop];
					//获得问题ID 未分割
					vRetValue = hControl.value;
					//alert("vRetValue  "+vRetValue);
					if(vRetValue != "" && vRetValue != null){
					//分割问题ID 存入ARR_Q_ID
						ARR_Q_ID = vRetValue.split("|");
						
						//alert("wenti"+ARR_Q_ID.length);
						
						//按问题个数循环
						for(var i=0;i<ARR_Q_ID.length;i++){
							
							//vAnswerCheckBoxID = "";
							//获得每个问题结点
							Answer_Ctrs = document.getElementsByName("ANSWER_"+ARR_Q_ID[i]);
							//jLoopNum 问题结点中选项或文本的个数
							if(Answer_Ctrs!=null) jLoopNum=Answer_Ctrs.length;
							if(Answer_Ctrs==null ||Answer_Ctrs==''){
								alert("本问卷没有要调查的问题，请返回。");
								return;
							}
							//alert("jLoopNum="+jLoopNum);
							vAnswer = "";
							vAnswer1 = "";
							//按问题结点循环
							var isMust="0";
							for(jLoop=0;jLoop<jLoopNum;jLoop++){
								hAnswer_Ctr    = Answer_Ctrs[jLoop];	
								isMust = hAnswer_Ctr.attributes['ismust'].nodeValue;
								if(hAnswer_Ctr.tagName.toUpperCase()=="TEXTAREA"){
									vAnswer = hAnswer_Ctr.value;
									//vAnswerID = hAnswer_Ctr.attributes['ANSWER_ID'].nodeValue;
									//if(vAnswerID==''||vAnswerID==null) vAnswerID='undefined';
									vAnswerID='TestareaMessage';
									if(vAnswer=='最多输入200个字符'){
										vAnswer = '';
									}
									if(vAnswer.length>200){
										alert("第"+(i+1)+"个问题的内容不能超过200字!");
										return;
									}
								}
								if(hAnswer_Ctr.tagName=="INPUT"){
									if(hAnswer_Ctr.type.toUpperCase()=='RADIO'){
										if(hAnswer_Ctr.checked){
											vAnswer = hAnswer_Ctr.value;
											vAnswerID = hAnswer_Ctr.attributes['ANSWER_ID'].nodeValue;											
										}
									}
									if(hAnswer_Ctr.type.toUpperCase()=="TEXT"){
											vAnswer = hAnswer_Ctr.value;
											//vAnswerID = hAnswer_Ctr.attributes['ANSWER_ID'].nodeValue;
											//if(vAnswerID==''||vAnswerID==null) vAnswerID='undefined';
											vAnswerID='TestMessage';
										//	alert('TEXT');
									}
									if(hAnswer_Ctr.type.toUpperCase()=='CHECKBOX'){
										if(hAnswer_Ctr.checked){
											vAnswer1 = hAnswer_Ctr.value;
											vAnswerID = hAnswer_Ctr.attributes['ANSWER_ID'].nodeValue;
											//vAnswerCheckBox = vAnswerCheckBox + "/" + id + "/" + ARR_Q_ID[i] + "/" + hAnswer_Ctr.ANSWER_ID + "/" + hAnswer_Ctr.value;								
											if (vAnswerCheckBox==''){
									
												vAnswerCheckBox  = id + "/"+ARR_Q_ID[i] + "/" +  vAnswerID + "/" + hAnswer_Ctr.value;
									
												}
											else{
												vAnswerCheckBox  = vAnswerCheckBox + "/" + id + "/"+ARR_Q_ID[i] + "/" +  vAnswerID + "/" + hAnswer_Ctr.value;
											}
											//alert(vAnswer);
											//alert(vAnswerID);
											//alert(vAnswerCheckBox);
									}
								  }									
								}
								
							}//结束问题结点循环
														
							if(vAnswer1=='' || vAnswer1 == 'undefined' || vAnswer1 == null){							
								if(vAnswer=='' || vAnswer == 'undefined' || vAnswer == null){	
									if(isMust == '1'){
										alert("请完成问卷后再提交!第"+(i+1)+"个问题为空!");
										return;
									}else{
										continue;
									}
								}							
								if (strAnswer==''){									
									strAnswer  = id + "/"+ARR_Q_ID[i] + "/" + vAnswerID + "/" + vAnswer;									
								}
								else{
									strAnswer  = strAnswer + "/" + id + "/"+ARR_Q_ID[i] + "/" + vAnswerID + "/" + vAnswer;
								}					
							}else{
								if(vAnswer1=='' || vAnswer1 == 'undefined' || vAnswer1 == null){
									if(isMust == '1'){
										//alertWindow("","请完成问卷后再提交!","0");
										alert("请完成问卷后再提交!第"+(i+1)+"个问题为空!");
										return;    
									}
								}
								vAnswer1='';
							}
						}
					}	
				}
				var user_name =  '',user_phone = '',user_post = '',user_addr = '',acc_nbr = '',area_code = '';
				if(hasPrize != null && 'T' == hasPrize){
					user_name =  hForm.user_name.value;
					user_phone = hForm.user_phone.value;
					user_post = hForm.user_post.value;
					user_addr = hForm.user_addr.value;
					if('' == user_name || 'undefined' == user_name || '' == user_phone || 'undefined' == user_phone || '' == user_post || 'undefined' == user_post || '' == user_addr || 'undefined' == user_addr){
						alert('请完善您的个人信息');
						return ;
					}
				}else if(hasPrize != null && 'H' == hasPrize){
					user_phone = hForm.user_phone.value;
					acc_nbr = hForm.acc_nbr.value;
					if('' == acc_nbr || 'undefined' == acc_nbr || '' == user_phone || 'undefined' == user_phone){
						alert('请填写您的联系方式');
						return ;
					}
					var partten = /^1[3,4,5,8,7]\d{9}$/;
					var num = $.trim(acc_nbr);
					if(!partten.test(num)){
						partten = /^0\d{10,11}$/;
						if(!partten.test(num)){
							alert("您输入的常用电话格式不正确,固话请带区号!");
							return false;
						}
					}					
				}else if(hasPrize != null && 'K' == hasPrize){
					user_phone = hForm.user_phone.value;
					area_code = hForm.area_code.value;
					if('' == area_code || 'undefined' == area_code || '' == user_phone || 'undefined' == user_phone){
						alert('请填写您的联系方式');
						return ;
					}
				}
				
				if(vAnswerCheckBox!=null&&vAnswerCheckBox!=''){
						if(strAnswer==null||strAnswer==''){
								hForm.ANSWER_ARR.value = strAnswer + vAnswerCheckBox;							
							}
						else{
							hForm.ANSWER_ARR.value = strAnswer +'/'+ vAnswerCheckBox;					
						}					
					}
				else{
						hForm.ANSWER_ARR.value = strAnswer + vAnswerCheckBox;					
					}
				
				if(hasPrize != null && 'T' == hasPrize){
					hForm.ANSWER_ARR.value = hForm.ANSWER_ARR.value + "/" + id + "/" + "user_info" + "/" + "TestareaMessage" +
					"/" + "姓名：" + user_name + "; 联系方式：" + user_phone + ";邮编：" + user_post + ";地址：" + user_addr ;
				}else if(hasPrize != null && 'H' == hasPrize){
					hForm.ANSWER_ARR.value = hForm.ANSWER_ARR.value + "/" + id + "/" + "user_info" + "/" + "TestareaMessage" +
					"/" + "手机号码：" + acc_nbr + "; 联系电话：" + user_phone;
				}else if(hasPrize != null && 'K' == hasPrize){
					hForm.ANSWER_ARR.value = hForm.ANSWER_ARR.value + "/" + id + "/" + "user_info" + "/" + "TestareaMessage" +
					"/" + "地市：" + area_code + "; 联系电话：" + user_phone;
				}
				checkValid();
				
				if(tflag == "false"){
					return;
				}
				
				//隐藏提交问卷按钮
				var bt =document.getElementById("subMit1");
				
				bt.style.display="none"  ;		
				var param = {};
				param.ballotDetails = hForm.ANSWER_ARR.value;
				param.ballotId=id;
				CommonUtils.invokeAsyncAction('/Ballot/Ballot!insertBallotDetail.do', param, function (reply) {
			        	var code = reply._code;
			            var msg = reply._msg;
			            if (code == "0") {
			                alert('提交问卷成功，谢谢你的参与！');			               
			            } else {
			            	alert(msg);
			            }
			    });
			
}
			
function getValidateImg(){
	var key = document.getElementById("check_img");
	var time = new Date();
	key.setAttribute("src","/ballot/image.jsp?date="+ time);
}

function checkValid(){
    var valid_code = $("#valid_code").val();
    if(valid_code==''){
    	alert("请输入验证码！");
    	tflag="false";
    	return false;
    }
    if(!$("#frmVote").isMasked()){
		$("#frmVote").mask("随机验证码 验证中....");        
		$.ajax( 
	    	{
	    	async : false,
			type : "GET",
			url : "/public/checkValid.jsp",
			dataType : "xml",
			beforeSend : function() {
			},
			data:{
				validCode : valid_code
			},
			success : function randXml(responseXML) {
				var flag = $('flag', responseXML).text();
				if (flag == 1) {
					tflag="true";
					$("#valid_code").val('');
				} else{
					tflag="false";
					$("#valid_code").val('');
					getValidateImg();
					$("#frmVote").unmask();						
					alert('验证码错误！');
				}
			},
			complete : function() {
				$("#frmVote").unmask();
			},
			error : function() {
				tflag="false";
				$("#frmVote").unmask();
				alert('验证码错误！');
			}
		});
	}else{
		return false;
	}
}