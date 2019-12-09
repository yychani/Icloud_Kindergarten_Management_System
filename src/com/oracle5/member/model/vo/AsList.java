package com.oracle5.member.model.vo;
import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

public class AsList implements java.io.Serializable{
	private int cId;
	private Date applyDate;
	private Date approvalDate;
	private int tNo;
	private String day;
	private Date endDate;
}
