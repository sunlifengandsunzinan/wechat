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
<title>商品管理</title>
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
	
	
	dataload();
});
function dataload(){
$.post("<%=path%>/supplyDemandManager/intFirCategory",
		   function(data){

	      $("#selFirCategory").append(data);
	      var s='${fircategoryid}';
	      if(s==""){
	    	  return;
	      }else{
	    	  $("#selFirCategory").find("option[id='${fircategoryid}']").attr("selected",true);
	    	  selectProv(s);
	    	  $("#selSecCategory").find("option[id='${seccategoryid}']").attr("selected",true);
	      }
	      
		   });
}

function alSelectCommodity(id){
	var text = $("#gg").text();

	if(text ==""){
		$("#gg").append("<span id='s"+id+"'>"+id+"</span>");
	}else{
		
		$("#gg").find("span").each(function(){

			if(("s"+id) == this.id){

				$("#s"+id).remove();
				return false;
			}else{

				$("#gg").append("<span id='s"+id+"'>"+id+"</span>");
			}

		});
	}
	
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

})

function doSearchByCategory(){
	var seccategoryname = $("#selSecCategory").val();
	var seccategoryid=$("#selSecCategory").find("option:checked").attr("id");
	var fircategoryname = $("#selFirCategory").val();
	var fircategoryid=$("#selFirCategory").find("option:checked").attr("id");
	$('#seccategoryname').val(seccategoryname);
	$('#seccategoryid').val(seccategoryid);
	$('#fircategoryname').val(fircategoryname);
	$('#fircategoryid').val(fircategoryid);

	if(fircategoryid==""){
		$.messager.alert('提示','请选择一级品类','info');
	}else if(seccategoryid==""){
		$.messager.alert('提示','请选择二级品类','info');
	}else{
	 	var oForm = document.getElementById("fm_doSearchCommodityByCategory"); 
		 oForm.submit(); 
		
	}
		
}


function test(id){
	var input="<input type='text' id='div"+id+"' value='"+id+"' />";
	
	if($("#div"+id).length > 0){
		//alert("存在");
		$("#div"+id).remove();
		
	}else{
		//alert("不存在");
		$("#div_selectId").append(input);
	}
	
	//找到div下所有的input，并且将他们的值写入test
	var test_value = "";
	$("#div_selectId > input").each(function(){
        //alert($(this).attr("id"));  //打印子div的ID
        
        test_value +=$(this).val();
        
	});
	
	$("#test").val(test_value);
	
}






</script>
</head>
<body >
   <form id="fm_doSearchCommodityByCategory" name="fm_doSearchCommodityByCategory" action="<%=path%>/supplyCommodityManager/addSupplyCommodity" method="post">  
   <input style="display:none;" id="seccategoryname" name="seccategoryname" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" />
   <input style="display:none;" id="seccategoryid" name="seccategoryid" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" value ="${seccategoryid}"/>
   <input style="display:none;" id="fircategoryname" name="fircategoryname" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" />
    <input style="display:none;" id="fircategoryid" name="fircategoryid" class="easyui-validatebox textbox" data-options="required:true" style="width: 180px; height: 20px;" value ="${fircategoryid}"/>
    </form>
<table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;" >
  <tr>

    <td width="10"></td>
    <td width="904" height="300" align="left" valign="top"><table width="904" border="0" cellpadding="0" cellspacing="1" bgcolor="#dedede">
      <tr>
        <td width="902" height="500" align="center" valign="top" bgcolor="#f6f6f6"><table width="902" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="902" height="40" align="left" valign="middle" background="../images/hy_03.jpg" class="STYLE4">新增商品</td>
          </tr>
        </table>
     
          <table width="902" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="902" height="550" align="center" valign="middle"><table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="800" height="500" align="center" valign="top"><table width="800" border="0" cellspacing="0" cellpadding="0">

                    <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="80" height="50" align="right" valign="middle">产品品类：</td>
 						  <td width="200" align="left"><select id="selFirCategory" name="selFirCategory" onchange="selectProv(this.options[this.selectedIndex].id)" style="width:190px; height:32px;line-height:25px; padding-left:5px;" name="select4" id="select4">
						<option value="">--请选择一级品类--</option>
                        </select></td>
                          <td width="377" align="left" valign="middle" style="padding-left:10px;"><select id="selSecCategory" name="selSecCategory" style="width:190px; height:32px;" name="select4" id="select4">
						<option value="">--请选择二级品类--</option>
                        </select></td>
                          <td width="100" align="left" valign="middle" style="padding-left:10px;">
                          <a href="javascript:void(0)" onclick="doSearchByCategory();"><img src="<%=path%>/images/an09.jpg" width="80" height="35" border="0" /></a>
                       </td>    
                        </tr>
               
                      </table>
                    <table width="800" border="0" cellspacing="0" cellpadding="0">
              <tr><table width="1098" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="39" height="50" align="center" valign="top" style="padding-top:15px;"><img src="<%=path%>/images/biao_02.jpg" width="13" height="16" /></td>
            <td width="71" align="center" valign="top" class="STYLE12" style="padding-top:15px;">搜索结果：</td>
            <td width="988" align="left" valign="top" class="STYLE12" style="padding-top:12px; padding-bottom:12px;"><table width="988" border="0" cellspacing="0" cellpadding="0">

 	<tr>
	 <c:forEach items="${list}" var="item" varStatus="status">  
	     

		      <td  style="display:none; align="center" valign="middle">${item["id"]==null?"&nbsp;":item["id"]}</td> 
		    <td width="82" height="25" align="center" valign="middle"><p ><a  class="link2" id='${item["id"]==null?"&nbsp;":item["id"]}' name= "activation" href="javascript:void(0)" onclick="alSelectCommodity(this.id);test(this.id);">${item["name"]==null?"&nbsp;":item["name"]}</a></p></td>  
		    
		   <c:if test="${status.count%12==0}">
		</tr>
		<tr>
		</c:if>
    </c:forEach>  
	</tr>

  <table  width="958" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dfdadc" id="xx">
                <tr>
                  <td  id="gg" width="958" height="30" bgcolor="#F9F8F8" style="padding-left:10px; padding-right:10px; padding-top:5px; padding-bottom:5px; line-height:20px;"></td>
                </tr>
              </table>
            </table>
</td>
          </tr>
          <tr>

            </tr>
        </table></td></tr>
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

<div id="div_selectId" style="display: none;" >



</div>
 
 <input id="test" value="" />
 
 
</body>
</html>
