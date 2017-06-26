//package com.kelvin;
//
//import com.kelvin.dao.UserRepository;
//import com.kelvin.domain.User;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.text.DateFormat;
//import java.util.Date;
//
///**
// * 该类适用于测试Mysql&Jpa
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringBootTest
//public class UserRepositoryTests {
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Test
//    public void test() throws Exception {
//        Date date = new Date();
//        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
//        String formattedDate = dateFormat.format(date);
//
//        userRepository.deleteAll();
//
//        userRepository.save(new User("aa1", "aa@126.com", "aa", "aa123456",formattedDate));
//        userRepository.save(new User("bb2", "bb@126.com", "bb", "bb123456",formattedDate));
//        userRepository.save(new User("cc3", "cc@126.com", "cc", "cc123456",formattedDate));
//
//        Assert.assertEquals("bb123456", userRepository.findByUserNameAndEmail("bb2", "bb@126.com").get(0).getNickName());
//    }
//
//}