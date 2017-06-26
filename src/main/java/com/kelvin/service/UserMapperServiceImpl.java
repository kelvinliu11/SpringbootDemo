package com.kelvin.service;

import com.kelvin.domain.UserEntity;
import com.kelvin.enums.UserSexEnum;
import com.kelvin.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Lenovo on 2017/6/26.
 */
@Service
public class UserMapperServiceImpl {

    @Autowired
    UserMapper userMapper;

    public void saveUser(){
        UserEntity user = new UserEntity();
        user.setId(1l);
        user.setNickName("1");
        user.setPassWord("1");
        user.setUserName("1");
        user.setUserSex(UserSexEnum.MAN);
        userMapper.insert(user);
        user = new UserEntity();
        user.setId(2l);
        user.setNickName("2");
        user.setPassWord("2");
        user.setUserName("2222");
        user.setUserSex(UserSexEnum.MAN);
        userMapper.insert(user);
    }
}
