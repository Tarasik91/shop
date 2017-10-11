package com.myshop.model.enums;

public enum DeliveryType {
	NEW_MAIL("Нова пошта"),
	UKR_MAIL("Укр пошта"),
	SELF("самовивіз");
	
	private String name;

	DeliveryType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }	
}
