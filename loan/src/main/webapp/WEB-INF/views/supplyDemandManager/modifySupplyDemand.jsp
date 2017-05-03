<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
    <%
    String id=request.getParameter("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改供求信息</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="<%=path%>/js/jquery.selectlayer.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css"/>
<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
<script language="javascript">

$(function(){  
	   $( '#cc' ).combotree ({
		   url:"<%=path%>/supplyDemandManager/areaTree?areaId=0",  
		   onBeforeExpand:function(node) {
		         $('#cc').combotree("tree").tree("options").url = "<%=path%>/supplyDemandManager/areaTree?areaId=" + node.id;
		   }
		      }); 

}); 

function doSelect(){
	$('#openDialogIframe')[0].src='selectCategory';
	$('#openDialogDiv').dialog({
	    title: '选择二级品类',
	    width: 800,
	    height: 600,
	    closed: false,
	    cache: false,
	    modal: true,
	    buttons : [ {
            text : '确定',
            iconCls : 'icon-save',
            id : 'sBtn',
            handler : function() {
                saveSecCategory();
            }
        }, {
            text : '取消',
            id : 'cBtn',
            handler : function() {
                $('#openDialogDiv').dialog('close');
            }
        } ]
	});
	}
	
	function saveSecCategory(){
		var data = $('#openDialogIframe').contents().find("#al");
		var a = "";
		var b ="";
	$(data).find("td").each(function(){
		a=a+$(this).attr("id")+",";
		b=b+$(this).text()+",";
		$('#seccategoryid').val(a);
		$('#seccategory').val(b);
	});
		 $('#openDialogDiv').dialog('close');
	}
	
	function doModifySupplyDemand(){
		var city = $("#cc").combotree("getText");
		$('#city').val(city);


	   	 var url = "<%=path%>/supplyDemandManager/doModifySupplyDemand?id=<%=id%>";
			$('#fm_doAddSupplyDemand').form('submit', {
				url : url,
				onSubmit: function(){    
			        return true;
			    },  
				success : function(data) {
					var id = data;
			    	if ($("#fileToUpload").val().length > 0) {

			    		 ajaxFileUpload(id);
			    		 
			    		 $.messager.alert('提示','修改成功！','info');
			    		 window.location=("<%=path%>/register/registerStepThree");
			        }
			        else {
			            $.messager.alert('提示','请选择图片.','info');
			        }

				}
			});

		}


function ajaxFileUpload(id) {
    $.ajaxFileUpload
    (
        {
            url: '<%=path%>/supplyDemandManager/saveSupplyDemandImg', //用于文件上传的服务器端请求地址
            data: {id: id},
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'fileToUpload', //文件上传域的ID
            dataType: 'text', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
            	//$.messager.alert('提示','上传成功！','info');
                if (typeof (data.error) != 'undefined') {
                    if (data.error != '') {
                        alert(data.error);
                    } else {
                        alert(data.msg);
                    }
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }
    );
    return false;
}

</script>

</head>
<body >
<div class="rightinfo" align="center" style="padding-top: 100px;">

		<div class="easyui-panel" title="修改供求信息"
			style="width: 600px; padding: 10px 60px 10px 60px;" align="center">
			<form id="fm_doModifySupplyDemand" name="fm_doModifySupplyDemand" action="<%=path%>/supplyDemandManager/doModifySupplyDemand?id=<%=id%>" method="post">   
				<table width="100%" border="0" cellspacing="0" cellpadding="0">		
	                <tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">供需单ID : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="id" name="id" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" ">
						</td>
					</tr>		
					<tr>
						<td height="30" align="right" valign="middle">名称 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="company" name="company" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" value ="${supplyDemandInfo.name}">
						</td>
					</tr>
						<tr>
						<td height="30" align="right" valign="middle">选择城市 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">				
						<input id="cc" class="easyui-combotree" required="true" onlyLeafCheck="true"  multiple="true" style="width: 204px;" value ="${supplyDemandInfo.area}">  
						</td>
						
					</tr>
	                <tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">已选择的城市 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="city" name="city" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" ">
						</td>
					</tr>						
						<tr>
						<td height="30" align="right" valign="middle">选择品类 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
						<input id="seccategory" name="seccategory" class="easyui-validatebox textbox" data-options="required:true" style="width: 100px; height: 20px;" value ="${supplyDemandInfo.category}">
						<a href="javascript:void(0);" class="easyui-linkbutton" onclick="doSelect();">打开</a>
							
						</td>
						
					</tr>
						<tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">二级品类ID : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="seccategoryid" name="seccategoryid" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" ">
						</td>
					</tr>

						

				</table>
			</form>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
						<td height="30" align="right" valign="middle">上传图片 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input type="file" id="fileToUpload" name="fileToUpload" />
						</td>
					</tr>
			</table>		
			<a href="javascript:void(0);" class="easyui-linkbutton" onclick="doModifySupplyDemand();" iconCls="icon-ok" style="height: 20px">保存</a>
			
		</div>


	</div>
<div id="openDialogDiv" class="easyui-window" closed="true" modal="true" title="标题" style="width:500px;height:350px;">
    <iframe scrolling="auto" id='openDialogIframe' frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
    </div>	
<div id="dd"></div>
</body>
</html>
