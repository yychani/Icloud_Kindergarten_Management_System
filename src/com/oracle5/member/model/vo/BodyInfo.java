package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class BodyInfo implements Serializable{
	private int biNo;
	private int cId;
	private double height;
	private double weight;
	private Date biDate;
	private String cName;
}
