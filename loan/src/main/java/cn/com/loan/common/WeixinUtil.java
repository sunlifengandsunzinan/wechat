package cn.com.loan.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;

import cn.com.loan.entity.AccessToken;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


import com.sun.jmx.snmp.Timestamp;


public class WeixinUtil {
	public static AccessToken getAccessToken(String appid , String appsecret,String code) throws Exception, IOException {
		AccessToken accessToken = null;
		JsonParser jsonparer = new JsonParser();// 初始化解析json格式的对象
		String requestUrl = ApplicationConstants.GET_ACCESSTOKEN_URL.replace("APPID" , appid).replace("APPSECRET" , appsecret).replace("CODE", code);
		HttpClient client = new DefaultHttpClient();
		HttpGet get = new HttpGet(requestUrl);
		HttpResponse res = client.execute(get);
		String responseContent = null; // 响应内容
		HttpEntity entity = res.getEntity();
		responseContent = EntityUtils.toString(entity, "UTF-8");
		JsonObject json = jsonparer.parse(responseContent).getAsJsonObject();
		//JSONObject jsonObject = JSONObject.fromObject(json);
		// 如果请求成功
		if (null != json) {
			try {
				accessToken = new AccessToken();
				accessToken.setAccessToken(json.get("access_token").getAsString());
				accessToken.setExpiresIn(json.get("expires_in").getAsInt());
				accessToken.setOpenId(json.get("openid").getAsString());
			} catch (Exception e) {
				accessToken = null;
				// 获取token失败
				System.out.println("获取token失败 errcode:{} errmsg:{}");
			}
		}
		return accessToken;
	}
	
	public static AccessToken getAccessToken2(String appid , String appsecret) {
		AccessToken accessToken = null;

		String requestUrl = ApplicationConstants.GET_ACCESSTOKEN_URL.replace("APPID" , appid).replace("APPSECRET" , appsecret);
		String json = httpRequest(requestUrl , "GET" , null);
		JSONObject jsonObject = JSONObject.fromObject(json);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				accessToken = new AccessToken();
				accessToken.setAccessToken(jsonObject.getString("access_token"));
				accessToken.setExpiresIn(jsonObject.getInt("expires_in"));
			} catch (Exception e) {
				accessToken = null;
				// 获取token失败
				System.out.println("获取token失败 errcode:{} errmsg:{}");
			}
		}
		return accessToken;
	}
	
	public static String httpRequest(String requestUrl , String requestMethod , String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL" , "SunJSSE");
			sslContext.init(null , tm , new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod)) httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream , "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
//			jsonObject = JSONObject.fromObject(buffer.toString());
			return buffer.toString();
		} catch (ConnectException ce) {
			System.out.println("Weixin server connection timed out.");
		} catch (Exception e) {
			System.out.println("error.");
		}
//		return jsonObject;
		return null;
	}
	
	
	
	public static void main(String[] args) {
		WeixinUtil util = new WeixinUtil();
		try {
			//获取accessToken之前判断文件里有没有，没有重新获取，填写过期时间，有判断时间有没有过期
			PropertiesUtil putil=new PropertiesUtil(ApplicationConstants.CONF_PROPERTIES_PATH);
			Long overduetime = Long.parseLong(putil.getProperty("OVERDUE_ACCESS_TOKEN_TIME"));
			Timestamp s = new Timestamp();
			AccessToken token = new AccessToken() ;
			if(s.getDateTime()>overduetime){
				//超时从新获取accessToken
				token = util.getAccessToken2(ApplicationConstants.APPID, ApplicationConstants.SECRET);
				putil.writeProperties("OVERDUE_ACCESS_TOKEN_TIME", String.valueOf(s.getDateTime()+ApplicationConstants.EFFECTIVE_TIME));
				putil.writeProperties("ACCESS_TOKEN", token.getAccessToken());
			}else{
				System.out.println("token:"+putil.getProperty("ACCESS_TOKEN")+",time:"+token.getExpiresIn());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
