package com.bald.dao;

import com.bald.domain.Credit;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CreditDao {
    @Insert("insert into credit(transactionID,dailyNecessities,entertainment,food,CreditStatus,email) values(#{transactionID},#{dailyNecessities},#{entertainment},#{food},#{CreditStatus},#{email})")
    public void saveCreditId(Credit credit);

    //查询一个
    @Select("select * from credit where transactionID=#{transactionID}")
    public List<Credit> findTransaction(@Param("transactionID") String transactionID);

    @Insert("insert into credit(transactionID,CreditStatus,email) values(#{transactionID},#{creditStatus},#{email})")
    public void saveCreditIncludeNull(@Param("transactionID") String transactionID,@Param("creditStatus") Integer creditStatus,@Param("email") String email);

    @Select("select * from credit where email=#{email} order by transactionTime DESC")
    public List<Credit> findHistory(String email);

}
