package com.myshop.model.enums;

public enum OrderStatus {
	Done("Виконано"),
	IN_processing("В обробці"),
	Sent("Відправлено");
	
	public String name;

	OrderStatus(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
