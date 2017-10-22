package com.myshop.model.enums;

public enum DeliveryType {
	UKR_MAIL("Укр пошта"),
	NEW_MAIL("Нова пошта"),
	SELF("самовивіз");
	
	private String name;

	DeliveryType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }	
}
