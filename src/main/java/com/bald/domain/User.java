package com.bald.domain;

public class User {
    private String email;
    private String username;
    private String password;
    private Integer point;
    private Integer level;
    private String sex;
    private String address;
    private Integer Balance;
    private Integer memberLength;
    private String paymentPassword;
    private String BindFlag;
    private Integer experience;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getBalance() {
        return Balance;
    }

    public void setBalance(Integer balance) {
        Balance = balance;
    }

    public Integer getMemberLength() {
        return memberLength;
    }

    public void setMemberLength(Integer memberLength) {
        this.memberLength = memberLength;
    }

    public String getPaymentPassword() {
        return paymentPassword;
    }

    public void setPaymentPassword(String paymentPassword) {
        this.paymentPassword = paymentPassword;
    }

    public String getBindFlag() {
        return BindFlag;
    }

    public void setBindFlag(String bindFlag) {
        BindFlag = bindFlag;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", point=" + point +
                ", level=" + level +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", Balance=" + Balance +
                ", memberLength=" + memberLength +
                ", paymentPassword='" + paymentPassword + '\'' +
                ", BindFlag='" + BindFlag + '\'' +
                ", experience=" + experience +
                '}';
    }
}
