package com.kelvin.dao;

import com.kelvin.domain.PolPrdSupplier;
import com.kelvin.jpa.repository.ExpandJpaRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * JPA方式访问数据库数据
 * dao只要继承JpaRepository类就可以，几乎可以不用写方法，
 * 还有一个特别有尿性的功能非常赞，就是可以根据方法名来自动的生产SQL，
 * 比如findByUserName 会自动生产一个以 userName 为参数的查询方法，
 * 比如 findAlll 自动会查询表里面的所有数据，比如自动分页等等。。
 */
@Repository
public interface PrdSupplierRepository extends ExpandJpaRepository<PolPrdSupplier, Integer> {

    /*User findByUserNameOrEmail(String username, String email);
    //jpa 方法名就是查询语句,只要规法写方法名一切就都可以完成(当然.有时候会造成方法名又臭又长)
    User findByEmail(String email);//根据邮箱查询
    List<User> findByUserName(String userName);//根据用户名查询
    //select * from test.users where email='imgod@qq.com' and name='imgod';
    List<User> findByUserNameAndEmail(String userName, String email);//根据用户名和邮箱进行查询
    //select * from test.users where email='imgod@qq.com' and name='imgod4444' order by id desc;
    List<User> findByUserNameAndEmailOrderByIdDesc(String userName, String email);//根据用户名和邮箱进行查询,排序
    //select * from test.users where email='imgod@qq.com' and name='imgod4444' order by id desc limit 2;
    List<User> findTop2ByUserNameAndEmailOrderByIdDesc(String userName, String email);//根据用户名和邮箱进行查询,排序,前两个
    //根据邮箱进行分页查询
    List<User> findByEmail(String email, Pageable pageable);//根据用户名和邮箱进行查询
    *//**
     * 下面是jpa使用原生sql的样例
     *//*
    String findUserSql = "select user from User user";
    @Query(findUserSql + " where  user.userName = ?1 or user.nickName = ?2")
    List<User> findByUserNameNickName(String userName, String nickName);*/


}