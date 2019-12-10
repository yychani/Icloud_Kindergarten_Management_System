package com.oracle5.task.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class FieldTripLearning implements Serializable{
	private Date ftlDate;
	private int ftlId;
	private String field;
	private int ftlPay;
	private String materials;
	private String date;
}
