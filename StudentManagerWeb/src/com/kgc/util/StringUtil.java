package com.kgc.util;
/**
 * 
 * @author llq
 *String���һЩ���ò�������
 */
public class StringUtil {
	public static boolean isEmpty(String str) {
		if(str == null || "".equals(str)) {
			return true;
		}
		return false;
	}
}
