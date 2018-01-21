package com.myshop.model.enums;

public enum Size {
	ONE("56"), Two("62"), Three("68"), Four("74"), Five("80"), Six("86"), Seven("92"), Eight("98"), Nine("104"), Ten("110"), Eleven("116"), Twelve("128"), Thirteen("134"), Fourteen("140"), Fifteen("146"), Sixteen("42"), Seventeen("44"), Eighteen("46");

	public String name;

	Size(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
