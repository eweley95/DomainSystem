package com.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateUtil {
    
    public static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
    public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    private static final String timeZone = "GMT+8:00";

    public static Date getDate() {
    	return convertTimeZone(new Date(), null, timeZone);
    }

    public static Date convertTimeZone(Date date, String sourceTimeZone, String destinationTimeZone) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss.SSS");
		sdf.setTimeZone(destinationTimeZone == null ? TimeZone.getDefault() : TimeZone.getTimeZone(destinationTimeZone));
		String dateString = sdf.format(date);
		sdf.setTimeZone(sourceTimeZone == null ? TimeZone.getDefault() : TimeZone.getTimeZone(sourceTimeZone));
	
		try {
	            return sdf.parse(dateString);
		} catch (Throwable tw) {
	            throw new RuntimeException("convertTimeZone error : date=" + date + ", sourceTimeZone=" + sourceTimeZone + ", destinationTimeZone=" + destinationTimeZone);
		}
    }

    public static Date parseStringToDate(String strDate, String format) throws Exception {
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(format);
		if (strDate != null && strDate.length() > 0) {
	            return DATE_FORMAT.parse(strDate);
		}
		return null;
    }
	
    public static String parseDateToString(Date date, String format) {
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(format);
		if (date != null) {
	            return DATE_FORMAT.format(date);
		}
		return null;
    }
    
}
