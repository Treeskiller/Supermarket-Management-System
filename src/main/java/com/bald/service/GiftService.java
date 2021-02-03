package com.bald.service;

import com.bald.domain.Gift;
import com.bald.domain.User;

import java.util.List;

public interface GiftService {
    // 查询所有礼物
    public List<Gift> findAll();

    //更新礼物
    public void updateGift(Gift gift);

    // 查询一个礼物
    public Gift findByName(String name);
}
