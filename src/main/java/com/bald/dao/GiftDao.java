package com.bald.dao;

import com.bald.domain.Gift;
import com.bald.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 礼物dao接口
 */
@Repository
public interface GiftDao {

    // 查询所有礼物
    @Select("select * from gift")
    public List<Gift> findAll();

    // 更新礼物
    @Update("update gift set name=#{name},point=#{point},price=#{price}, number=#{number} where `name`=#{name}")
    public void updateGift(Gift gift);

    //查询一个
    @Select("select * from gift where name=#{name}")
    public Gift findByName(String name);

}
