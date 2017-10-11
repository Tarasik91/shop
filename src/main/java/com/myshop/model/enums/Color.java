package com.myshop.model.enums;

public enum Color {
	DARK("чорний"),
	BROWN("коричневий"),
	YELLOW("жовтий");
	public String name;

	Color(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
