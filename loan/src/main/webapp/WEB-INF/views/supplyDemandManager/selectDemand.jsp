<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>需求单列表</title>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />
	<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />
<script language="javascript">

$(function (){
	
	var r=document.getElementsByName("activation");

		for(var i=0;i<r.length;i++){
			var s = r[i].id;
			$.post("<%=path%>/supplyDemandManager/doSelectSupplyCompany",{id:s},
					   function(data){
						$("#"+s).text(data);
					   });
		}

	
});

function doSearch(){
	 
 	var oForm = document.getElementById("fm_searchDemand"); 
	 oForm.submit(); 

}
</script>

</head>
<body >	

   <form  id="fm_searchDemand" action="<%=path %>/supplyDemandManager/doSearchDemand" name="fm_searchDemand" method="post">
   		供需单名称 : <input id="supplyname" name="supplyname" value="${supplyname }" class="easyui-validatebox textbox"  style="width: 180px; height: 20px;" />
   		公司名称 : <input id="company" name="company"  value="${company }" class="easyui-validatebox textbox"  style="width: 180px; height: 20px;" />
   		二级品类名称 : <input id="seccategoryname" name="seccategoryname" value="${seccategoryname }" class="easyui-validatebox textbox"  style="width: 180px; height: 20px;" />
   		地市 : <input id="city" name="city" value="${city }" class="easyui-validatebox textbox"  style="width: 180px; height: 20px;" />
   		</form>	
   		   		<a href="javascript:void(0);" class="easyui-linkbutton" onclick="doSearch();" iconCls="icon-ok" style="height: 20px">查询</a>
<div class="rightinfo">
  <table class="tablelist">
    <thead>
      <tr>
        <th style="text-align: center;" width="10%">供需单图片</th>
        <th style="text-align: center;" width="10%">供需单名称</th>
        <th style="text-align: center;" width="10%">类型</th>
        <th style="text-align: center;" width="10%">公司</th>
        <th style="text-align: center;" width="10%">创建时间</th>
        <th style="text-align: center;" width="10%">品类</th>
        <th style="text-align: center;" width="10%">城市</th>
        <th style="text-align: center;" width="10%">状态</th>
        <th style="text-align: center;" width="10%">是否上架</th>
      </tr>
    </thead>
       <tbody>
     
	 <c:forEach items="${list}" var="item" >  
		    <tr>  
		      <td align="center" valign="middle"></td>  
		      <td align="center" valign="middle">${item["name"]==null?"&nbsp;":item["name"]}</td>  
		      <td align="center" valign="middle">
				<c:if test="${item.type=='0'}">
					供应单
				</c:if>
				<c:if test="${item.type=='1'}">
					需求单
				</c:if>
			  </td>  
		      <td align="center" valign="middle" id= "${item.user}" name = "activation"></td>  
		      
		      <td align="center" valign="middle"><fmt:formatDate value='${item.ctreatetime }' pattern='yyyy-MM-dd HH:mm:ss'/></td>  
		      
		      <td align="center" valign="middle">${item["category"]==null?"&nbsp;":item["category"]}</td>  
		      <td align="center" valign="middle">${item["area"]==null?"&nbsp;":item["area"]}</td>  
		      <td align="center" valign="middle">
		      	<c:if test="${item.status=='0'}">
					保存
				</c:if>
				<c:if test="${item.status=='1'}">
					提交
				</c:if>
		      	<c:if test="${item.status=='2'}">
					驳回
				</c:if>
				<c:if test="${item.status=='3'}">
					通过
				</c:if>
		      </td>  
				<td align="center" valign="middle">
		      	<c:if test="${item.resolve=='0'}">
					下架
				</c:if>
				<c:if test="${item.resolve=='1'}">
					上架
				</c:if>
				</td> 
		    </tr>    
    </c:forEach>  

    </tbody>
  </table>

  
  <div class="pagin">
    <p:pages totalCount="${pageInfo.count }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="${pageInfo.pageNo }" formId="fm_supplyDemandInfo"></p:pages>
  </div> 
</div>
</body>
</html>
