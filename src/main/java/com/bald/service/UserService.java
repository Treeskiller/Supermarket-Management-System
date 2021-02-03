package com.bald.service;

import com.bald.domain.User;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface UserService {
    // 查询所有账户
    public List<User> findAll();

    // 查询一个账户
    public List<User> findByEmail(String email,String password);

    // 保存帐户信息
    public void saveUser(User user);

    //更新账户
    public void updateUser(User user);

    //查询重复
    public User findRepeatEmail(String email);

    //删除用户
    public void deleteUser(String email);

    public void updateBalance(String email);

    public void updatePaymentPassword(String paymentPassword,String email);

    public void renewUpdate(String email,Integer memberLength,Integer Balance);

    public void updatePoint(String email,Integer point,Integer experience);

    public void updateFlag(String email,String BindFlag);

    public void updatePWD(String email,String password);
}
