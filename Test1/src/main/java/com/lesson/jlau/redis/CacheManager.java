package com.lesson.jlau.redis;

import java.util.Collection;

import org.springframework.cache.Cache;
import org.springframework.cache.support.AbstractCacheManager;
import org.springframework.data.redis.cache.RedisCache;

/**
 * 
 * @ClassName CacheManager
 * @Description 继承了 spring 的 AbstractCacheManager 管理 RedisCache 类缓存管理
 * @author K
 * @Date 2016年6月27日 下午1:55:49
 * @version 1.0.0
 * @param <T>
 */
public class CacheManager<T extends Object> extends AbstractCacheManager {

	private Collection<? extends RedisCache> caches;

	public void setCaches(Collection<? extends RedisCache> caches) {
		this.caches = caches;
	}

	@Override
	protected Collection<? extends Cache> loadCaches() {
		return this.caches;
	}
}