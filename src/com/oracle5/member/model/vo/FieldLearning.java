package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class FieldLearning implements java.io.Serializable{
	private Date ftlDate;
	private int ftlId;
	private String field;
	private int ftlPay;
	private String materials;
}
