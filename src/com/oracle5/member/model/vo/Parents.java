package com.oracle5.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Parents implements Serializable{
	private int pNo;
	private String pApproval;
	private String pAddress;
	private Date pEntDate;
}
