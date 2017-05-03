package cn.com.loan.annotation;

import java.lang.annotation.*;  
/** 
 * 验证OAuth2注解 
 * @author slf 
 * 
 */  
@Retention(RetentionPolicy.RUNTIME)  
@Target(ElementType.METHOD)  
public @interface OAuthRequired {  
      
}  