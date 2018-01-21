package com.myshop.model.enums;

public enum Color {
	Red("Червоний"),
	Orange("Помаранчевий"),
	Yellow("Жовтий"),
	Green("Зелений"),
	Blue1("Блакитний"),
	Blue("Синій"),
	Purple("Фіолетовий"),
	Pink("Рожевий"),
	White("Білий"),
	Gray("Сірий"),
	Black("Чорний"),
	Brown("Коричневий"),
	Beige("Бежевий"),
	Boardwalk("Бордовий"),
	Peachy("Персиковий"),
	Salad("Салатовий"),
	multicoloured("різнокольоровий")
;
	public String name;

	Color(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
