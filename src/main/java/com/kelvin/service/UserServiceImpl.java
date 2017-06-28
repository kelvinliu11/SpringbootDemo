package com.kelvin.service;

import com.kelvin.dao.UserRepository;
import com.kelvin.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Lenovo on 2017/6/26.
 */
@Service
public class UserServiceImpl {
    @Autowired
    UserRepository userRepository;

    public void findUser(){
        userRepository.findByUserName("");
    }

    public void saveUser() {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
        String formattedDate = dateFormat.format(date);
        User record = userRepository.save(new User("b", "b", "b", "b",formattedDate));
        System.out.println("已经录入user数据\t" + record.toString());
//        userRepository.save(new User("aa1", "a", "aa1", "aa123456",formattedDate));
    }

    public void usingJpaWithSql() {
        List<User> users = userRepository.findByUserNameNickName("b", "aa123456");
        for (User tmp : users) {
            System.out.println(tmp.toString());
        }
    }
}
