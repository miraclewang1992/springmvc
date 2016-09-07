package com.lesson.jlau.redis;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.lesson.jlau.util.RedisUtil;
import com.lesson.jlau.util.SerializeUtil;
 
public class MybatisRedisCache implements Cache {
    private static Logger logger = LoggerFactory.getLogger(MybatisRedisCache.class); 
    /** The ReadWriteLock. */ 
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
     
    private String id;
     
    public MybatisRedisCache(final String id) {  
        if (id == null) {
            throw new IllegalArgumentException("Cache instances require an ID");
        }
        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>MybatisRedisCache:id="+id);
        this.id = id;
    }  
     
    public String getId() {
        return this.id;
    }
 
    public void putObject(Object key, Object value) {
        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>putObject:"+key+"="+value);
        try {
			RedisUtil.getjedisPool().getResource().set(SerializeUtil.serialize(key.toString()), SerializeUtil.serialize(value));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
 
    public Object getObject(Object key) {
        Object value=null;
		try {
			value = SerializeUtil.unSerialize(RedisUtil.getjedisPool().getResource().get(SerializeUtil.serialize(key.toString())));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>getObject:"+key+"="+value);
        return value;
    }
 
    public Object removeObject(Object key) {
        try {
			RedisUtil.getjedisPool().getResource().expire(SerializeUtil.serialize(key.toString()),0);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
    }
 
    public void clear() {
        RedisUtil.getjedisPool().getResource().flushDB();
    }
 
    public int getSize() {
        return Integer.valueOf(RedisUtil.getjedisPool().getResource().dbSize().toString());
    }
 
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }
     
}