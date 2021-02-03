package com.bald.service;

import com.bald.domain.Payment;

import java.util.List;


public interface PaymentService {
    public void savePayment(Payment payment);

    public List<Payment> findPayment(String email);
}
