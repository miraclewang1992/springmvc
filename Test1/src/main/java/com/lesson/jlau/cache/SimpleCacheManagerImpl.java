package com.lesson.jlau.cache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;

import com.lesson.jlau.util.RedisUtil;

public class SimpleCacheManagerImpl implements SimpleCacheManager{
	  
	    public void createCache(String name, Cache<Object, Object> cache) throws CacheException {  
	    	RedisUtil.save(name, cache);
	    }  
	  
	     
	    public Cache<Object, Object> getCache(String name) throws CacheException {  
	         return (Cache<Object, Object>) RedisUtil.get(name);
	    }  
	  
	    public void removeCache(String name) throws CacheException {  
	        RedisUtil.del(name);
	    }  
	  
	    public void updateCahce(String name, Cache<Object, Object> cache) throws CacheException {  
	       
	    }


		public void destroy() throws CacheException {
			// TODO Auto-generated method stub
			
		}  
	  
	    
}
