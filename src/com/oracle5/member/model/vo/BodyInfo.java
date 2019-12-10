package com.oracle5.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BodyInfo {
	private int biNo;
	private int cId;
	private double height;
	private double weight;
	private Date biDate;
}
