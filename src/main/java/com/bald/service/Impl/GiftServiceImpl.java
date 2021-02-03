package com.bald.service.Impl;

import com.bald.dao.GiftDao;

import com.bald.domain.Gift;

import com.bald.service.GiftService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("giftService")
public class GiftServiceImpl implements GiftService {
    @Autowired
    private GiftDao giftDao;

    public List<Gift> findAll() {
        return giftDao.findAll();
    }

    public void updateGift(Gift gift) {
        giftDao.updateGift(gift);
    }

    // 查询一个礼物
    public Gift findByName(String name){
        return giftDao.findByName(name);
    };


}
