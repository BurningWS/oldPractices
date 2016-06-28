package cn.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	static char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}; 
	
	public static String encode(String toStr) {
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			md.update(toStr.getBytes());
			byte[] c = md.digest();
			
			int j = c.length;
	        char str[] = new char[j * 2];
	        int k = 0;
	        for (int i = 0; i < j; i++) {
	            byte byte0 = c[i];
	            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	            str[k++] = hexDigits[byte0 & 0xf];
	        }
	        return new String(str);
	        
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
