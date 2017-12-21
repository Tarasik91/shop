package com.myshop.model.enums;

public enum OrderingType {
	PRICE_A("Ціна від найнижчої", "sellingPrice"), 
	PRICE_D("Ціна від найвищої", "sellingPrice desc"), 
	//RATING_A("Рейтинг від найнижчої", "rating"), 
	//RATING_D("Рейтинг від найнижчої", "rating"), 
	DATE_A("дата від старішого", "rating"), 
	DATE_D("дата від новішого", "rating"), 
	NAME_A("по імені А - Я", "name"), 
	NAME_D("по імені Я - А", "name desc");
	
	public String name;
	public String sql;

	OrderingType(String name, String sql) {
		this.name = name;
		this.sql = sql;
	}

	public String getName() {
		return name;
	}
	
	public String getSql() {
		return sql;
	}
}
