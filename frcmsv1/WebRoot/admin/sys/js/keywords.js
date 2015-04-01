
var KeyWorkds={
    init:function(){

    },
    getSelectedRow:function(){
        var row=$('#searchList').datagrid('getSelected');
        return row;
    },
    updateState:function(obj){//修改关键词状态
        var me=this;
        var state= $('select[name="state"]').val();
        var param={};
        param.id=obj;
        param.state=state;
        //alert(state);
        Service.async('tdgSearch','updateState',param,function(reply){
             if((reply || '')!=='' && (reply.RESULT || '')!==''){
                  var result=reply.RESULT;
                  if(result==='true'){
                      me.reloadList();
                      $.messager.alert('系统提示','操作操作成功!','info');
                  }else $.messager.alert('系统提示','操作失败,请稍候再试!','info');
             }else $.messager.alert('系统提示','操作失败,请稍候再试!','info');
        })
    },
    queryInfo:function(obj){
        var me=this;
        var param={};
        param.id=obj
        Service.async('tdgSearch','getKeyWordById',param,function(reply){
             if((reply || '')!=='' && (reply.RESULT || '')!==''){
                 var result=reply.RESULT;
                 me.setValues(result);
             }
        })
    },
    setValues:function(obj){
        $('input[name="search_name"]').val(obj.search_name);
        $('input[name="search_count"]').val(obj.search_count);
        $('select[name="state"]').val(obj.state);
    },
    cancelClick:function(){
        $('#keyWords').window("close");
    },
    reloadList:function(){
        $('#searchList').datagrid('reload');
    }
}

$(function(){
   $('#searchList').datagrid({
       url:'tdgSearch.getSearchWords',
       toolbar:[{
           text:'关键词',
           iconCls:'icon-save',
           handler:function(){
               var row=KeyWorkds.getSelectedRow();
               if(null==row){
                   $.messager.alert('系统提示','未选中任何数据!','info');
                   return;
               }
               $('#keyWords').show();
               $('#keyWords').window({
                   height:400,
                   width:450,
                   modal:true
               })

               KeyWorkds.queryInfo(row.id);
           }
       }]
   })

    $('#cancel').bind('click',function(){
        KeyWorkds.cancelClick();
    })

    $('#save').bind('click',function(){
        var row=KeyWorkds.getSelectedRow();
        KeyWorkds.updateState(row.id);
    })
})