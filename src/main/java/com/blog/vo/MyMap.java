package com.blog.vo;

public class MyMap {
    String key = null;
    String value = null;

    public MyMap(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "MyMap{" +
                "key='" + key + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
