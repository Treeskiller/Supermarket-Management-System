package com.bald.domain;

public class Gift {
    private String name;
    private Integer point;
    private Integer price;
    private Integer number;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Gift{" +
                "name='" + name + '\'' +
                ", point=" + point +
                ", price=" + price +
                ", number=" + number +
                '}';
    }
}
