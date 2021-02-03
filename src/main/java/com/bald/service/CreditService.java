package com.bald.service;

import com.bald.domain.Credit;

import java.util.List;

public interface CreditService {
    public void saveCreditId(Credit credit);

    public List<Credit> findTransaction(String transactionID);

    public void saveCreditIncludeNull(String transactionID,Integer creditStatus,String email);

    public List<Credit> findHistory(String email);
}
