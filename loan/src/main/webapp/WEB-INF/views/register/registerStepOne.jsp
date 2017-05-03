<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="all" />
<title>用户注册 - 至沃优佰</title>
<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css"> 
<link href="<%=path%>/css/sea.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>

<!--head-->

<div class="clearfix simpleHead01">
	<div class="fl">
    	<a href="#"><img src="<%=path%>/images/simplehead0.gif" width="173" height="57" alt="至沃优佰" /></a><span>注册</span>
    </div>
    <div class="fr"><span class="fc_6">已有帐号？<a href="#" class="blue">立即登录</a></span></div>
</div>
<!--head end-->

<div class="main page147">
	<div class="clearfix fluid">
<div class="module padding">
        	<div class="stepX stepX_3">
                <ul class="active">
                    <li class="sz"><span>1</span></li>
                    <li class="sm">填写帐户信息</li>
                </ul>
                <ul class="">
                    <li class="sz"><span>2</span></li>
                    <li class="sm">手机验证</li>
                </ul>
                <ul>
                    <li class="sz"><span>3</span></li>
                    <li class="sm">注册成功</li>
                </ul>
            </div>
            <div class="content">
            	<form action="" method="post" class="" id="">
                <table class="k touzi01">
                	<tr>
                    	<th style="padding-top:20px; padding-bottom:5px;"></th>
                        <td style="padding-top:20px; padding-bottom:5px;"><span class="fc_orange">步步送红包？注册就送50元，实名认证再送20元，邮箱绑定继续送30元！关注微信公众号“至沃优佰”登陆再领20元红包！ 
</span></td>
                    </tr>
                    <tr>
                        <th>用户名</th>
                        <td>
                        	<div class="inputOut">
                        		<input type="text" class="input_b" id="uname" name="uname" maxlength="15">
                        		<span id="unameMSG"></span>
                        	</div>
                        </td>
                    </tr>
                    <tr>
                        <th>密码</th>
                        <td>
                            <div class="inputOut">
                                <input type="password" class="input_b " id="pwd" name="pwd" maxlength="20" onkeyup="pwStrength(this.value)" onblur="pwStrength(this.value)">
                                <span id="pwdMSG"></span>
                            </div>
                            <div class="mimaout" id="mima1" style="display:none" >
                            	<span class="mima2">
                            		<em id="weak">弱</em><em id="centre">中</em><em id="strong">强</em>
                            	</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>确认密码</th>
                        <td>
                            <div class="inputOut">
                                <input type="password" class="input_b" id="repwd" name="repwd" maxlength="20">
                                <span id="repwdMSG"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>手机号码</th>
                        <td>
                            <div class="inputOut">
                                <input type="text" class="input_b " id="mobile" name="mobile" maxlength="11">
                                <span id="mobileMSG"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>验证码</th>
                        <td>
                            <div class="inputOut">
                                <input type="text" class="input_b" style="width:144px;" name="imgCode" id="imgCode" maxlength="4">
                                <img src="images/refresh.htm" width="90" height="36" name="code" id="code" style="vertical-align:middle; margin-right:10px;" alt="图形验证码" />
                                <a href="javascript:;" class="blue" id="refush">换一张</a>
                                <span id="imgCodeMSG"></span>
                            </div>
                        </td>
                    </tr>
                   <tr class="hight_auto">
                        <th></th>
                        <td>
                            <div class="code">
                                <i class="arrow hover"></i>
                                <a class="tuiarrow" href="javascript:void(0)">推荐码（选填）</a>
                            </div>
                            <div class="code_box" style="display:block;">
                                <div class="fl code_hd" style="width:50px;margin-right:10px">推荐码</div>
                                <div class="inputOut fl" style="width:360px;position:relative">
                                    <input type="text" class="input_b tui" id="recommendCode" value="" maxlength="11">
                                    <span class="input_sp" style="display:none;font-family:Microsoft YaHei;">推荐人手机或专属推荐码（选填）</span>
                                    <span class="tuijianMSG">不要输错哦</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="button" class="btn special02" value="同意协议并注册" onclick="registerBtnClick();"/> 
                            <input name="acp" id="acp" type="checkbox" value="1" checked style="display:none;">
                            <div class="mb_10 fc_6 bt_tx">注册即视为同意<a href="#">《至沃优佰用户协议》</a> </div>
                        	<span id="acpMSG" style="display:none"></span>
                        </td>
                    </tr>
                </table>
                </form>
            </div>

        </div>
    </div>
    
</div>

<!--foot-->
<!--foot-->
<div class="login_foot w1000 txcenter">
	<p class="fc_9 fs_12">Copyright © 2015 至沃优佰（www.zhiwoyoubai.com）　版权所有；市场有风险，投资需谨慎，营造合法、诚信借贷环境。</p>
    <div class="line3 mt_10">
        <a rel="nofollow" class="img1" target="_blank" href="#"><img src="images/px.gif" width="70" height="32"></a>
            <a rel="nofollow" class="img2" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32"></a>
            <a rel="nofollow" class="img3" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32"></a>
            <a rel="nofollow" class="img4" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32"></a>
            <a rel="nofollow" class="img5" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32"></a>
    		<a rel="nofollow" class="img6" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32" ></a>
        	<a rel="nofollow" class="img7" target="_blank" href="#"><img src="<%=path%>/images/px.gif" width="70" height="32" ></a>
    </div>
</div>
<!--foot end-->
<div style="display:none;">
</div><!--foot end-->
<script type="text/javascript" src="<%=path%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/register1.js"></script>
<script type="text/javascript" >
	$(".arrow").removeClass("hover");
	$(".code_box").css("display","none");
	$('.input_sp').css('font-family', 'arial').css('display','block');
	$(".tuijianMSG").html("");	
</script>
</body>
</html>
