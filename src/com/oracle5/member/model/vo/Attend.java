package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Attend implements Serializable {
	private Date amDate;
	private int cId;
	private String aType;
}
