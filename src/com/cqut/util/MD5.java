package com.cqut.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	
	public static String getMD5(String str){
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(str.getBytes());
			return new BigInteger(1,md5.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

}
