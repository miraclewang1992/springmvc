package com.lesson.jlau.shiro;

import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.lesson.jlau.bean.Permission;
import com.lesson.jlau.bean.Role;
import com.lesson.jlau.bean.User;
import com.lesson.jlau.service.UserServiceI;

public class MyShiro extends AuthorizingRealm{  
  
    @Inject  
    private UserServiceI userService;  
    /** 
     * 权限认证 
     */  
    @Override  
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {  
        //获取登录时输入的用户名  
        String loginName=(String) principalCollection.fromRealm(getName()).iterator().next();  
        //到数据库查是否有此对象  
        User user=userService.selectRolePermission(loginName);  
        if(user!=null){  
            //权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）  
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();  
            //用户的角色集合  
            Set roles =new HashSet();
            //用户的角色对应的所有权限
            Set permissions =new HashSet();
            Role role=null;
            Permission permission=null;
            for(int i=0,num=user.getRoles().size();i<num;i++){
            	role=user.getRoles().get(i);
            	roles.add(role.getRoleName());
            	
            }
            for(int j=0,number=user.getPermissions().size();j<number;j++){
        		
        		permission =user.getPermissions().get(j);
        		permissions.add(permission.getPermissionName());
        	}
            info.setRoles(roles);  
            info.addStringPermissions(permissions);  
            //用户的角色对应的所有权限，如果只使用角色定义访问权限，下面的四行可以不要  
           
         
            return info;  
        }  
        return null;  
    }  
  
    /** 
     * 登录认证; 
     */  
    @Override  
    protected AuthenticationInfo doGetAuthenticationInfo(  
            AuthenticationToken authenticationToken) throws AuthenticationException {  
        //UsernamePasswordToken对象用来存放提交的登录信息  
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;  
        //查出是否有此用户  
        User user=userService.selectRolePermission(token.getUsername());  
        if(user!=null){  
            //若存在，将此用户存放到登录认证info中  
            return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), getName());  
        }  
        return null;  
    }  
  
}  