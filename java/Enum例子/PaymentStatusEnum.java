/**
 * 
 */
package com.woyo.pay.gateway.enums.payment;

/**
 * @Description 支付状态
 * @project 	gateway-pay
 * @file 		PaymentStatusEnum.java 
 * @note		<br>
 * @develop		JDK1.6 + Eclipse 3.5
 * @version     1.0
 * Copyright 2006-2010 woyo Corporation. All rights reserved.
 * Date				Author			Changes
 * 2010-7-12		Elx.OuYang		Create
 */
public enum PaymentStatusEnum {
	
	/** 0---创建 */
	CREATE(0, "创建"),

	/** 1---支付中 */
	PROCESS(1, "支付中"),

	/** 2---支付成功 */
	SUCCESS(2, "支付成功"),

	/** 3---支付失败 */
	FAILURE(3, "支付失败"),

	/** 4---关闭支付 */
	CLOSE(4, "关闭支付"),
	
	/** 5---支付完成 */
	FINISH(5, "支付完成");
	
	private final int code;
	private final String description;

	/**
	 * 私有构造函数
	 * 
	 * @param code
	 * @param description
	 */
	PaymentStatusEnum(int code, String description) {
		this.code = code;
		this.description = description;
	}

	/**
	 * @return Returns the code.
	 */
	public int getCode() {
		return code;
	}

	/**
	 * @return Returns the description.
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * 通过枚举<code>code</code>获得枚举
	 * 
	 * @param code
	 * @return
	 */
	public static PaymentStatusEnum getByCode(int code) {
		for (PaymentStatusEnum payStatus : values()) {
			if (payStatus.getCode() == code) {
				return payStatus;
			}
		}
		return null;
	}
}
