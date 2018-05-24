package com.calbook.web.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ChangeURL {
	public static String getURLFormat(String query){
		
		String urlquery = null;
		try {
			urlquery = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return urlquery;
		
	}
}
