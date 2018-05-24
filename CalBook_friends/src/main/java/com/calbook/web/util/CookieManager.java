package com.calbook.web.util;

import javax.servlet.http.Cookie;

public class CookieManager {
	
	public static String getCookie(Cookie[] coos, String cookieName){
		if(coos != null){
			for(Cookie ck : coos){
				if(ck.getName().equals(cookieName)){
					return ck.getValue();
				}
			}	
		}
		return null;
	}
	
	
}
