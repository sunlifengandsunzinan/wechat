var unameFlag = false,pwdFlag = false,repwdFlag = false,mobileFlag=false,imgCodeFlag=false,acpFlag=false;

//点击输入显示用户名规则提示
$("#uname").click(function(){
	unameFlag = false;
	$('#unameMSG').css("display","");
	$('#unameMSG').addClass("prompt_1 remind_1").html("<i></i>5~15位的字符，可包含数字、英文字母、“_”、“-”");
});
//用户名输入框失去焦点
$("#uname").blur(function(){
	//取得输入用户名的值
	var unameVal = $("#uname").val();
	if(unameVal == ''){//用户名为空
		unameFlag = false;
		$('#unameMSG').css("display","");
    	$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能为空");
	}else if(unameVal.length < 5 || unameVal.length > 15){//长度有误：5~15位字符
		unameFlag = false;
		$('#unameMSG').css("display","");
    	$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名长度为5~15位字符");
	}else if(!unameVal.match("^[a-zA-Z0-9-_]+$")){//参数有误：中文、数字、英文字母、“_”、“-” ^[\u4e00-\u9fa5_a-zA-Z0-9-]+$
		unameFlag = false;
		$('#unameMSG').css("display","");
    	$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名只能包含英文字母、数字、“-”、“_”");
	}else if(unameVal.match("^[0-9]")){//用户名不能以数字开头
		unameFlag = false;
		$('#unameMSG').css("display","");
		$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能以数字开头");
	}else if(unameVal.match("^[-]")){//用户名不能以数字开头
		unameFlag = false;
		$('#unameMSG').css("display","");
		$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能以“-”开头");
	}else if(unameVal.match("^[_]")){//用户名不能以“-”开头
		unameFlag = false;
		$('#unameMSG').css("display","");
		$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能以“_”开头");
	}else if(unameVal.match("[-]$")){//用户名不能以“-”结尾
		unameFlag = false;
		$('#unameMSG').css("display","");
		$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能以“-”结尾");
	}else if(unameVal.match("[_]$")){//用户名不能以“_”结尾
		unameFlag = false;
		$('#unameMSG').css("display","");
		$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>用户名不能以“_”结尾");
	}else{//以上验证通过
		unameFlag = true;
    	$('#unameMSG').css("display","");
    	$("#unameMSG").removeClass().addClass("prompt_1 correct_1").html("<i></i>");
	}
});

//点击输入显示密码规则提示
$("#pwd").click(function(){
	pwdFlag = false;
	$('#pwdMSG').css("display","");
	$('#pwdMSG').addClass("prompt_1 remind_1").html("<i></i>6~20位的字符，可包含英文、数字、符号");
});
//密码输入框失去焦点
$("#pwd").blur(function(){
	//取得用户输入的密码的值
	var pwdVal = $("#pwd").val();
	var pattern = "([ `~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—|{}【】‘；：”“'。，、？])|(^[a-zA-Z0-9-]+$)";
	if(pwdVal == ''){//密码输入为空
		pwdFlag = false;
		$('#pwdMSG').css("display","");
    	$('#pwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码不能为空");
	}else if(pwdVal.length < 6 || pwdVal.length > 20){//密码长度为6~20位字符
		pwdFlag = false;
		$('#pwdMSG').css("display","");
    	$('#pwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码长度为6~20位字符");
	}else if(!pwdVal.match(pattern)){//密码只能包含英文、数字、符号
		pwdFlag = false;
		$('#pwdMSG').css("display","");
    	$('#pwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码只能包含英文、数字、符号");
	}else if(!pwdVal.match(/^\S+$/)){//密码不能包含空格
		pwdFlag = false;
		$('#pwdMSG').css("display","");
    	$('#pwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码不能包含空格");
	}else{
		pwdFlag = true;
    	$('#pwdMSG').css("display","");
    	$("#pwdMSG").removeClass().addClass("prompt_1 correct_1").html("<i></i>");
	}
});

//点击输入显示再次输入密码规则提示
$("#repwd").click(function(){
	pwdFlag = false;
	$('#repwdMSG').css("display","");
	$('#repwdMSG').addClass("prompt_1 remind_1").html("<i></i>请再次输入密码");
});
//再次密码输入框失去焦点
$("#repwd").blur(function(){
	//取得用户输入的密码的值
	var pwdVal = $("#pwd").val();
	var repwdVal = $("#repwd").val();
	//密码只能包含英文、数字、符号  表达式
	var pattern = "([ `~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&mdash;—|{}【】‘；：”“'。，、？])|(^[a-zA-Z0-9-]+$)";
	if(repwdVal != pwdVal){//两次输入的密码不一致
		repwdFlag = false;
		$('#repwdMSG').css("display","");
    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>两次输入的密码不一致");
	}else{
		if(repwdVal == ''){//密码输入为空
			repwdFlag = false;
			$('#repwdMSG').css("display","");
	    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>重复密码不能为空");
		}else if(repwdVal.length < 6 || repwdVal.length > 20){//密码长度为6~20位字符
			repwdFlag = false;
			$('#repwdMSG').css("display","");
	    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码长度为6~20位字符");
		}else if(!repwdVal.match(pattern)){//密码只能包含英文、数字、符号
			repwdFlag = false;
			$('#repwdMSG').css("display","");
	    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码只能包含英文、数字、符号");
		}else if(!repwdVal.match(/^\S+$/)){//密码不能包含空格
			repwdFlag = false;
			$('#repwdMSG').css("display","");
	    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>密码不能包含空格");
		}else{
			repwdFlag = true;
	    	$('#repwdMSG').css("display","");
	    	$("#repwdMSG").removeClass().addClass("prompt_1 correct_1").html("<i></i>");
		}
	}
});

//点击输入手机号 规则提示
$("#mobile").click(function(){
	mobileFlag = false;
	$('#mobileMSG').css("display","");
	$('#mobileMSG').addClass("prompt_1 remind_1").html("<i></i>请填写您的真实手机号码，以便下一步手机验证");
});
//手机号输入框失去焦点
$("#mobile").blur(function(){
	//取得输入用户名的值
	var mobileVal = $("#mobile").val();
	if(mobileVal == ''){//手机号为空
		mobileFlag = false;
		$('#mobileMSG').css("display","");
    	$('#mobileMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>手机号码不能为空");
	}else if(mobileVal.length != 11){//密码长度为6~20位字符
		repwdFlag = false;
		$('#mobileMSG').css("display","");
    	$('#mobileMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>请输入11位手机号码");
	}else if(!mobileVal.match("^((13[0-9])|(14[5|7])|(15[0|1|2|3|5|6|7|8|9])|(17[6|7|8])|18[0-9])\\d{8}|(170[0|5|9]\\d{7})$")){//手机号码格式错误
		mobileFlag = false;
		$('#mobileMSG').css("display","");
    	$('#mobileMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>手机号码格式错误");
	}else{//以上验证通过
		mobileFlag = true;
    	$('#mobileMSG').css("display","");
    	$("#mobileMSG").removeClass().addClass("prompt_1 correct_1").html("<i></i>");
	}
});

//图片验证码输入提示
$("#imgCode").click(function(){
	imgCodeFlag = false;
	$('#imgCodeMSG').css("display","");
	$('#imgCodeMSG').addClass("prompt_1 remind_1").html("<i></i>请输入验证码");
});
//图片验证码输入框失去焦点
$("#imgCode").blur(function(){
	//取得输入图片验证码的值
	var imgCodeVal = $("#imgCode").val();
	if(imgCodeVal == ''){//输入为空
		imgCodeFlag = false;
		$('#imgCodeMSG').css("display","");
    	$('#imgCodeMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>验证码不能为空");
	}else{
		$.ajax({  
			type : "post",  
			url : "index.do?method=validateImgCode",  
			data : "imgCode=" + $("#imgCode").val(),  
			async : false,  
			success : function(msg){  
				if (msg == 1) {
					imgCodeFlag = true;
	            	$('#imgCodeMSG').css("display","none");
	            	$("#imgCodeMSG").removeClass();
	            }else{
	            	imgCodeFlag = false;
	            	$('#imgCodeMSG').css("display","");
	            	$("#imgCodeMSG").removeClass().addClass("prompt_1 error_1").html("<i></i>验证码错误");
	            	//刷新验证码
	            	$("#refush").click();
	            }  
			}  
	     });
		
	}
});

//换一张图片验证码
$("#refush").click(function(){
	var d = new Date();
	var src = "/validatecode/refresh.htm?date=" + d.getTime();
	$("#code").attr("src",src);
	return false;
});

//密码弱中强
function pwStrength(pwd){
    if (pwd == null || pwd == ''){
       $("#weak").removeClass();
       $("#centre").removeClass();
       $("#strong").removeClass();
       $("#mima1").css("display","none");
    }else{
       S_level = checkStrong(pwd);
       switch(S_level) {
          case 0:
            $("#weak").removeClass();
            $("#centre").removeClass();
            $("#strong").removeClass();
            $("#mima1").css("display","none");
            break;
          case 1:
        	$("#mima1").css("display","");
           	$("#weak").removeClass().addClass("color");//弱
            $("#centre").removeClass();
            $("#strong").removeClass();
            break;
          case 2:
        	$("#mima1").css("display","");
        	$("#weak").removeClass().addClass("color");
            $("#centre").removeClass().addClass("color");//中
            $("#strong").removeClass();
            break;
          default:
        	$("#mima1").css("display","");
        	$("#weak").removeClass().addClass("color");
          	$("#centre").removeClass().addClass("color");//中
            $("#strong").removeClass().addClass("color");//强
            break;
        }
    }
}

//checkStrong函数
//返回密码的强度级别
function checkStrong(sPW){
	if (sPW.length<=5)
	return 0; //密码太短
	Modes=0;
	for (var i=0;i<sPW.length;i++){
		//测试每一个字符的类别并统计一共有多少种模式.
		Modes|=CharMode(sPW.charCodeAt(i));
	}
	return bitTotal(Modes);
}

function CharMode(iN){
if (iN>=48 && iN <=57) //数字
	return 1;
if (iN>=65 && iN <=90) //大写字母
	return 2;
if (iN>=97 && iN <=122) //小写
	return 4;
else
	return 8; //特殊字符
}

function bitTotal(num){
	modes=0;
	for (var i=0;i<4;i++){
		if (num & 1) modes++;
		num>>>=1;
	}
	return modes;
}

//立即注册触发
$('#regBtn').click(function () {
	registerBtnClick();
});

function registerBtnClick(){

	//检查协议是否选择
	acpCheck();
    blurAll();
	if (checkInput2()) {
    		$('#acpMSG').css("display","none");
        	$("#acpMSG").removeClass().html("");
    		//保存信息
       		$.post("/index.do?method=registerFirstSteps", {
       			mobile: $('#mobile').val(),
       			uname : $('#uname').val(),
       			pwd : $('#pwd').val(),
       			repwd : $('#repwd').val(),
       			imgCode: $('#imgCode').val(),
       			acp: $("#acp").attr("checked"),
       			recommendCode: $("#recommendCode").val()
            },
            function (data){
            	data=$.parseJSON(data);
            	if(data['errCode'] == '0'){
            		//验证成功
            		$("#registerSecondStepsInit").submit();
            	}else{
            		//用户名验证结果
            		if(data['unameErrMsg'] != null){
            			unameFlag = false;
                		$('#unameMSG').css("display","");
                    	$('#unameMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>"+data['unameErrMsg']);
            		}
            		//密码验证结果
            		if(data['pwdErrMsg'] != null){
            			unameFlag = false;
                		$('#pwdMSG').css("display","");
                    	$('#pwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>"+data['pwdErrMsg']);
            		}
            		//重复密码验证结果
            		if(data['repwdErrMsg'] != null){
            			unameFlag = false;
                		$('#repwdMSG').css("display","");
                    	$('#repwdMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>"+data['repwdErrMsg']);
            		}
            		//手机号码验证结果
            		if(data['mobileErrMsg'] != null){
            			unameFlag = false;
                		$('#mobileMSG').css("display","");
                    	$('#mobileMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>"+data['mobileErrMsg']);
            		}
            		//图片验证码验证结果
            		if(data['imgCodeErrMsg'] != null){
            			unameFlag = false;
                		$('#imgCodeMSG').css("display","");
                    	$('#imgCodeMSG').removeClass().addClass("prompt_1 error_1").html("<i></i>"+data['imgCodeErrMsg']);
            		}
            		//协议验证结果
            		if(data['acpErrMsg'] != null){
            			acpFlag = false;
            			$('#acpMSG').css("display","");
                    	$("#acpMSG").removeClass().addClass("prompt_1 remind_1").html("<i></i>"+data['acpErrMsg']);
            		}
            		
            	}
            	
            });
    }

}

//所有验证都通过
function checkInput2(){
	if(unameFlag&&pwdFlag&&repwdFlag&&mobileFlag&&imgCodeFlag&&acpFlag){
		return true;
	}else{
		return false;
	}
}
//验证所有输入
function blurAll(){
	$("#uname").blur();
	$("#pwd").blur();
	$("#repwd").blur();
	$("#mobile").blur();
	$("#imgCode").blur();
}

function acpCheck(){
	if($("#acp").attr("checked") == "checked") {
		acpFlag = true;
		$('#acpMSG').css("display","none");
    	$("#acpMSG").removeClass().html("");
    }else{
    	$('#acpMSG').css("display","");
    	$("#acpMSG").removeClass().addClass("prompt_1 remind_1").html("<i></i>请选中你我贷用户协议");
    }
}

// Adobe数据收集 | zhenhua.xi | 20141030
$("#uname,#pwd,#repwd,#mobile,#imgCode").change(function(){
	var data = {
		"uname":"注册表单：用户名",
		"pwd":"注册表单：密码",
		"repwd":"注册表单：确认密码",
		"mobile":"注册表单：手机号码",
		"imgCode":"注册表单：验证码"
	};
	var key = $(this).attr("name");
	// 发送数据

	s.prop9 = data[key]; //注册表单对应的表单项

	npo.t();
});

$(function(){
	//推荐码
    $(".code").click(function(event) {
        $('.code_box').slideToggle();
        $(".code .arrow").toggleClass('hover');
    });
	
  //推荐码提示
    $(".tui").keyup(function(){
    	var tuijianma = $(this).val();
    	if(tuijianma!=null && tuijianma.length > 0) {
    		$(".tuijianMSG").html("不要输错哦");
    	} else {
    		$(".tuijianMSG").html("");
    	}
    });
    
    $(".code_box .inputOut").click(function(event) {
        if($(".tui").val()==""){
            $('.input_sp').hide();       
            $('.input_sp').css('font-family', 'Microsoft YaHei');
            $('.tui').focus();
        }else{
            $(this).css('font-family', 'arial');
            
        } 
    });
    $(".code_box .inputOut input").blur(function(){
        if($(".tui").val()==""){
            $(".input_sp").show();
            $('.input_sp').css('font-family', 'Microsoft YaHei');
        }else{
        	$('.input_sp').hide();       
            $('.input_sp').css('font-family', 'Microsoft YaHei');
    	}
    });
    
});