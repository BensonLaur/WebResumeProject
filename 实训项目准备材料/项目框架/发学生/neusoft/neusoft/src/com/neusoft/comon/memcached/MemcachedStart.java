package com.neusoft.comon.memcached;

import java.util.ResourceBundle;

import com.danga.MemCached.SockIOPool;

public class MemcachedStart {

	public static void initMemcached() {
		ResourceBundle bundle = ResourceBundle.getBundle("memcached");
		String[] servers = (bundle.getString("memcached.servers")).split(",");
		if (servers.length > 0) {
			SockIOPool pool = SockIOPool.getInstance();
			pool.setServers(servers);
			pool.setFailover(true);
			pool.setInitConn(10);
        	pool.setMinConn(5);
			pool.setMaxConn(250);
			pool.setMaintSleep(30);
			pool.setNagle(false);
			pool.setSocketTO(3000);
			pool.setAliveCheck(true);
			pool.initialize();
			System.out.println("Memcached连接池初始化成功!");
		}
	}

}