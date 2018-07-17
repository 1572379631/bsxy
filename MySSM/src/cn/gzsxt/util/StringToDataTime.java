package cn.gzsxt.util;

import java.sql.Timestamp;

public class StringToDataTime {
	
	public Timestamp StringtoData(String str){
		
			String tr2 = str.replaceAll("[T]", " ");
			String str3 = tr2+":00";
			Timestamp timestamp = Timestamp.valueOf(str3);
			return timestamp;
		
	}
}
