package com.crud.utils;

public class PhoneNumber {
	private String areaCode;
	private String prefix;
	private String number;

	public PhoneNumber(String areaCode, String prefix, String number) {
		super();
		this.areaCode = areaCode;
		this.prefix = prefix;
		this.number = number;
	}

	public PhoneNumber() {}

	@Override
	public String toString() {
		return areaCode + "\t" + prefix + "\t" + number;
	}
	
	
}
