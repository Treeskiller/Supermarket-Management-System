package com.bald.service.Impl;

import com.bald.dao.PaymentDao;
import com.bald.domain.Payment;
import com.bald.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private PaymentDao paymentdao;
    public void savePayment(Payment payment){paymentdao.savePayment(payment);}

    public List<Payment> findPayment(String email){return paymentdao.findPayment(email);}

}
