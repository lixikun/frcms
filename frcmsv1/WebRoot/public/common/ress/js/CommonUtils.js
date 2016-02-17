var CommonUtils={
	invokeAction:function(action,param,callBack,isSync,v_contentType){
	    if(!isSync){
	    	isSync = true;
	    }	   
	    if(!v_contentType){
	    	v_contentType = "application/x-www-form-urlencoded"
	    }
		var callbackProxy=function(data){
			if(data){
				var _code = data._code;
				if(_code == 'SYS_ERR002'){					
					$.messager.alert("系统提示","你没有登录或登录超时，请登录后操作.","info",function(){
						if(parent.parent.parent.document){
							parent.parent.document.location.href=base+"/admin/login";
						}else if(parent.parent.document){
							parent.document.location.href=base+"/admin/login";
						}else if(parent.document){
							parent.document.location.href=base+"/admin/login";
						}else{
							document.location.href=base+"/admin/login";
						}
						
					})
					return false;
				}
			}
			callBack&&callBack(data);
		}
		$.ajax({
			type:"post",//设置提交方式
			url:action,//提交URL
			async:isSync,//设置调用方式，采用同步调用，异步会产生数据框为空的问题
			contentType:v_contentType,
			data:param,//请求参数
			//调用失败回调函数
			error:function(XMLHttpRequest, textStatus, errorThrown) {
				alert("服务调用失败" + "\n" + errorThrown);
	        },
			//调用成功的回调函数
			success:function(json) {
	        	callbackProxy(json);
			}
		});
	},
	invokeSyncAction:function(action,param,callBack){
		CommonUtils.invokeAction(action,param,callBack,false);
	},
	invokeAsyncAction:function(action,param,callBack){
		CommonUtils.invokeAction(action,param,callBack,true);
	},
	invokeSyncJsonAction:function(action,param,callBack){
		var tParam = JSON.stringify($.toJSON(param));
		CommonUtils.invokeAction(action,tParam,callBack,false,"application/json");
	},
	invokeAsyncJsonAction:function(action,param,callBack){
		var tParam = JSON.stringify(param);
		//alert(tParam);
		CommonUtils.invokeAction(action,tParam,callBack,true,"application/json");
	},
	dumpObject:function(arr,level) {
	    var dumped_text = "";
	    if(!level) level = 0;
	     
	    //The padding given at the beginning of the line.
	    var level_padding = "";
	    for(var j=0;j<level+1;j++) level_padding += "    ";
	     
	    if(typeof(arr) == 'object') { //Array/Hashes/Objects 
	        for(var item in arr) {
	            var value = arr[item];
	             
	            if(typeof(value) == 'object') { //If it is an array,
	                dumped_text += level_padding + "'" + item + "' ...\n";
	                dumped_text += CommonUtils.dumpObject(value,level+1);
	            } else {
	                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
	            }
	        }
	    } else { //Stings/Chars/Numbers etc.
	        dumped_text = "===>"+arr+"<===("+typeof(arr)+")";
	    }
	    return dumped_text;
	},
	getByteLen: function(str) {//获取字符串长度
		var l = str.length;
		var n = l;
		for (var i = 0; i < l; i++) {
			if (str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255) {
				n++;
			}
		}
		return n;
	},		
	isEmpty: function(obj) {
		var me = this;
		if (null == obj || "undefined" == obj) {
			return true;
		} else {
			var objType = typeof obj;
			//字符串
			if ('string' === objType && me.getByteLen(obj) == 0) {
				return true;
			}
			//数组
			if ($.isArray(obj) && obj.length == 0) {
				return true;
			}
			return false;
		}
	},	
	validPhoneNum: function(num) {//验证手机号码--11位数字
		var regNum = /^([0-9]{11})?$/;
		var flag = num.search(regNum);
		if (flag == -1) {
			return false;
		} else {
			return true;
		}
	},
	validNum: function(num) {//验证是否是数字
		if (num.replace(/[\d+]/ig, "").length > 0) {
			return false;
		} else {
			return true;
		}
	},
	/**
	 * 设置对象值
	 * @param {} obj
	 * @param {} id
	 * @param {} val
	 */
	setObjVal: function(obj, id, val) {
		var me = this;
		if (me.isEmpty(obj) || me.isEmpty(id)) return;
		if (!obj.hasOwnProperty(id)) {
			obj[id] = val;
		} else {
			obj[id] = obj[id] + "," + val;
		}
	},
	/**
	 * 获取输入域值
	 * @param {} divId
	 * @return {}
	 */
	getInputDomain: function(divId) {
		
		var me = this;
		var iv = {};
		
		//checkbox
		$("#" + divId).find("input[type='checkbox']:checked").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("name");
			//真值
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			//显示值
			var cname = $obj.attr("cname");
			if (!me.isEmpty(cname)) {
				me.setObjVal(iv, ivId + "_cname", cname);
			}
		});	
		
		//text
		$("#" + divId).find("input[type='text']").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			
			//显示值
			var cname = $obj.attr("cname");
			if (!me.isEmpty(cname)) {
				me.setObjVal(iv, ivId + "_cname", cname);
			}
			var lastcname = $obj.attr("lastcname");
			if (!me.isEmpty(lastcname)) {
				me.setObjVal(iv, ivId + "_lastcname", lastcname);
			}
			var oid = $obj.attr("oid");
			if (!me.isEmpty(oid)) {
				me.setObjVal(iv, ivId + "_oid", oid);
			}
		});	
		//password
		$("#" + divId).find("input[type='password']").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			
			//显示值
			var cname = $obj.attr("cname");
			if (!me.isEmpty(cname)) {
				me.setObjVal(iv, ivId + "_cname", cname);
			}
			var lastcname = $obj.attr("lastcname");
			if (!me.isEmpty(lastcname)) {
				me.setObjVal(iv, ivId + "_lastcname", lastcname);
			}
			var oid = $obj.attr("oid");
			if (!me.isEmpty(oid)) {
				me.setObjVal(iv, ivId + "_oid", oid);
			}
		});	
		
		//hidden
		$("#" + divId).find("input[type='hidden']").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			
			//显示值
			var cname = $obj.attr("cname");
			if (!me.isEmpty(cname)) {
				me.setObjVal(iv, ivId + "_cname", cname);
			}
			var lastcname = $obj.attr("lastcname");
			if (!me.isEmpty(lastcname)) {
				me.setObjVal(iv, ivId + "_lastcname", lastcname);
			}
			var oid = $obj.attr("oid");
			if (!me.isEmpty(oid)) {
				me.setObjVal(iv, ivId + "_oid", oid);
			}
		});	
		
		//select
		$("#" + divId).find("select").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			//真值
			var ivVal = $obj.find("option[selected='selected']").val();
			me.setObjVal(iv, ivId, ivVal);
			//显示值
			var ivValDesc = $obj.find("option[selected='selected']").text();
			me.setObjVal(iv, ivId + "_cname", ivValDesc);
		});	
		
		//textarea
		$("#" + divId).find("textarea").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			//真值
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			
			//显示值
			var cname = $obj.attr("cname");
			if (!me.isEmpty(cname)) {
				me.setObjVal(iv, ivId + "_cname", cname);
			}
			var lastcname = $obj.attr("lastcname");
			if (!me.isEmpty(lastcname)) {
				me.setObjVal(iv, ivId + "_lastcname", lastcname);
			}
			var oid = $obj.attr("oid");
			if (!me.isEmpty(oid)) {
				me.setObjVal(iv, ivId + "_oid", oid);
			}
			
		});		
		
		//radio
		$("#" + divId).find("input[type='radio']:checked").each(function() {
			var $obj = $(this);
			var ivId = $obj.attr("id");
			//真值
			var ivVal = $obj.val();
			me.setObjVal(iv, ivId, ivVal);
			//显示值
			var ivValDesc = $obj.next("span").text();
			me.setObjVal(iv, ivId + "_cname", ivValDesc);
			
		});		
		
		return iv;
	},
	loadFilter:function(data){
		//alert(CommonUtils.dumpObject(data,10))
    	if (data.ret){
			return data.ret;
		} else if(data._code){
			var _code = data._code;
			if(_code == 'SYS_ERR002'){
				$.messager.alert("系统提示","你没有登录或登录超时，请登录后操作.","info",function(){
					if(parent.parent.document){
						parent.parent.document.location.href="/admin/login";
					}else{
						document.location.href="/admin/login";
					}
				})
			} 
			return [];
		}else{
			return data;
		}
    },
    confirm:function(msg,callback){
    	$.messager.confirm("温馨提示", msg, function (r) {  
    		callback && callback(r);  
	    }); 
    },
    transformDate:function(d,type){
    	var retV ="";
    	if(d){
    		if(type == '1'){
    			retV = d.substring(0,10);
    		}else {
    			retV = d.substring(0,10)+" "+d.substring(11);
    		}
    	}
    	return retV;
    },
    formatState:function(value,row){
		//alert(CommonUtils.dumpObject(row));
		var retVal = value;
		if(value == "0"){
			retVal="无效";
		}else if (value == "1"){
			retVal = "有效";
		}
		return retVal;
	},
	getUrlVal: function (paramName) {
        var url = unescape(window.location.href);
        var allargs = url.split("?")[1];
        if (allargs == undefined) return '';
        var args = allargs.split("&");
        var obj = {};
        for (var i = 0; i < args.length; i++) {
            var arg = args[i].split("=");
            if (arg[1].indexOf('#') != -1) {
                arg[1] = arg[1].substring(0, arg[1].indexOf('#'));
            }
            eval('obj.' + arg[0] + '="' + arg[1] + '";');
        }
        if (eval('obj.' + paramName) == undefined) {
            return '';
        }
        else {
            return eval('obj.' + paramName);
        }
    },
    uploadFile:function(serverUrl,vFileElementId,params,callback){
    	jQuery.ajaxFileUpload({
			url:serverUrl,
			fileElementId:vFileElementId,
			dataType: 'json',						
			data:params,
			success: function (json){	
				callback&callback(json);
			},
			error:function(data, status, e){
				alert(e);
			}
		})
    },
    myHTMLEnCode:function(str) {
        var s = "";
        if (str.length == 0) return "";
        s = str.replace(/&/g, "&amp;");
        s = s.replace(/</g, "&lt;");
        s = s.replace(/>/g, "&gt;");
        s = s.replace(/ /g, "&nbsp;");
        s = s.replace(/\'/g, "&#39;");
        s = s.replace(/\"/g, "&quot;");
        //s = s.replace(/\n/g, "<br>");
        return s;
    },
    myHTMLDeCode:function(str) {
        var s = "";
        if (str.length == 0) return "";
        s = str.replace(/&amp;/g, "&");
        s = s.replace(/&lt;/g, "<");
        s = s.replace(/&gt;/g, ">");
        //s = s.replace(/&nbsp;/g, " ");
        s = s.replace(/&#39;/g, "\'");
        s = s.replace(/&quot;/g, "\"");
        s = s.replace(/<br>/g, "\n");
        return s;
    }
}

//经常用的是通过遍历,重构数组.  
Array.prototype.remove=function(dx){  
	
    if(isNaN(dx)||dx>this.length){return false;}  
    for(var i=0,n=0;i<this.length;i++)  
    {  
        if(this[i]!=this[dx])  
        {  
            this[n++]=this[i]  
        }  
    }  
    this.length-=1  
}
   
//在数组中获取指定值的元素索引  
Array.prototype.getIndexByValue= function(value){ 
	
    var index = -1;  
    for (var i = 0; i < this.length; i++)  
    {  
        if (this[i] == value)  
        {  
            index = i;  
            break;  
        }  
    }  
    return index;  
}  
