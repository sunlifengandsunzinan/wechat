package cn.com.loan.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;  

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;  
  

import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestParam;  

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.WeixinUtil;
import cn.com.loan.entity.AccessToken;
/** 
 * OAuth2 处理控制器 
 * @author Sunlight 
 * 
 */  
@Controller  
public class OAuth2Controller {  
    /** 
     * 构造参数并将请求重定向到微信API获取登录信息 
     *  
     * @param index 
     * @return 
     */  
    @RequestMapping(value = {"/oauth2" })  
    public String Oauth2API(HttpServletRequest request, @RequestParam String resultUrl) {  
        // 此处可以添加获取持久化的数据，如微信服务号ID等相关信息  
        String CropId = ApplicationConstants.APPID;  
        String redirectUrl = "";  
        if (resultUrl != null) {  
           // String reqUrl =request.getLocalAddr();  
        	String reqUrl = "zrsc8x.natappfree.cc/loan";
            String backUrl ="http://" + reqUrl + "/oauth2url?oauth2url=" + resultUrl;  
            System.out.println("backUrl="+backUrl);  
            redirectUrl = oAuth2Url(CropId, backUrl);  
        }  
        return "redirect:" + redirectUrl;  
    }  
  
    /** 
     * 根据code获取Userid后跳转到需要带用户信息的最终页面 
     *  
     * @param request 
     * @param code 
     *            获取微信重定向到自己设置的URL中code参数 
     * @param oauth2url 
     *            跳转到最终页面的地址 
     * @return 
     * @throws Exception 
     * @throws IOException 
     */  
    @RequestMapping(value = { "/oauth2url" })  
    public String Oauth2MeUrl(HttpServletRequest request, @RequestParam String code, @RequestParam String oauth2url) throws IOException, Exception {  
        AccessToken accessToken = WeixinUtil.getAccessToken(ApplicationConstants.APPID, ApplicationConstants.SECRET,code);  
        HttpSession session = request.getSession();  
        if (accessToken != null && accessToken.getAccessToken() != null) {  
            //String Userid = getMemberGuidByCode(accessToken.getAccessToken(), code);
        	String requestUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN ";
        	String userInfo = WeixinUtil.httpRequest(requestUrl.replace("ACCESS_TOKEN", accessToken.getAccessToken()).replace("OPENID", accessToken.getOpenId()), "GET", null);
        	System.out.println("得到的用户信息是："+userInfo);
        	String Userid = accessToken.getAccessToken();
            if (Userid != null) {  
                session.setAttribute("UserId", Userid);  
            }  
        }  
        // 这里简单处理,存储到session中  
        return "redirect:" + oauth2url;  
    }  
  
    /** 
     * 构造带员工身份信息的URL 
     *  
     * @param corpid 
     *            企业id 
     * @param redirect_uri 
     *            授权后重定向的回调链接地址，请使用urlencode对链接进行处理 
     * @param state 
     *            重定向后会带上state参数，企业可以填写a-zA-Z0-9的参数值 
     * @return 
     */  
    private String oAuth2Url(String corpid, String redirect_uri) {  
        try {  
            redirect_uri = java.net.URLEncoder.encode(redirect_uri, "utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        String oauth2Url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + corpid + "&redirect_uri=" + redirect_uri  
                + "&response_type=code&scope=snsapi_userinfo&state=sunlight#wechat_redirect";  
        System.out.println("oauth2Url=" + oauth2Url);  
        return oauth2Url;  
    }  
  
    /** 
     * 调用接口获取用户信息 
     *  
     * @param token 
     * @param code 
     * @param agentId 
     * @return 
     * @throws SQLException 
     * @throws RemoteException 
     */  
    public String getMemberGuidByCode(String token, String code) {  
        System.out.println("code==" + code + "\ntoken=" + token );  
/*        Result<String> result = QiYeUtil.oAuth2GetUserByCode(token, code, agentId);  
        System.out.println("result=" + result);  
        if (result.getErrcode() == "0") {  
            if (result.getObj() != null) {  
                // 此处可以通过微信授权用code还钱的Userid查询自己本地服务器中的数据  
                return result.getObj();  
            }  */
     //   }  
        return "";  
    }  
  
}  