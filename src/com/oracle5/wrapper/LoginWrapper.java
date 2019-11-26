package com.oracle5.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper {

	public LoginWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		
		if(key != null && key.equals("userPwd")) {
			value = getSha512(super.getParameter("userPwd"));
		}else {
			value = super.getParameter(key);
		}
		
		return value;
	}

	private static String getSha512(String parameter) {
		String encPwd = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512"); // SHA-512라는 알고리즘 명, 만약 없는 알고리즘 입력시 exception발생
			// 암호화된 문장 = digest
			// 암호화 알고리즘 SHA-512
			byte[] bytes = parameter.getBytes(Charset.forName("UTF-8"));
			
			md.update(bytes);
	           
            encPwd = Base64.getEncoder().encodeToString(md.digest());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}
}
