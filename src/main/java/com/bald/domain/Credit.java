package com.bald.domain;

import javax.xml.crypto.Data;
import java.util.Date;

public class Credit {
    private String transactionID;
    private Integer dailyNecessities;
    private Integer entertainment;
    private Integer food;
    private Integer CreditStatus;
    private String email;
    private Date transactionTime;

    public String getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(String transactionID) {
        this.transactionID = transactionID;
    }

    public Integer getDailyNecessities() {
        return dailyNecessities;
    }

    public void setDailyNecessities(Integer dailyNecessities) {
        this.dailyNecessities = dailyNecessities;
    }

    public Integer getEntertainment() {
        return entertainment;
    }

    public void setEntertainment(Integer entertainment) {
        this.entertainment = entertainment;
    }

    public Integer getFood() {
        return food;
    }

    public void setFood(Integer food) {
        this.food = food;
    }

    public Integer getCreditStatus() {
        return CreditStatus;
    }

    public void setCreditStatus(Integer creditStatus) {
        CreditStatus = creditStatus;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getTransactionTime() {
        return transactionTime;
    }

    public void setTransactionTime(Date transactionTime) {
        this.transactionTime = transactionTime;
    }


    @Override
    public String toString() {
        return "Credit{" +
                "transactionID='" + transactionID + '\'' +
                ", dailyNecessities=" + dailyNecessities +
                ", entertainment=" + entertainment +
                ", food=" + food +
                ", CreditStatus=" + CreditStatus +
                ", email='" + email + '\'' +
                ", transactionTime=" + transactionTime +
                '}';
    }
}
