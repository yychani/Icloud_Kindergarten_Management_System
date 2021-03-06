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
		
		if(key != null && key.equals("userPwd")){
			value = getSha512(super.getParameter("userPwd"));
		}else if(key != null && key.equals("userNumber2")){
			value = super.getParameter("userNumber2");
			String[] subvalue = {value.substring(0, 1), value.substring(1)};
			value = subvalue[0] + getSha512(subvalue[1]);
		}else if(key != null && key.equals("currentPass")){
			value = getSha512(super.getParameter("currentPass"));
		}else if(key != null && key.equals("changePass1")){
			value = getSha512(super.getParameter("changePass1"));
		}else {
			value = super.getParameter(key);
		}
		
		return value;
	}

	public static String getSha512(String parameter) {
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
