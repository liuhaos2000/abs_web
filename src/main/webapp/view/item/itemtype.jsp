<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/easyui/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/style/main.css">
<title>商品类型管理</title>
</head>
<body>
<table id="itemtype_list_dg" style="width:auto"></table>

<div id="itemtype_list_dg_toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddWin()">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openEditWin()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteMenu()">删除</a>
</div>

<div id="itemtype_save_dialog" class="easyui-dialog" title="商品类型管理" style="width:500px;height:280px;padding:10px;"
    buttons="#itemtype_save_dialog_buttons" data-options=" 
        modal:true,
        closed:true,
        iconCls:'icon-save'">

    <div class="ftitle">请输入类型信息</div>
    <form id="itemtype_info_form" method="post">
        <div class="fitem">
            <label>类型名称:</label>
            <input type="text" id="name" name="name" />
        </div>
        <div class="fitem">
            <label>序号:</label>
            <input type="text" id="typeOrder" name="typeOrder" />
        </div>
        <div class="fitem" id="p_row">
            <label>父菜单:</label>
            <input type="text" id="parentName" readonly="readonly" />
        </div>

        <input type="hidden" id="parentId" name="parentId" />        
        <input type="hidden" id="typeId" name="typeId" />

        <p class="ftips">提示：如果添加子类型，请先在列表中选择父类型；否则将添加为顶级类型。</p>
    </form>
</div>

<div id="itemtype_save_dialog_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#itemtype_save_dialog').dialog('close');">取消</a>
</div>

<script type="text/javascript">
var UrlConfig = {
    itemTypeAdd: '<%=request.getContextPath() %>/app/admin/item/itemtype/add',
    itemTypeUpdate: '<%=request.getContextPath() %>/app/admin/item/itemtype/update',
    itemTypeDelete: '<%=request.getContextPath() %>/app/admin/item/itemtype/delete',
    itemTypeList: '<%=request.getContextPath() %>/app/admin/item/itemtype/list'
};

$(function() {
    $('#itemtype_list_dg').treegrid({
        rownumbers:true,
        singleSelect:true,
        toolbar:'#itemtype_list_dg_toolbar',
        url: UrlConfig.itemTypeList,
        idField:'typeId',
        treeField:'name',
        fit: true,
        fitColumns: true,
        columns: [[
            {title:'类型名字', field:'name'},
            {title:'序号', field:'typeOrder', width:300}
        ]]
    });
});

var url = '';

function openAddWin() {
    $('#itemtype_info_form').form('clear');
    $('#p_row').show();
    var row = $('#itemtype_list_dg').treegrid('getSelected');
    
    if (row) {
        $('#parentName').val(row.name);
        $('#parentId').val(row.typeId);
    }
    
    $('#itemtype_save_dialog').dialog('open');
    url = UrlConfig.itemTypeAdd;
}

function openEditWin() {
    $('#itemtype_info_form').form('clear');
    $('#p_row').hide();
    var row = $('#itemtype_list_dg').treegrid('getSelected');
    
    if (row) {
        $('#itemtype_info_form').form('load', row);
        $('#itemtype_save_dialog').dialog('open');
        url = UrlConfig.SysMenuUpdate;
    } else {
        alert('请选择要修改的商品类型');
    }
    
}

function save() {
    $('#itemtype_info_form').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            result = eval('(' + result + ')');
            if (result.successful) {
                $('#itemtype_save_dialog').dialog('close');      // close the dialog
                $('#itemtype_list_dg').treegrid('reload');       // reload the user data
                $.messager.show({ title: '操作结果', msg: '操作成功' });
            } else {
                $.messager.show({ title: '操作结果', msg: result.msg });
            }
        }
    });
}

function deleteMenu() {
    var row = $('#itemtype_list_dg').treegrid('getSelected');
    if (! row) {
        alert('请选择要删除的行，只能删除叶子节点');
        return;
    } 
    
    if (row.children != null && row.children.length > 0) {
        alert("只能删除叶子节点");
        return;
    }
    
    $.messager.confirm('Confirm','请确认是否删除该商品类型?',function(r){
        if (r) {
            $.post(UrlConfig.itemTypeDelete, {typeId:row.typeId}, function(){
                $.messager.show({ title: '操作结果', msg: '操作成功' });
                $('#itemtype_list_dg').treegrid('reload');
            }, 'json');
        }
    });
}

</script>
</body>
</html>