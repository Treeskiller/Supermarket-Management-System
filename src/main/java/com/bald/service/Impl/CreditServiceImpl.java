package com.bald.service.Impl;

import com.bald.dao.CreditDao;
import com.bald.domain.Credit;
import com.bald.service.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class CreditServiceImpl implements CreditService {
    @Autowired
    private CreditDao creditdao;

    public void saveCreditId(Credit credit) {
        creditdao.saveCreditId(credit);
    }

    public List<Credit> findTransaction(String transactionID){ return creditdao.findTransaction(transactionID);}

    public void saveCreditIncludeNull(String transactionID,Integer creditStatus,String email){creditdao.saveCreditIncludeNull(transactionID,creditStatus,email);}

    public List<Credit> findHistory(String email){return creditdao.findHistory(email);}
}
