package com.myshop.model.enums;

public enum OrderStatus {
	CANCEL("Відмінений"),
	IN_WAIT("В очікуванні"),
	CLOSED("Закритий");
	
	public String name;

	OrderStatus(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
