package com.myshop.model.enums;

public enum Size {
	SMALL("мальнький"), MIDDLE("середній"), LARGE("Великий");

	public String name;

	Size(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
