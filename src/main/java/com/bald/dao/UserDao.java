package com.bald.dao;

import com.bald.domain.Gift;
import com.bald.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户dao接口
 */
@Repository
public interface UserDao {

    // 查询所有账户
    @Select("select * from user")
    public List<User> findAll();

    // 保存帐户信息
    @Insert("insert into user (email,username,password,sex,address) values (#{email},#{username},#{password},#{sex},#{address})")
    public void saveUser(User user);

    //查询一个
    @Select("select * from user where email=#{email} and password=#{password}")
    public List<User> findByEmail(@Param("email") String email,@Param("password") String password);

    // 更新用户
    @Update("update user set email=#{email},username=#{username},password=#{password}, point=#{point}, level=#{level}, sex=#{sex}, address=#{address} where `email`=#{email}" )
    public void updateUser(User user);

    //查询重复用户
    @Select("select * from user where email=#{email}")
    public User findRepeatEmail(String email);

    //删除用户
    @Delete("delete from user where email=#{email}")
    public void deleteUser(String email);

    //在绑定后更新用户零钱
    @Update("update user set Balance=500 where email=#{email}")
    public void updateBalance(String email);

    @Update("update user set paymentPassword=#{paymentPassword} where email=#{email}")
    public void updatePaymentPassword(@Param("paymentPassword") String paymentPassword,@Param("email") String email);


    @Update("update user set memberLength=#{memberLength},Balance=#{Balance} where email=#{email}")
    public void renewUpdate(@Param("email") String email,@Param("memberLength") Integer memberLength,@Param("Balance") Integer Balance);

    @Update("update user set point=#{point},experience=#{experience} where email=#{email}")
    public void updatePoint(@Param("email") String email,@Param("point") Integer point,@Param("experience") Integer experience);

    @Update("update user set BindFlag=#{BindFlag} where email=#{email}")
    public void updateFlag(@Param("email") String email,@Param("BindFlag") String BindFlag);

    @Update("update user set password=#{password} where email=#{email}")
    public void updatePWD(@Param ("email") String email,@Param("password") String password);

}
