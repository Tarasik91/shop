package com.myshop.model.enums;

public enum PaidType {
	CASH("Готівка"),
	BANK("на карту приватбанку");
	
	
	public String name;
	
	PaidType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }	
}
