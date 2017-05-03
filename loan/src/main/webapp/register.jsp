<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="js/scrollable.js"></script>
 <script type="text/javascript" src="js/ajaxfileupload.js"></script>

<script language="javascript">

$(document).ready(function(){

	//解决ie访问，ajax从缓存中读取数据的问题
	$.ajaxSetup({cache:false});
	
	dataload();
});
function dataload(){
$.post("<%=path%>/register/intProCity",
		   function(data){

	      $("#selProvince").append(data);
		   });
}


function selectProv(){
	$("#selCity").empty();
	var checkValue=$("#selProvince").val();
	$.post("<%=path%>/register/queryProCity",{provinceName:checkValue},
			   function(data){
		      $("#selCity").append(data);
			   });

}
function check_email(){
    var str = $("#email").val();
    var reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;

    if(str.search(reg) < 0){
        document.getElementById('emailmsg').innerHTML = '邮箱格式错误！';
    }else{

    	
		$.post("<%=path%>/register/doCheckEmail", { email: str},
				   function(data){
				     if(data == "false"){
				    	 document.getElementById('emailmsg').innerHTML = '该邮箱已经注册过';
				     }else{
				    	 document.getElementById('emailmsg').innerHTML = '该邮箱可用';
				     }
				   });

    }
}
$(function(){
    $("#wizard").scrollable({
        onSeek: function(event,i){
            $("#status li").removeClass("active").eq(i).addClass("active");
        },
        onBeforeSeek:function(event,i){
            if(i==1){
                var user = $("#user").val();
                if(user==""){
                    alert("请输入用户名！");
                    return false;
                }
                var pass = $("#pass").val();
                var pass1 = $("#pass1").val();
                if(pass==""){
                    alert("请输入密码！");
                    return false;
                }
                if(pass1 != pass){
                    alert("两次密码不一致！");
                    return false;
                }
            }
        }
    });
    $("#sub").click(function(){
        var data = $("form").serialize();
        alert(data);
    });
});
$(function () {
    $("#buttonUpload").click(function () {
        ajaxFileUpload();
    })
})
function ajaxFileUpload() {
	var str = $("#email").val();
    $.ajaxFileUpload
    (
        {
            url: '<%=path%>/register/saveImg', //用于文件上传的服务器端请求地址
            data: {email: str},
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'fileToUpload', //文件上传域的ID
            dataType: 'text', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
    			alert(data);
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
    )
    return false;
}
</script>
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #ffffff;
	border-collapse: collapse;
	width:80%;"
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #ffffff;
	background-color: #ffffff;
	 text-align:left;
}
#td1 {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #ffffff;
	background-color: #ffffff;
	 text-align:left;
}

</style>
</head>
<body >
<form action="#" method="post"> 
  <div id="wizard"> 
    <ul id="status"> 
        <li class="active"><strong>1.</strong>创建账户</li> 
        <li><strong>2.</strong>公司详细信息</li> 
        <li><strong>3.</strong>完成</li> 
    </ul> 
 
    <div class="items"> 
        <div class="page"> 
         <h3>创建一个账户<br/><em>请填写您的注册账户信息，用于登录。</em></h3>
               <p><label>邮箱：</label><input type="text" class="input" id="email" name="email" onblur="check_email()" /><span id="emailmsg">请输入正确的邮箱</span></p>
               <p><label>密码：</label><input type="password" class="input" id="pass" name="password" /></p>
               <p><label>确认密码：</label><input type="password" class="input" id="pass1" name="password1" /></p>
           <div class="btn_nav"> 
              <input type="button" class="next right" value="下一步»" /> 
           </div> 
        </div> 
        <div class="page"> 
              <h3>详细信息<br/><em>请告诉我们您公司的详细信息。</em></h3>
<table class = "gridtable" >
<tr><td><p><label>昵称：</label><input type="text" class="input" name="name" id="name" /></p></td><td><p><label>E-mail：</label><input type="text" id ="e-mail" class="input" name="e-mail" /></p></td></tr>
<tr><td><p><label>QQ：</label><input type="text" class="input" name="oicq" id="oicq" /></p></td><td><p><label>手机号码：</label><input type="text" class="input" name="phone" id="phone" /></p></td></tr>
<tr><td><p><label>微信：</label><input type="text" class="input" name="wechat" id="wechat" /></p></td><td><p><label>公司名称：</label><input type="text" class="input" name="company" id="company" /></p></td></tr>
</table> 
<p><label>公司地址：</label> <select id="selProvince" onchange="selectProv()">
        <option value="0">--请选择省份--</option>
    </select>
    <select id="selCity">
        <option value="0">--请选择城市--</option>
    </select><input type="text" class="input" name="address" id="address" /></p>
<p><label>上传营业执照：</label><input type="file" id="fileToUpload" name="fileToUpload" /><button id="buttonUpload">上传</button></p>

           <div class="btn_nav"> 
               <input type="button" class="prev" style="float:left" value="«上一步" /> 
               <input type="button" class="next right" value="下一步»" /> 
           </div> 
        </div> 
        <div class="page"> 
             <h3>完成注册<br/><em>点击确定完成注册。</em></h3>
               <h4>欢迎您！</h4>
               <p>请点击“确定”按钮完成注册。</p>
           <div class="btn_nav"> 
               <input type="button" class="prev" style="float:left" value="«上一步" /> 
               <input type="button" class="next right" id="sub" value="确定" /> 
           </div> 
        </div> 
    </div> 
  </div> 
</form>


</body>
</html>
