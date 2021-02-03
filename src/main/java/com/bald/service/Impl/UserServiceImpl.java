package com.bald.service.Impl;

import com.bald.dao.UserDao;
import com.bald.domain.User;
import com.bald.service.UserService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public List<User> findAll() {
        return userDao.findAll();
    }

    public List<User> findByEmail(String email,String password) {
        return userDao.findByEmail(email,password);
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public void updateUser(User user){
        userDao.updateUser(user);
    };

    public User findRepeatEmail(String email){
        return userDao.findRepeatEmail(email);
    };

    //删除用户

    public void deleteUser(String email){
        userDao.deleteUser(email);
    }

    public void updateBalance(String email){userDao.updateBalance(email);}

    public void updatePaymentPassword(String paymentPassword,String email){userDao.updatePaymentPassword(paymentPassword,email);}

    public void renewUpdate(String email,Integer memberLength,Integer Balance){userDao.renewUpdate(email,memberLength,Balance);}

    public void updatePoint(String email,Integer point,Integer experience){userDao.updatePoint(email,point,experience);}

    public void updateFlag(String email,String BindFlag){userDao.updateFlag(email,BindFlag);}

    public void updatePWD(String email,String password){userDao.updatePWD(email,password);}

}
