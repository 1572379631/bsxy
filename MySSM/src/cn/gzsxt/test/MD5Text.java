package cn.gzsxt.test;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Text {

	public static void main(String[] args) {
		StrToMD5("admin");
		MD5ToStr(StrToMD5("admin"));
	}
	
	//加密
	public static String StrToMD5(String str){
		 MessageDigest md;
		 String k = null;
		try {
			 md = MessageDigest.getInstance("MD5");
			 // 计算md5函数
			 md.update(str.getBytes());
			 // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			 // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			 String strMD5 =new BigInteger(1, md.digest()).toString(16);
			 System.out.println(strMD5);
			 char[] a = strMD5.toCharArray();
			 for (int i = 0; i < a.length; i++) {
			    a[i] = (char) (a[i] ^ 't');
			 }
			 k = new String(a);
			 System.out.println("加密后："+k);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return k;
	}
	
	public static String StrToMD5_to1(String str){
		 MessageDigest md;
		 String strMD5 = null;
		try {
			 md = MessageDigest.getInstance("MD5");
			 md.update(str.getBytes());
			 strMD5 =new BigInteger(1, md.digest()).toString(16);
			 System.out.println(strMD5);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return strMD5;
	}
	
	
	//解密：弃用
	public static String MD5ToStr(String strMD5){
		 char[] a = strMD5.toCharArray();
		 for (int i = 0; i < a.length; i++) {
		    a[i] = (char) (a[i] ^ 't');
		 }
		 String k = new String(a);
		 System.out.println("解密后："+k);
		 return k;
	}
	 
}
