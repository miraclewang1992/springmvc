package com.lesson.jlau.dao;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IBaseDao<T> {
    
	/**
	 * 功能描述: 插入<br/> 
	 * @param t
	 * @return 
	 * @author 
	 */
	public Integer insert(T t);
	
	/**
	 * 功能描述: 插入<br/> 
	 * @param t
	 * @return 
	 * @author 
	 */
	public Integer insertSelective(T t);
	
	/**
	 * 功能描述: 更新实体<br/> 
	 * @param t 
	 * 创建人：
	 */
	public Integer updateByPrimaryKey(T t);
	
	/**
	 * 功能描述: 更新实体<br/> 
	 * @param t 
	 * 创建人：
	 */
	public Integer updateByPrimaryKeySelective(T t);
	
	/**
	 * 功能描述: 根据ID号删除单个实体<br/> 
	 * @param id
	 * @return 
	 * @author 
	 */
	public Integer deleteByPrimaryKey(String id);
	
	/**
	 * 功能描述: 删除实体<br/> 
	 * @param t 
	 * @author 
	 */
	public void delete(T t);
	
	/**
	 * 根据ID号查询单个实体
	 * @param obj
	 */
	public T selectByPrimaryKey(String id);
	
	
	/**
	 * 功能描述: 根据实体(查询条件)对象查询<br/> 
	 * @param t
	 * @return 
	 * @author 
	 */
	public T selectByAttribute(Object obj);
	
	
	/**
	 * 查询列表
	 * @param object
	 * @return
	 */
	public List<T> selectList(Object obj);
	
	/**
	 * 查询记录总个数
	 * @param object
	 * @return
	 */
	public Integer selectCount(Object obj);
	
	/**
	 * 返回要插入的id取值
	 * 
	 * @return
	 */
	public Integer getGeneralId();
	
	/**
	 * 功能描述: 通过ID查找<br/> 
	 * @param ids
	 * @return 
	 * @author
	 */
	public List<T> selectByIds(@Param(value="ids")Collection<Integer> ids);
}