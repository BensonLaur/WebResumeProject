package com.neusoft.comon.init;

import java.util.HashMap;
import java.util.Iterator;
import java.util.ResourceBundle;
import java.util.Set;

public class PropertiesUtil {
	private static HashMap<String,String> propertiesMap = new HashMap<String,String>();

    // 初始化配置信息
	public static void initProperties(){
		ResourceBundle bundle = ResourceBundle.getBundle("ebsso");
		Set<String> keySets = bundle.keySet();
		Iterator<String> iterator = keySets.iterator();
		HashMap<String,String> propertyMap = new HashMap<String, String>();
		String key;
		while(iterator.hasNext()){
			key = iterator.next();
			propertyMap.put(key, bundle.getString(key));
		}
		PropertiesUtil.setPropertiesMap(propertyMap);
		System.out.println("初始化属性成功！");
	}
	
	public static void setPropertiesMap(HashMap<String,String> propertiesMap) {
		PropertiesUtil.propertiesMap = propertiesMap;
	}
	
	/**
	 * 根据Key值获得属性值
	 * @param key
	 * @return
	 */
	public static String get(String key){
		return propertiesMap.get(key);
	}
}
