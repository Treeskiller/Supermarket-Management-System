package com.bald.dao;

import com.bald.domain.Payment;
import com.bald.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentDao {

    @Insert("insert into payment (creditCardNumber,paymentPassword,phoneNumber, email) values (#{creditCardNumber},#{paymentPassword},#{phoneNumber},#{email})")
    public void savePayment(Payment payment);

    @Select("select * from payment where email=#{email)")
    public List<Payment> findPayment(String email);
}
