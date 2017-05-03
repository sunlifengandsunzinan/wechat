<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
    <%
    String type=request.getParameter("type");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>填写供求信息</title>
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

<script language="javascript">

$(document).ready(function(){

	//解决ie访问，ajax从缓存中读取数据的问题
	$.ajaxSetup({cache:false});
	
	loadProv();
	dataload();
});
function dataload(){
$.post("<%=path%>/supplyDemandManager/intFirCategory",
		   function(data){

	      $("#selFirCategory").append(data);
		   });
}

$(function(){  
	   $( '#cc' ).combotree ({
		   url:"<%=path%>/supplyDemandManager/areaTree?areaId=0",  
		   onBeforeExpand:function(node) {
		         $('#cc').combotree("tree").tree("options").url = "<%=path%>/supplyDemandManager/areaTree?areaId=" + node.id;
		   }
		      }); 

}); 
function loadProv(){
	$.post("<%=path%>/register/intProCity",
			   function(data){

		      $("#selProvince").append(data);
			   });
	}

function selectProv(id){
	$("#selSecCategory").empty();
	$.post("<%=path%>/supplyDemandManager/queryFirSecCategory",{firCategoryId:id},
			   function(data){
		      $("#selSecCategory").append(data);
		  	var checkCity=$("#selSecCategory").val();

			
			   });
	
}

$(function(){

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
		$('#seccategory').val(rtrim(b));
	});
		 $('#openDialogDiv').dialog('close');
	}
	 function rtrim(str){  //删除右边的逗号
		   return str.replace(/,$/gi,"");
		 }
	function doAddSupplyDemand(){
		
		var province = $("#selProvince").val();
		var city = $("#selCity").val();
		$('#province').val(province);
		$('#city').val(city);
		var company = $('#company').val();
		var username = $('#username').val();
		var phone = $('#phone').val();
		var seccategory = $("#selSecCategory").val();
		var seccategoryid=$("#selSecCategory").find("option:checked").attr("id");
		$('#seccategory').val(seccategory);
		$('#seccategoryid').val(seccategoryid);
		var txt =  $('#txt').val();
		if(company == ""){
			$.messager.alert('提示','请填写产品名称','info');
		}else if(city ==""){
			$.messager.alert('提示','请选择配送城市','info');
		}else if(txt == ""){
			$.messager.alert('提示','请选择图片','info');
		}else if(seccategory==""){
			$.messager.alert('提示','请选择品类','info');
		}else{
	   	 var url = "<%=path%>/supplyDemandManager/doAddSupplyDemand?type="+<%=type%>;
			$('#fm_doAddSupplyDemand').form('submit', {
				url : url,
				onSubmit: function(){    
			        return true;
			    },  
				success : function(data) {
					var id = data;
			    	if ($("#fileToUpload").val().length > 0) {

			    		 ajaxFileUpload(id);
			    		 
			    		 $.messager.alert('提示','保存成功！','info',function () {
			    			 window.location=("<%=path%>/register/registerStepThree");
			    	        });
			    		
			        }
			    	/*
			        else {
			            $.messager.alert('提示','请选择图片.','info');
			        }
					*/
				}
			});
			}
		}
	function selectProvinve(){
		$("#selCity").empty();
		var checkValue=$("#selProvince").val();
		$.post("<%=path%>/register/queryProCity",{provinceName:checkValue},
				   function(data){
			      $("#selCity").append(data);
			  	var checkCity=$("#selCity").val();
				if(checkValue==checkCity){
					$("#selCity").hide();
				}else{
					$("#selCity").prepend("<option value='0'>全省</option>");
					 $("#selCity ").get(0).selectedIndex=0;
					$("#selCity").show();
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
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;" >
  <tr>

    <td width="10"></td>
    <td width="904" height="300" align="left" valign="top"><table width="904" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="902" height="500" align="center" valign="top" bgcolor="#f6f6f6"><table width="902" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="902" height="40" align="left" valign="middle" background="../images/hy_03.jpg" class="STYLE4">创建供应</td>
          </tr>
        </table>
        <form id="fm_doAddSupplyDemand" name="fm_doAddSupplyDemand" action="<%=path%>/supplyDemandManager/doAddSupplyDemand" method="post">   
          <table width="902" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="902" height="550" align="center" valign="middle"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="800" height="500" align="center" valign="top"><table width="800" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="80" height="50" align="right" valign="middle">产品名称：</td>
                        <td colspan="2" align="left"><input id="company" name="company" type="text" data-options="required:true" style="width:410px; height:25px; line-height:25px; padding-left:5px;" /></td>
                        <td align="left" style="padding-left:10px;">* 请详填写产品名称</td>
                      </tr>
                      <tr>
                        <td height="50" align="right" valign="middle">配送城市：</td>
                        <td width="120" align="left"><select id="selProvince" name="selProvince" onchange="selectProvinve()" style="width:190px; height:32px;line-height:25px; padding-left:5px;" name="select4" id="select4">
						<option value="">--请选择省份--</option>
                        </select></td>
                         <td width="120" align="left"><select  id="selCity" name="selCity" style="width:190px; height:32px;" name="select4" id="select4">
						<option value="">--请选择地市--</option>
                        </select></td>
                        <td colspan="2" align="left" style="padding-left:10px;">* 请填写产品所覆盖配送区域</td>
                      </tr>
                        <tr style="display:none;">
                        <td height="50" align="right" valign="middle">已选择的省份：</td>
                        <td width="240" align="left"><input id="province" name="province" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" /></td>
                      </tr>
                        <tr style="display:none;">
                        <td height="50" align="right" valign="middle">已选择的城市：</td>
                        <td width="240" align="left"><input id="city" name="city" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" /></td>
                      </tr>
                      <tr>
                        <td height="50" align="right" valign="middle">联 系 人：</td>
                        <td align="left"><input type="text" name="username" id="username" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /></td>
                        <td colspan="2" align="left" style="padding-left:10px;">* 请填写产品相关联系人姓名</td>
                      </tr>
                      <tr>
                        <td height="50" align="right" valign="middle">联系电话：</td>
                        <td align="left"><input type="text" name="phone" id="phone" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /></td>
                        <td width="170" align="left" style="padding-left:10px;">* 请填写联系人联系方式</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                       <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="80" height="50" align="right" valign="middle">产品图片：</td>
                          <td width="240" align="left" valign="middle"><input type="text" name="txt" id="txt" style="width:230px; height:25px; line-height:25px; padding-left:5px;" /></td>
                          <td align="left" valign="middle" style="padding-left:10px;">
                          <a href="JavaScript:void(0)" onmousemove="fileToUpload.style.pixelLeft=event.x-60;fileToUpload.style.pixelTop=this.offsetTop;" onclick="fileToUpload.click()"><img src="../images/an03.jpg" width="68" height="25" border="0" /></a>
                          <input type="file" id="fileToUpload" name="fileToUpload" onchange="txt.value=this.value" style="position:absolute;filter:alpha(opacity=0);-moz-opacity:0;display:none;" size="1" hidefocus />
                          </td>
                        </tr>
                      </table>
                    <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="80" height="50" align="right" valign="middle">产品品类：</td>
 						  <td width="200" align="left"><select id="selFirCategory" name="selFirCategory" onchange="selectProv(this.options[this.selectedIndex].id)" style="width:190px; height:32px;line-height:25px; padding-left:5px;" name="select4" id="select4">
						<option value="">--请选择一级品类--</option>
                        </select></td>
                          <td width="477" align="left" valign="middle" style="padding-left:10px;"><select id="selSecCategory" name="selSecCategory" style="width:190px; height:32px;" name="select4" id="select4">
						<option value="">--请选择二级品类--</option>
                        </select></td>
                             
                        </tr>
                        <tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">二级品类名称 : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="seccategory" name="seccategory" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" />
						</td>
					</tr>
                        <tr style="display:none;">
						<td width="30%" height="30" align="right" valign="middle">二级品类ID : &nbsp;</td>
						<td width="68%" height="30" align="left" valign="middle">
							<input id="seccategoryid" name="seccategoryid" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" />
						</td>
					</tr>
                      </table>
                    <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="80" height="150" align="right" valign="top" style="padding-top:15px;">产品描述：</td>
                          <td width="720" align="left" valign="top" style="padding-top:10px;"><label>
                            <textarea name="desc" id=""desc"" cols="45" rows="5" style="width:650px; height:130px;"></textarea>
                          </label></td>
                        </tr>
                      </table>
                    <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="800" height="32" align="center" valign="middle"><a href="javascript:void(0);" onclick="doAddSupplyDemand();"><img src="../images/an05.jpg" width="123" height="32" /></a></td>
                        </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
          </table>
          </form>
          </td>
      </tr>
      
    </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="1874" height="10"></td>
  </tr>
</table>

<div id="openDialogDiv" class="easyui-window" closed="true" modal="true" title="标题" style="width:500px;height:350px;">
    <iframe scrolling="auto" id='openDialogIframe' frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
    </div>	

</body>
</html>
