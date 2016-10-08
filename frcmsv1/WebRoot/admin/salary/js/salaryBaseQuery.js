var importFlag = false;
var SalaryMan = {    
    search: function () {      
        var salary_schedule_start = $('input[name="s_salary_schedule_start"]').val();
        var salary_schedule_end = $('input[name="s_salary_schedule_end"]').val();
        $('#salaryList').datagrid({
        	queryParams: {'busSalary.salary_schedule_start':salary_schedule_start,'busSalary.salary_schedule_end':salary_schedule_end}
        })
    }, 
    refresh: function () {
        $('#salaryList').datagrid('reload');
    },
    getSelect: function () {
        var row = $('#salaryList').datagrid('getSelected');
        return row;
    },    
    loadFilter :function(data){
    	if (data.ret){
			return data.ret;
		} else {
			return data;
		}
    },
   printSalary:function(){
	   
       var data = $('#salaryList').datagrid("getSelections");
       var ids = '';
       $.each(data, function (i, value) {
    	   var id = value.salary_id;
    	   if(id !='-1'){
    		   ids += id;
               ids += ','; 
    	   }           
       })
       
       if(ids=='' || $.trim(ids) == ''){
    	   $.messager.alert('系统提示',"请选择要打印的记录。", 'info');
    	   return;
       }
      
       $.messager.confirm('提示','确定要打印选择的记录?',function(r){
    	  if(r){    		  
		    var form = $('<form></form>');
	        form.attr('action', base+"/SalaryBase/SalaryBase!printSarary.do");
	        form.attr('method', 'post');
	        form.attr('target', '_blank');

	        var kldm_input = $('<input type="text" name="ids" />');
	        kldm_input.attr('value', ids);
	        form.append(kldm_input);


	        form.submit();
    	  } 
       });       
   }
}

$(function () {	
    $('#salaryList').datagrid({
        url:base+'/SalaryBase/SalaryBase!qrySalaryByMan.do',
        loadFilter:function(data){			
			return CommonUtils.loadFilter(data);
		},
		frozenColumns:[[    
		      {field:'bank_account',title:'银行账号'},    
		      {field:'user_name',title:'姓名'},
		      {field:'user_code',title:'人员编号'},
		      {field:'salary_schedule',title:'发放时间',formatter:function(value, row, index){
		    	    if (value.indexOf("-")>0) {
		    	    	var dateStr = value.split("-")
		    	        return dateStr[0]+'年' + dateStr[1] + '月';
		    	    }
		    	    else {
		    	        return value;
		    	    }
		    	}}
		]],
		columns:[[    
		          {field:'extend_info',title:'工资详情',width:2400,align:'left'}
		      ]] ,
        toolbar: [            
            {
                text: '导出',
                iconCls: 'icon-redo',
                handler: function () {     
	            	var user_code = $('input[name="s_user_code"]').val();
	                var salary_schedule_start = $('input[name="s_salary_schedule_start"]').val();
	                var salary_schedule_end = $('input[name="s_salary_schedule_end"]').val();
	                var user_name = $('input[name="s_user_name"]').val();
	                //var salary_type = $('input[name="s_salary_type"]').val();
	                var batch_id = $('input[name="s_batch_id"]').val();
	                var org_name = $('input[name="s_org_name"]').val();
	                
            	    var strParam = "";
            	    strParam += "busSalary.salary_schedule_start="+salary_schedule_start;
            	    strParam += "&busSalary.salary_schedule_end="+salary_schedule_end;   
            	    //strParam += "&busSalary.user_code="+user_code;  
            	    //strParam += "&busSalary.user_name="+encodeURI(encodeURI(user_name));  
            	    //strParam += "&busSalary.org_name="+encodeURI(encodeURI(org_name));  
            	   
            	    var url = base+"/SalaryBase/SalaryBase!eportSarary.do?"+strParam;
            	    //alert(url);
            	    if(parent.parent.document){
						parent.document.location.href=url;
					}else if(parent.document){
						parent.document.location.href=url;
					}else{
						document.location.href=url;
					}                 
                }
            },
            '-',
            {
                text: '打印',
                iconCls: 'icon-print',
                handler: function () {                    
            		SalaryMan.printSalary();                    
                }
            }           
        ]
    })

    $('#search_btn').bind('click', function () {
    	SalaryMan.search();
    	//$("[field='user_name']").hide();
    })
    
})