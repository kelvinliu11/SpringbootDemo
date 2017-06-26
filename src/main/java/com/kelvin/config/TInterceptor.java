package com.kelvin.config;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.aop.support.AopUtils;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.io.Serializable;
import java.util.Properties;

public class TInterceptor extends TransactionAspectSupport implements MethodInterceptor, Serializable {
    
    public TInterceptor() {
        setTransactionAttributes(getAttrs());
    }
    
    private Properties getAttrs(){
        Properties attributes = new Properties();
        // 新增
        attributes.setProperty("create*", "PROPAGATION_REQUIRED,ISOLATION_DEFAULT");
        attributes.setProperty("save*", "PROPAGATION_REQUIRED,ISOLATION_DEFAULT");
        // 修改
        attributes.setProperty("update*", "PROPAGATION_REQUIRED,ISOLATION_DEFAULT");
        // 删除
        attributes.setProperty("delete*", "PROPAGATION_REQUIRED,ISOLATION_DEFAULT");
        //查询
        attributes.setProperty("query*", "PROPAGATION_REQUIRED,ISOLATION_DEFAULT");
        return attributes;
    }
    
    public Object invoke(MethodInvocation invocation) throws Throwable {
        Class<?> targetClass = (invocation.getThis() != null ? AopUtils.getTargetClass(invocation.getThis()) : null);
    
        // Adapt to TransactionAspectSupport's invokeWithinTransaction...
        return invokeWithinTransaction(invocation.getMethod(), targetClass, () -> invocation.proceed());
    }
}